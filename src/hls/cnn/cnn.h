#ifndef CNN_H
#define CNN_H

#include "hls_stream.h"
#include "ap_int.h"

#define INPUT_FEATURES 10
#define KERNEL_SIZE 3
#define HIDDEN_LAYER_NEURONS 5
#define OUTPUT_CLASSES 2

typedef ap_uint<8> uint8_t;
typedef ap_int<16> int16_t;

void convolution(uint8_t input[INPUT_FEATURES], uint8_t kernel[KERNEL_SIZE], int16_t output[HIDDEN_LAYER_NEURONS]);
void relu(int16_t input[HIDDEN_LAYER_NEURONS], uint8_t output[HIDDEN_LAYER_NEURONS]);
void max_pooling(uint8_t input[HIDDEN_LAYER_NEURONS], uint8_t output[HIDDEN_LAYER_NEURONS / 2]);
void batch_normalization(int16_t input[HIDDEN_LAYER_NEURONS], int16_t output[HIDDEN_LAYER_NEURONS],
                         int16_t mean[HIDDEN_LAYER_NEURONS], int16_t variance[HIDDEN_LAYER_NEURONS],
                         float gamma[HIDDEN_LAYER_NEURONS], float beta[HIDDEN_LAYER_NEURONS]);
void fully_connected(uint8_t input[HIDDEN_LAYER_NEURONS / 2], int16_t weights[OUTPUT_CLASSES][HIDDEN_LAYER_NEURONS / 2], int16_t output[OUTPUT_CLASSES]);
void cnn(uint8_t input[INPUT_FEATURES], int16_t output[OUTPUT_CLASSES]);
int sqrt_approx(int value);
#endif // CNN_H
