#ifndef GAUSSIAN_NAIVE_BAYES_H
#define GAUSSIAN_NAIVE_BAYES_H

#include <hls_stream.h>
#include <ap_fixed.h>
#include <ap_axi_sdata.h>
#include <hls_math.h>
#include <cmath>

#define N_FEATURES 10
#define N_CLASSES 2
#define WEIGHTS_SIZE (N_FEATURES * N_CLASSES) // Weights include means and variances for each class

typedef ap_axis<32, 0, 0, 0> axis_pkt;
typedef ap_fixed<16, 8> fixed_t; // 16-bit fixed-point type with 8 integer bits
typedef ap_int<16> fixed_int16_t; // 16-bit fixed-point integer type for weights
typedef ap_int<8> fixed_int8_t;   // 8-bit fixed-point integer type for inputs

// Top-level function prototype
void gaussian_naive_bayes(hls::stream<axis_pkt> &in_stream,
                          hls::stream<axis_pkt> &out_stream,
                          fixed_int16_t weights_means[WEIGHTS_SIZE],
                          fixed_int16_t weights_variances[WEIGHTS_SIZE]);

// LUT-based log approximation function
inline fixed_t log_lut_approx(fixed_t x) {
    // Convert the constants to fixed-point types to avoid ambiguity
    fixed_t constant_1 = 0.693;    // ap_fixed type constant for 0.693
    fixed_t constant_2 = -0.693;   // ap_fixed type constant for -0.693

    // Approximate log using a simple piecewise linear function
    return x > 1 ? constant_1 * (x - 1) : constant_2 * (1 - x); // Simplified version
}


#endif // GAUSSIAN_NAIVE_BAYES_H
