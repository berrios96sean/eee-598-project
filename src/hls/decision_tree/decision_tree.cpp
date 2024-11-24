#include "decision_tree.h"

const int num_features = 10;
const int num_nodes = 15;

const Node tree[num_nodes] = {
    {6, 0.0151515151, 1, 8, 1}, // Root node
    {2, 0.0353535358, 2, 5, 1}, // Left child of root
    {4, 0.549999997, 3, 4, 1},  // Left child of node 1
    {-2, -2.0, -1, -1, 1},       // Leaf node
    {-2, -2.0, -1, -1, 0},       // Leaf node
    {5, 0.000035528742, 6, 7, 0}, // Right child of node 1
    {-2, -2.0, -1, -1, 1},       // Leaf node
    {-2, -2.0, -1, -1, 0},       // Leaf node
    {0, 0.0000247891967, 9, 12, 1}, // Right child of root
    {8, 0.00000348332509, 10, 11, 1}, // Left child of node 8
    {-2, -2.0, -1, -1, 1},       // Leaf node
    {-2, -2.0, -1, -1, 0},       // Leaf node
    {8, 0.225000001, 13, 14, 1}, // Right child of node 8
    {-2, -2.0, -1, -1, 1},       // Leaf node
    {-2, -2.0, -1, -1, 0}        // Leaf node
};

void decision_tree(hls::stream<axis_pkt>& in_stream, hls::stream<axis_pkt>& out_stream) {
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS PIPELINE II=1

    input_t X[num_features];
    #pragma HLS ARRAY_PARTITION variable=X complete dim=1

    // Read input data
    for (int i = 0; i < num_features; ++i) {
        #pragma HLS UNROLL
        axis_pkt pkt = in_stream.read();
        X[i] = pkt.data;
    }

    ap_uint<4> node_index = 0;
    while (tree[node_index].left != -1 && tree[node_index].right != -1) {
        #pragma HLS PIPELINE II=1
        if (X[tree[node_index].feature] < tree[node_index].threshold) {
            node_index = tree[node_index].left;
        } else {
            node_index = tree[node_index].right;
        }
    }

    ap_uint<1> predicted_class = tree[node_index].class_label;

    // Write output data
    axis_pkt out_pkt;
    out_pkt.data = predicted_class;
    out_pkt.last = true;
    out_stream.write(out_pkt);
}