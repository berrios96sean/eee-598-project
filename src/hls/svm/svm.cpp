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
    #pragma HLS INTERFACE ap_ctrl_none port=return

    #pragma HLS DATAFLOW

    // Read input data with double buffering
    input_t X_0[num_features];
    input_t X_1[num_features];
    #pragma HLS ARRAY_PARTITION variable=X_0 complete dim=1
    #pragma HLS ARRAY_PARTITION variable=X_1 complete dim=1

    bool buffer_selector = false;

    // Loop to read input data
    read_loop: for (int i = 0; i < num_features; ++i) {
        #pragma HLS PIPELINE II=1
        #pragma HLS LOOP_TRIPCOUNT min=num_features max=num_features
        axis_pkt pkt = in_stream.read();
        if (!buffer_selector) {
            X_0[i] = pkt.data;
        } else {
            X_1[i] = pkt.data;
        }
    }

    // Compute decision value
    fixed_t decision = intercept;
    input_t *current_X = buffer_selector ? X_1 : X_0;

    support_vectors_loop: for (int i = 0; i < num_support_vectors; ++i) {
        #pragma HLS PIPELINE II=1
        #pragma HLS LOOP_TRIPCOUNT min=num_support_vectors max=num_support_vectors

        fixed_t dot_product = 0;

        features_loop: for (int j = 0; j < num_features; ++j) {
            #pragma HLS UNROLL factor=2
            #pragma HLS LOOP_TRIPCOUNT min=num_features max=num_features

            #pragma HLS bind_op variable=dot_product op=mul impl=dsp // Use DSP for multiplication
            dot_product += current_X[j] * support_vectors[i][j];
        }

        decision += coefficients[i] * dot_product;
    }

    // Write output data
    axis_pkt out_pkt;
    out_pkt.data = (decision > 0.1) ? 1 : 0;  // Threshold for decision
    out_pkt.last = true;

    write_output: for (int i = 0; i < 1; ++i) {
        #pragma HLS PIPELINE II=1
        out_stream.write(out_pkt);
    }

    // Toggle the buffer selector for the next run
    buffer_selector = !buffer_selector;
}
