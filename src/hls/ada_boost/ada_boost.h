#ifndef ADA_BOOST_H
#define ADA_BOOST_H

#include <hls_stream.h>
#include <hls_math.h>
#include <ap_fixed.h>
#include <ap_axi_sdata.h>

typedef ap_fixed<16, 2> fixed_t; 
typedef ap_axis<16, 0, 0, 0> axis_pkt; 
typedef ap_fixed<16, 2> input_t; 

struct Stump {
    ap_int<4> feature; 
    fixed_t threshold; 
    fixed_t weight; 
    ap_int<1> polarity; 
};

void adaboost(hls::stream<axis_pkt>& in_stream, hls::stream<axis_pkt>& out_stream);

#endif // ADA_BOOST_H