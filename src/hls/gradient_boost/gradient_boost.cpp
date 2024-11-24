#include "gradient_boost.h"

const int num_features = 10;
const int num_trees = 3;
const int num_nodes = 15;

const Tree trees[num_trees] = {
    {
        {
            {6, 0.2373737395, 1, 8, 0.0},
            {0, 0.1286235154, 2, 5, 0.0},
            {1, 0.6152042150, 3, 4, 0.0},
            {-2, -2.0, -1, -1, -1.9856512911},
            {-2, -2.0, -1, -1, -0.2497286334},
            {0, 0.5019526482, 6, 7, 0.0},
            {-2, -2.0, -1, -1, 1.9996708597},
            {-2, -2.0, -1, -1, 1.9996708597},
            {0, 0.0000286029, 9, 12, 0.0},
            {2, 0.0757575762, 10, 11, 0.0},
            {-2, -2.0, -1, -1, -1.9986242187},
            {-2, -2.0, -1, -1, 1.9996708597},
            {0, 0.0000324166, 13, 14, 0.0},
            {-2, -2.0, -1, -1, 1.7496708530},
            {-2, -2.0, -1, -1, 1.9996708597}
        }
    },
    {
        {
            {6, 0.2373737395, 1, 8, 0.0},
            {0, 0.1286235154, 2, 5, 0.0},
            {1, 0.7608265281, 3, 4, 0.0},
            {-2, -2.0, -1, -1, -1.8039224165},
            {-2, -2.0, -1, -1, 2.0249498339},
            {0, 0.5482760072, 6, 7, 0.0},
            {-2, -2.0, -1, -1, 1.8184882151},
            {-2, -2.0, -1, -1, 1.8184882151},
            {0, 0.0000286029, 9, 12, 0.0},
            {2, 0.0757575762, 10, 11, 0.0},
            {-2, -2.0, -1, -1, -1.8173909463},
            {-2, -2.0, -1, -1, 1.8184882151},
            {0, 0.0000324166, 13, 14, 0.0},
            {-2, -2.0, -1, -1, 1.5872828713},
            {-2, -2.0, -1, -1, 1.8184882151}
        }
    },
    {
        {
            {6, 0.2373737395, 1, 8, 0.0},
            {0, 0.1286235154, 2, 5, 0.0},
            {1, 0.5733407438, 3, 4, 0.0},
            {-2, -2.0, -1, -1, -1.6698755212},
            {-2, -2.0, -1, -1, -0.2364409536},
            {5, 0.0015024443, 6, 7, 0.0},
            {-2, -2.0, -1, -1, 1.6823960290},
            {-2, -2.0, -1, -1, 1.6823960290},
            {0, 0.0000286029, 9, 12, 0.0},
            {2, 0.0757575762, 10, 11, 0.0},
            {-2, -2.0, -1, -1, -1.6812241220},
            {-2, -2.0, -1, -1, 1.6823960290},
            {0, 0.0000324166, 13, 14, 0.0},
            {-2, -2.0, -1, -1, 1.4589978385},
            {-2, -2.0, -1, -1, 1.6823960290}
        }
    }
};

void gradient_boost(hls::stream<axis_pkt>& in_stream, hls::stream<axis_pkt>& out_stream) {
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS DATAFLOW

    input_t X[num_features];
    #pragma HLS ARRAY_PARTITION variable=X complete

    #pragma HLS ARRAY_PARTITION variable=trees complete

    // Read input data
    for (int i = 0; i < num_features; ++i) {
        #pragma HLS UNROLL
        axis_pkt pkt = in_stream.read();
        X[i] = pkt.data;
    }

    fixed_t prediction = 0.0;


    for (int t = 0; t < num_trees; ++t) {
        #pragma HLS PIPELINE
        ap_uint<4> node_index = 0;
        for (int d = 0; d < num_nodes; ++d) {
            #pragma HLS UNROLL
            if (trees[t].nodes[node_index].left == -1 && trees[t].nodes[node_index].right == -1) {
                break;
            }
            if (X[trees[t].nodes[node_index].feature] < trees[t].nodes[node_index].threshold) {
                node_index = trees[t].nodes[node_index].left;
            } else {
                node_index = trees[t].nodes[node_index].right;
            }
        }
        prediction += trees[t].nodes[node_index].value;
    }

    ap_uint<1> predicted_class = (prediction > 0) ? 1 : 0;

    // Write output data
    axis_pkt out_pkt;
    out_pkt.data = predicted_class;
    out_pkt.last = true;
    out_stream.write(out_pkt);
}
