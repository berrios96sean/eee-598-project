#ifndef LOGISTIC_REGRESSION_H
#define LOGISTIC_REGRESSION_H

#include <hls_stream.h>
#include <hls_math.h>
#include <ap_fixed.h>
#include <ap_axi_sdata.h>

typedef ap_fixed<32, 8> fixed_8_t; 
typedef ap_fixed<32, 2> fixed_2_t; 

typedef ap_axis<16, 0, 0, 0> axis_pkt; 
typedef ap_fixed<16, 2> input_t; 

void logistic_regression(hls::stream<axis_pkt>& in_stream, hls::stream<axis_pkt>& out_stream);

#endif // LOGISTIC_REGRESSION_H