#ifndef GRADIENT_BOOST_H
#define GRADIENT_BOOST_H

#include <hls_stream.h>
#include <ap_fixed.h>
#include <stdint.h>

struct DecisionStump {
    uint8_t feature_index;
    ap_fixed<8, 4> threshold; 
    uint8_t polarity; // 1 or 0 (0 represents -1)
    ap_fixed<8, 4> weight; 
};


void gradient_boost(hls::stream<uint8_t> &input, hls::stream<uint8_t> &output);

ap_fixed<16, 8> sigmoid(ap_fixed<16, 8> x);

#endif // GRADIENT_BOOST_H
