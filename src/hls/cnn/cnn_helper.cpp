#include "cnn.h"

void convolution(uint8_t input[INPUT_FEATURES], uint8_t kernel[KERNEL_SIZE], int16_t output[HIDDEN_LAYER_NEURONS]) {
    #pragma HLS PIPELINE
	#pragma HLS ARRAY_PARTITION variable=input complete
	#pragma HLS ARRAY_PARTITION variable=kernel complete dim=1
    for (int i = 0; i < HIDDEN_LAYER_NEURONS; i++) {
        output[i] = 0;
        for (int j = 0; j < KERNEL_SIZE; j++) {
		#pragma HLS UNROLL
            output[i] += input[i + j] * kernel[j];
        }
    }
}

void relu(int16_t input[HIDDEN_LAYER_NEURONS], uint8_t output[HIDDEN_LAYER_NEURONS]) {
    #pragma HLS PIPELINE
    for (int i = 0; i < HIDDEN_LAYER_NEURONS; i++) {
        if (input[i] < 0)
            output[i] = 0;
        else
            output[i] = (uint8_t)input[i];
    }
}

void batch_normalization(int16_t input[HIDDEN_LAYER_NEURONS], int16_t output[HIDDEN_LAYER_NEURONS],
                         int16_t mean[HIDDEN_LAYER_NEURONS], int16_t variance[HIDDEN_LAYER_NEURONS],
                         float gamma[HIDDEN_LAYER_NEURONS], float beta[HIDDEN_LAYER_NEURONS]) {
    #pragma HLS PIPELINE
    for (int i = 0; i < HIDDEN_LAYER_NEURONS; i++) {
        float normalized = (input[i] - mean[i]) / sqrt_approx(variance[i] + 1e-5);
        output[i] = (int16_t)(normalized * gamma[i] + beta[i]);
    }
}


void max_pooling(uint8_t input[HIDDEN_LAYER_NEURONS], uint8_t output[HIDDEN_LAYER_NEURONS / 2]) {
    #pragma HLS PIPELINE
	#pragma HLS ARRAY_PARTITION variable=input complete dim=1
    for (int i = 0; i < HIDDEN_LAYER_NEURONS / 2; i++) {
		#pragma HLS UNROLL factor=2
        output[i] = (input[2 * i] > input[2 * i + 1]) ? input[2 * i] : input[2 * i + 1];
    }
}

void fully_connected(uint8_t input[HIDDEN_LAYER_NEURONS / 2], int16_t weights[OUTPUT_CLASSES][HIDDEN_LAYER_NEURONS / 2], int16_t output[OUTPUT_CLASSES]) {
    #pragma HLS PIPELINE II=2
	#pragma HLS ARRAY_PARTITION variable=weights block factor=8 dim=1
	#pragma HLS ARRAY_PARTITION variable=input complete dim=1

	for (int i = 0; i < OUTPUT_CLASSES; i++) {
        output[i] = 0;
		#pragma HLS UNROLL factor=2
        for (int j = 0; j < HIDDEN_LAYER_NEURONS / 2; j++) {
			#pragma HLS UNROLL factor=8
			#pragma HLS BIND_OP variable=input[j] op=mul
			#pragma HLS BIND_OP variable=weights[i][j] op=mul
        	output[i] += input[j] * weights[i][j];
        }
    }
}


int sqrt_approx(int value) {
    int result = 0;
    int bit = 1 << 30;
    while (bit > value) {
        bit >>= 2;
    }
    while (bit != 0) {
        int temp = result + bit;
        result >>= 1;
        if (value >= temp) {
            value -= temp;
            result += bit;
        }
        bit >>= 2;
    }
    return result;
}

