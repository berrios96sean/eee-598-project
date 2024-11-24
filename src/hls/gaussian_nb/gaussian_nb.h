#ifndef GAUSSIAN_NB_H
#define GAUSSIAN_NB_H

#include <hls_stream.h>
#include <ap_fixed.h>
#include <ap_axi_sdata.h>
#include <hls_math.h>


typedef ap_fixed<16, 2> input_t; 
typedef ap_fixed<16, 4> fixed_s4_t; 
typedef ap_fixed<32, 4> fixed_4_t; 
// typedef ap_fixed<32, 8> log_fixed_t; 
typedef ap_fixed<32, 10> fixed_10_t; 
typedef ap_fixed<32, 8> fixed_8_t; 
typedef ap_fixed<32, 16> fixed_16_t;
typedef ap_fixed<64, 16> fixed_l16_t; 

typedef ap_axis<16, 0, 0, 0> axis_pkt; 

void gaussian_nb(hls::stream<axis_pkt>& in_stream, hls::stream<axis_pkt>& out_stream);

#endif // GAUSSIAN_NB_H