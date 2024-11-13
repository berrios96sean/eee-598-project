#include "gradient_boost.h"
#include <stdio.h>
#include <hls_math.h>
DecisionStump stumps[] = {
    {0, 1.5, 1, 0.1},  {1, 0.8, 0, 0.1},  {2, 2.3, 1, 0.1},  {3, 1.0, 0, 0.1},
    {4, 1.2, 1, 0.1},  {5, 1.8, 0, 0.1},  {6, 0.9, 1, 0.1},  {7, 0.5, 0, 0.1},
    {8, 2.0, 1, 0.1},  {9, 1.6, 0, 0.1},  {0, 1.4, 1, 0.1},  {1, 0.7, 0, 0.1},
    {2, 2.1, 1, 0.1},  {3, 0.9, 0, 0.1},  {4, 1.1, 1, 0.1},  {5, 1.7, 0, 0.1},
    {6, 0.6, 1, 0.1},  {7, 1.0, 0, 0.1},  {8, 1.9, 1, 0.1},  {9, 0.8, 0, 0.1}
};

const int NUM_STUMPS = 20;
const int NUM_FEATURES = 10;


ap_fixed<16, 8> sigmoid(ap_fixed<16, 8> x) {
    return 1 / (1 + hls::exp(-x));
}

void gradient_boost(hls::stream<uint8_t> &input, hls::stream<uint8_t> &output) {
    #pragma HLS INTERFACE axis port=input
    #pragma HLS INTERFACE axis port=output

    uint8_t input_buffer[NUM_FEATURES];
    #pragma HLS ARRAY_PARTITION variable=input_buffer complete

    for (int i = 0; i < NUM_FEATURES; i++) {
        input.read(input_buffer[i]);
    }

    ap_fixed<16, 8> prediction_sum = 0.0;


    for (int i = 0; i < NUM_STUMPS; i++) {
        #pragma HLS UNROLL
        int prediction = (input_buffer[stumps[i].feature_index] < stumps[i].threshold) ? stumps[i].polarity : -stumps[i].polarity;
        prediction_sum += stumps[i].weight * (prediction == 1 ? 1 : -1);
    }

    ap_fixed<16, 8> probability = sigmoid(prediction_sum);

    uint8_t final_class = (probability >= 0.5) ? 1 : 0;
    output.write(final_class);
}
