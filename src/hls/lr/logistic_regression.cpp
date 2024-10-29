#include "logistic_regression.h"


#define N_FEATURES 128
#define WEIGHTS_SIZE (N_FEATURES + 1) // Include bias weight (weights + bias)

typedef ap_axis<32, 0, 0, 0> axis_pkt;
typedef ap_fixed<16, 8> fixed_t; // 16-bit fixed-point type with 8 integer bits

// Top-level function definition
void logistic_regression(hls::stream<axis_pkt> &in_stream,
                         hls::stream<axis_pkt> &out_stream,
                         float weights[WEIGHTS_SIZE]) {
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS INTERFACE bram port=weights
    #pragma HLS PIPELINE

    // Input packet
    axis_pkt input_pkt;
    fixed_t features[N_FEATURES];

    // Read input features from AXI-Stream
    for (int i = 0; i < N_FEATURES; i++) {
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
    fixed_t linear_sum = weights[0]; // Bias term
    for (int i = 0; i < N_FEATURES; i++) {
        #pragma HLS UNROLL factor=4
        linear_sum += (fixed_t)weights[i + 1] * features[i]; // Convert weights to fixed_t for multiplication
    }

    // Apply sigmoid function
    float probability = 1.0 / (1.0 + hls::expf(-linear_sum.to_float()));

    // Debug: Print linear sum and probability before rounding
    std::cout << " Design Probabilities" << std::endl;
    std::cout << "---------------------------------------------" << std::endl;
    std::cout << "  Linear Sum: " << linear_sum << "\n  Probability (before rounding): " << probability << std::endl;
    std::cout << "---------------------------------------------" << std::endl;

    // Classify based on threshold of 0.5
    float output;
    if (probability >= 0.5f) {
        output = 1.0f; // Classify as 1
    } else {
        output = 0.0f; // Classify as 0
    }

    // Write output to AXI-Stream
    axis_pkt output_pkt;
    union {
        float f;
        uint32_t i;
    } output_cast;
    output_cast.f = output;
    output_pkt.data = output_cast.i;
    output_pkt.last = 1;
    out_stream.write(output_pkt);
}
