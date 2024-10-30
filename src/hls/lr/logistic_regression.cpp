#include "logistic_regression.h"

#define N_FEATURES 64
#define WEIGHTS_SIZE (N_FEATURES + 1) // Include bias weight (weights + bias)

typedef ap_axis<32, 0, 0, 0> axis_pkt;
typedef ap_fixed<16, 8> fixed_t; // 16-bit fixed-point type with 8 integer bits

typedef ap_int<16> fixed_int16_t; // Use fixed-point integer type for weights to reduce DSP usage

// Top-level function definition
void logistic_regression(hls::stream<axis_pkt> &in_stream,
                         hls::stream<axis_pkt> &out_stream,
                         fixed_int16_t weights[WEIGHTS_SIZE]) {
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS INTERFACE bram port=weights
    #pragma HLS DATAFLOW

    // Input packet
    axis_pkt input_pkt;
    fixed_t features[N_FEATURES];
    #pragma HLS ARRAY_PARTITION variable=features complete // Fully partition to optimize parallel access

    // Read input features from AXI-Stream
    read_input_features: for (int i = 0; i < N_FEATURES; i++) {
        #pragma HLS PIPELINE II=1
        input_pkt = in_stream.read();
        union {
            uint32_t i;
            float f;
        } data_cast;
        data_cast.i = input_pkt.data;
        features[i] = data_cast.f; // Properly convert the data back to fixed-point float
    }

    // Perform logistic regression computation
    fixed_t partial_sums[N_FEATURES];
    #pragma HLS ARRAY_PARTITION variable=partial_sums complete

    // Calculate partial products
    compute_partial_products: for (int i = 0; i < N_FEATURES; i++) {
        #pragma HLS UNROLL
        partial_sums[i] = (fixed_t)weights[i + 1] * features[i];
    }

    // Accumulate partial sums
    fixed_t linear_sum = weights[0]; // Bias term
    accumulate_partial_sums: for (int i = 0; i < N_FEATURES; i++) {
        #pragma HLS UNROLL
        linear_sum += partial_sums[i];
    }

    // Apply sigmoid function using an approximation to reduce DSP usage
    fixed_t probability = fixed_t(0.5) + linear_sum / (fixed_t(4.0) + fixed_t(hls::abs(linear_sum.to_float()))); // Fixed-point sigmoid approximation to reduce resource usage

    // Classify based on threshold of 0.5
    fixed_t output = (probability.to_float() >= 0.5f) ? fixed_t(1.0f) : fixed_t(0.0f);

    // Write output to AXI-Stream
    axis_pkt output_pkt;
    union {
        float f;
        uint32_t i;
    } output_cast;
    output_cast.f = output.to_float();
    output_pkt.data = output_cast.i;
    output_pkt.last = 1;
    out_stream.write(output_pkt);
}
