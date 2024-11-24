#include "ada_boost.h"

const int num_features = 10;
const int num_stumps = 3;

const Stump stumps[num_stumps] = {
    {6, 0.2373737395, 1.0000000000, 1},
    {0, 0.1278836578, 1.0000000000, 1},
    {2, 0.1363636330, 1.0000000000, 1},
};

void adaboost(hls::stream<axis_pkt>& in_stream, hls::stream<axis_pkt>& out_stream) {
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS PIPELINE

    input_t X[num_features];
    #pragma HLS ARRAY_PARTITION variable=X complete dim=1

    #pragma HLS ARRAY_PARTITION variable=stumps complete dim=1

    // Read input data
    for (int i = 0; i < num_features; ++i) {
        #pragma HLS UNROLL
        axis_pkt pkt = in_stream.read();
        X[i] = pkt.data;
    }

    fixed_t decision = 0.0;

    for (int s = 0; s < num_stumps; ++s) {
        #pragma HLS UNROLL
        fixed_t feature_value = X[stumps[s].feature];
        fixed_t stump_decision = (feature_value < stumps[s].threshold) ? static_cast<fixed_t>(stumps[s].polarity) : static_cast<fixed_t>(-stumps[s].polarity);
        decision += stumps[s].weight * stump_decision;
    }

    fixed_t probability = 1 / (1 + hls::exp(-decision));

    ap_uint<1> predicted_class = (probability > 0.5) ? 1 : 0;

    // Write output data
    axis_pkt out_pkt;
    out_pkt.data = predicted_class;
    out_pkt.last = true;
    out_stream.write(out_pkt);
}