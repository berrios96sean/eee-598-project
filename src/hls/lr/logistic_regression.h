// Header file for logistic_regression function
#ifndef LOGISTIC_REGRESSION_H
#define LOGISTIC_REGRESSION_H

#include <hls_stream.h>   // Required for hls::stream
#include <hls_math.h>     // Required for hls::expf used in sigmoid
#include <ap_axi_sdata.h> // Required for ap_axis type
#include <ap_fixed.h>

#define N_FEATURES 128
#define WEIGHTS_SIZE (N_FEATURES + 1) // Include bias weight (weights + bias)

typedef ap_axis<32, 0, 0, 0> axis_pkt;
typedef ap_fixed<16, 8> fixed_t; // 16-bit fixed-point type with 8 integer bits
typedef ap_int<16> fixed_int16_t; // Use fixed-point integer type for weights to reduce DSP usage

// Top-level function prototype
// Top-level function prototype
void logistic_regression(hls::stream<axis_pkt> &in_stream,
                         hls::stream<axis_pkt> &out_stream,
                         fixed_int16_t weights[WEIGHTS_SIZE]);



#endif // LOGISTIC_REGRESSION_H
