#include "logistic_regression.h"

const int num_features = 10;

const fixed_8_t coefficients[num_features] = {
    45.0373153853, 10.3786838184, 15.9393044430, 3.3646266663, 13.8120942498,
    -1.2474239747, 26.3092266130, -0.0186548788, -1.7957262049, 1.3117863341,
};

const fixed_8_t intercept = -18.6547835574;

// fixed_2_t sigmoid(fixed_8_t x) {
//     return 1 / (1 + hls::exp(-x));
// }

// fixed_2_t sigmoid(fixed_8_t x) {

//     const fixed_8_t neg_four = -4.0;
//     const fixed_8_t neg_two = -2.0;
//     const fixed_8_t zero = 0.0;
//     const fixed_8_t two = 2.0;
//     const fixed_8_t four = 4.0;
//     const fixed_8_t one = 1.0;
//     const fixed_8_t point_one = 0.1;
//     const fixed_8_t point_two = 0.2;
//     const fixed_8_t point_five = 0.5;
//     const fixed_8_t point_eight = 0.8;
//     const fixed_8_t point_two_five = 0.25;

//     if (x < neg_four) return zero;
//     else if (x < neg_two) return point_one * x + point_two;
//     else if (x < zero) return point_two_five * x + point_five;
//     else if (x < two) return point_two_five * x + point_five;
//     else if (x < four) return point_one * x + point_eight;
//     else return one;
// }

fixed_8_t sigmoid(fixed_8_t x) {
     if (x < -4.0) return fixed_8_t(0.0);
     else if (x < -2.0) return fixed_8_t(0.1) * x + fixed_8_t(0.2);
     else if (x < 0.0) return fixed_8_t(0.25) * x + fixed_8_t(0.5);
     else if (x < 2.0) return fixed_8_t(0.25) * x + fixed_8_t(0.5);
     else if (x < 4.0) return fixed_8_t(0.1) * x + fixed_8_t(0.8);
     else return fixed_8_t(1.0);
 }



void logistic_regression(hls::stream<axis_pkt>& in_stream, hls::stream<axis_pkt>& out_stream) {
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
	#pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS DATAFLOW

    input_t X[num_features];
    #pragma HLS ARRAY_PARTITION variable=X complete dim=1

    #pragma HLS ARRAY_PARTITION variable=coefficients complete dim=1


    for (int i = 0; i < num_features; ++i) {
        #pragma HLS UNROLL
        axis_pkt pkt = in_stream.read();
        X[i] = pkt.data;
    }


    fixed_8_t decision = intercept;
    for (int i = 0; i < num_features; ++i) {
        #pragma HLS UNROLL
        decision += coefficients[i] * X[i];
//#pragma bind_op variable=decision
    }

    fixed_2_t probability = sigmoid(decision);


    ap_uint<1> predicted_class = (probability > 0.5) ? 1 : 0;

    // Write output data
    axis_pkt out_pkt;
    out_pkt.data = predicted_class;
    out_pkt.last = true;
    out_stream.write(out_pkt);
}
