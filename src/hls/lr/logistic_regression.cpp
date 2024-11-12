#include "logistic_regression.h"

#define N_FEATURES 32
#define WEIGHTS_SIZE (N_FEATURES + 1) // Include bias weight (weights + bias)

typedef ap_axis<32, 0, 0, 0> axis_pkt;
typedef ap_fixed<16, 8> fixed_t; // 16-bit fixed-point type with 8 integer bits
typedef ap_int<16> fixed_int16_t; // 16-bit fixed-point integer type for weights
typedef ap_int<8> fixed_int8_t;   // 8-bit fixed-point integer type for inputs

// Top-level function definition
void logistic_regression(hls::stream<axis_pkt> &in_stream,
                         hls::stream<axis_pkt> &out_stream,
                         fixed_int16_t weights[WEIGHTS_SIZE]) {
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS INTERFACE bram port=weights
    #pragma HLS DATAFLOW
    #pragma HLS bind_storage variable=weights type=ram_2p impl=bram

    // Input packet
    axis_pkt input_pkt;
    fixed_int8_t features[N_FEATURES];
    #pragma HLS ARRAY_PARTITION variable=features complete // Fully partition to optimize parallel access

    // Read input features from AXI-Stream
    read_input_features: for (int i = 0; i < N_FEATURES; i++) {
        #pragma HLS PIPELINE II=1
        input_pkt = in_stream.read();
        features[i] = *((fixed_int8_t*)&input_pkt.data); // Convert the data to int8 type
    }

    // Perform logistic regression computation
    fixed_t partial_sums[N_FEATURES];
    #pragma HLS ARRAY_PARTITION variable=partial_sums complete
    #pragma HLS bind_op variable=partial_sums op=mul impl=fabric // Force the use of LUTs for multiplication instead of DSPs

    // Calculate partial products
    compute_partial_products: for (int i = 0; i < N_FEATURES; i++) {
        #pragma HLS UNROLL
        #pragma HLS allocation operation instances=mul limit=10
        partial_sums[i] = (fixed_t)weights[i + 1] * (fixed_t)features[i];
    }

    // Accumulate partial sums
    fixed_t linear_sum = (fixed_t)weights[0]; // Bias term
    accumulate_partial_sums: for (int i = 0; i < N_FEATURES; i++) {
        #pragma HLS UNROLL
        linear_sum += partial_sums[i];
    }

    // Apply sigmoid function using an approximation to reduce DSP usage
    fixed_t abs_linear_sum = (linear_sum >= fixed_t(0)) ? linear_sum : (fixed_t)(-linear_sum); // Replace hls::abs with a manual absolute calculation to avoid return value function
    fixed_t probability = fixed_t(0.5) + linear_sum / (fixed_t(4.0) + abs_linear_sum); // Fixed-point sigmoid approximation to reduce resource usage

    // Classify based on threshold of 0.5
    float output = (probability.to_float() >= 0.5f) ? 1.0f : 0.0f;

    // Write output to AXI-Stream
    axis_pkt output_pkt;
    output_pkt.data = *((uint32_t*)&output);
    output_pkt.last = 1;
    out_stream.write(output_pkt);
}
