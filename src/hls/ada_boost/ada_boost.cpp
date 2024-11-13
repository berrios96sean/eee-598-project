#include "ada_boost.h"
#include <stdio.h>

DecisionStump stumps[] = {
    {0, 1.5, 1, 0.9},  {1, 0.8, 0, 0.7},  {2, 2.3, 1, 0.5},  {3, 1.0, 0, 0.6},
    {4, 1.2, 1, 0.4},  {5, 1.8, 0, 0.3},  {6, 0.9, 1, 0.2},  {7, 0.5, 0, 0.1},
    {8, 2.0, 1, 0.8},  {9, 1.6, 0, 0.5},  {0, 1.4, 1, 0.6},  {1, 0.7, 0, 0.4},
    {2, 2.1, 1, 0.3},  {3, 0.9, 0, 0.2},  {4, 1.1, 1, 0.1},  {5, 1.7, 0, 0.5},
    {6, 0.6, 1, 0.4},  {7, 1.0, 0, 0.3},  {8, 1.9, 1, 0.2},  {9, 0.8, 0, 0.1}
};

const int NUM_STUMPS = 20;
const int NUM_FEATURES = 10;

void ada_boost(hls::stream<uint8_t> &input, hls::stream<uint8_t> &output) {
    #pragma HLS INTERFACE axis port=input
    #pragma HLS INTERFACE axis port=output

	#pragma HLS DATAFLOW
    uint8_t input_buffer[NUM_FEATURES];
    #pragma HLS ARRAY_PARTITION variable=input_buffer complete

    read_input: for (int i = 0; i < NUM_FEATURES; i++) {
        input.read(input_buffer[i]);
    }

    ap_fixed<16, 8> weighted_sum = 0.0;

    for (int i = 0; i < NUM_STUMPS; i++) {
		#pragma HLS PIPELINE
        int prediction = (input_buffer[stumps[i].feature_index] < stumps[i].threshold) ? stumps[i].polarity : -stumps[i].polarity;
        weighted_sum += stumps[i].alpha * (prediction == 1 ? 1 : -1);
    }

    uint8_t final_class = (weighted_sum >= 0) ? 1 : 0;
    output.write(final_class);
}
