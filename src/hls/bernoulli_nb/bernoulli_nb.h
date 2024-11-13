#ifndef BERNOULLI_NB_H
#define BERNOULLI_NB_H

#include <stdint.h>
#include <hls_stream.h>
#include "ap_int.h"

//typedef ap_uint<8> uint8_t;
//typedef ap_int<16> int16_t;

#define NUM_CLASSES 2      // Number of classes
#define NUM_FEATURES 10    // Number of features
#define LUT_SIZE 256       // Size of the log lookup table
#define SCALE_FACTOR 10    // Scaling factor for log values (adjustable)

extern ap_uint<8>  log_lut[LUT_SIZE];  // Log lookup table


//void bernoulli_nb(uint8_t input[NUM_FEATURES], int8_t output[NUM_CLASSES]);
void bernoulli_nb(hls::stream<ap_uint<8>> &input, hls::stream<ap_uint<16>> &output);

#endif // BERNOULLI_NB_H
