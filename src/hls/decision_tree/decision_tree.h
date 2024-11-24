#ifndef DECISION_TREE_H
#define DECISION_TREE_H

#include <hls_stream.h>
#include <ap_fixed.h>
#include <ap_axi_sdata.h>

typedef ap_fixed<16, 2> fixed_t; 
typedef ap_axis<16, 0, 0, 0> axis_pkt; 
typedef ap_fixed<16, 2> input_t; 

struct Node {
    ap_int<4> feature; // 4 bits      feature index (-2 to 8)
    fixed_t threshold; // 16 bits      threshold
    ap_int<5> left; // 5 bits      left child index (-1 to 14)
    ap_int<5> right; // 5 bits      right child index (-1 to 14)
    ap_uint<1> class_label; // 1 bit      class label (0 or 1)
};

void decision_tree(hls::stream<axis_pkt>& in_stream, hls::stream<axis_pkt>& out_stream);

#endif // DECISION_TREE_H