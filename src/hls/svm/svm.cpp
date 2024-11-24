#include "svm.h"

const int num_features = 10;
const int num_support_vectors = 5;

const input_t support_vectors[num_support_vectors][num_features] = {
    {0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0},
    {0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 0.1},
    {0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 0.1, 0.2},
    {0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 0.1, 0.2, 0.3},
    {0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 0.1, 0.2, 0.3, 0.4}
};

const fixed_t coefficients[num_support_vectors] = {0.5, -0.5, 0.5, -0.5, 0.5};
const fixed_t intercept = 0.1;

void svm(hls::stream<axis_pkt>& in_stream, hls::stream<axis_pkt>& out_stream) {
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS PIPELINE

    input_t X[num_features];
    #pragma HLS ARRAY_PARTITION variable=X complete dim=1

    #pragma HLS ARRAY_PARTITION variable=support_vectors complete dim=2
    #pragma HLS ARRAY_PARTITION variable=coefficients complete dim=1

    // Read input data
    for (int i = 0; i < num_features; ++i) {
        #pragma HLS UNROLL
        axis_pkt pkt = in_stream.read();
        X[i] = pkt.data;
    }

    fixed_t decision = intercept;
    for (int i = 0; i < num_support_vectors; ++i) {
        #pragma HLS UNROLL
        fixed_t dot_product = 0;
        for (int j = 0; j < num_features; ++j) {
            #pragma HLS UNROLL
            dot_product += X[j] * support_vectors[i][j];
        }
        decision += coefficients[i] * dot_product;
    }

    ap_uint<1> predicted_class = (decision > 0) ? 1 : 0;

    // Write output data
    axis_pkt out_pkt;
    out_pkt.data = predicted_class;
    out_pkt.last = true;
    out_stream.write(out_pkt);
}