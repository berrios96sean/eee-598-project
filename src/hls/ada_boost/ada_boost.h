#ifndef ADA_BOOST_H
#define ADA_BOOST_H

#include <hls_stream.h>
#include <ap_fixed.h>
#include <stdint.h>

struct DecisionStump {
    uint8_t feature_index;
    ap_fixed<8, 4> threshold; 
    uint8_t polarity; // 1 or 0 (0 represents  -1)
    ap_fixed<8, 4> alpha; 
};


void ada_boost(hls::stream<uint8_t> &input, hls::stream<uint8_t> &output);

#endif 