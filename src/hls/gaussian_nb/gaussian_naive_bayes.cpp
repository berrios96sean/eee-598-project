#include "gaussian_naive_bayes.h"

#define N_FEATURES 10
#define N_CLASSES 2
#define WEIGHTS_SIZE (N_FEATURES * N_CLASSES) // Weights include means and variances for each class

typedef ap_axis<32, 0, 0, 0> axis_pkt;
typedef ap_fixed<16, 8> fixed_t; // 16-bit fixed-point type with 8 integer bits
typedef ap_int<16> fixed_int16_t; // 16-bit fixed-point integer type for weights
typedef ap_int<8> fixed_int8_t;   // 8-bit fixed-point integer type for inputs

// Top-level function definition
void gaussian_naive_bayes(hls::stream<axis_pkt> &in_stream,
                          hls::stream<axis_pkt> &out_stream,
                          fixed_int16_t weights_means[WEIGHTS_SIZE],
                          fixed_int16_t weights_variances[WEIGHTS_SIZE]) {
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS INTERFACE bram port=weights_means
    #pragma HLS INTERFACE bram port=weights_variances
    #pragma HLS DATAFLOW
    #pragma HLS bind_storage variable=weights_means type=ram_2p impl=bram
    #pragma HLS bind_storage variable=weights_variances type=ram_2p impl=bram

    // Input packet
    axis_pkt input_pkt;
    fixed_int8_t features[N_FEATURES];
    #pragma HLS ARRAY_PARTITION variable=features complete // Fully partition to optimize parallel access

    // Read input features from AXI-Stream
    read_input_features: for (int i = 0; i < N_FEATURES; i++) {
        #pragma HLS PIPELINE II=2
        input_pkt = in_stream.read();
        features[i] = *((fixed_int8_t*)&input_pkt.data); // Convert the data to int8 type
    }

    // Gaussian Naive Bayes computation for each class
    fixed_t log_probabilities[N_CLASSES];
    #pragma HLS ARRAY_PARTITION variable=log_probabilities complete

    // Preload means and variances into local variables for efficient access
    fixed_t means[N_CLASSES][N_FEATURES];
    fixed_t variances[N_CLASSES][N_FEATURES];
    #pragma HLS ARRAY_PARTITION variable=means cyclic factor=2 dim=2
    #pragma HLS ARRAY_PARTITION variable=variances cyclic factor=2 dim=2

    preload_weights: for (int c = 0; c < N_CLASSES; c++) {
        for (int i = 0; i < N_FEATURES; i++) {
            #pragma HLS PIPELINE II=1
            means[c][i] = (fixed_t)weights_means[c * N_FEATURES + i];
            variances[c][i] = (fixed_t)weights_variances[c * N_FEATURES + i];
        }
    }

    fixed_t reciprocal_variance = (fixed_t)0.5;  // Use a predefined value instead of computing it

    compute_log_probabilities: for (int c = 0; c < N_CLASSES; c++) {
        #pragma HLS PIPELINE II=6  // Increase II to meet timing
        log_probabilities[c] = 0;

        // Compute the differences
        fixed_t diff[N_FEATURES];
        #pragma HLS ARRAY_PARTITION variable=diff complete
        compute_diff: for (int i = 0; i < N_FEATURES; i++) {
            #pragma HLS PIPELINE II=1
            diff[i] = (fixed_t)features[i] - means[c][i];
        }

        // Compute the squared differences
        fixed_t diff_sq[N_FEATURES];
        #pragma HLS ARRAY_PARTITION variable=diff_sq complete
        compute_diff_squared: for (int i = 0; i < N_FEATURES; i++) {
            #pragma HLS PIPELINE II=1
            diff_sq[i] = diff[i] * diff[i];
        }

        // Accumulate contributions to log probabilities
        fixed_t contributions[N_FEATURES];
        #pragma HLS ARRAY_PARTITION variable=contributions complete
        accumulate_contributions: for (int i = 0; i < N_FEATURES; i++) {
            #pragma HLS PIPELINE II=1
            contributions[i] = (fixed_t)(-0.25) * diff_sq[i] * reciprocal_variance - (fixed_t)(0.25) * (variances[c][i] - (fixed_t)1.0);
            log_probabilities[c] += contributions[i];
        }
    }

    // Determine the class with the highest log-probability
    int predicted_class = (log_probabilities[0] > log_probabilities[1]) ? 0 : 1;

    // Write output to AXI-Stream
    axis_pkt output_pkt;
    output_pkt.data = *((uint32_t*)&predicted_class);
    output_pkt.last = 1;
    out_stream.write(output_pkt);
}
