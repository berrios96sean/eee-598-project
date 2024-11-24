#include "mlp.h"

const int num_features = 10; 
const int num_hidden = 5;

const fixed_4_t weights_input_hidden[num_features][num_hidden] = {
    {2.7061331047, -0.0032344126, -1.3358047757, -1.1707785167, -3.2851697062},
    {1.1651578691, 0.2386065732, -0.8816450075, -0.1333759502, -1.6372038388},
    {1.1420459551, 2.3515948492, 0.0769402216, -5.1775908453, -1.3552039441},
    {0.5015185213, 0.1904412451, -0.6758187683, 0.3039502161, -0.2571451655},
    {3.4044702931, 0.1737052254, -0.1959615267, 2.2923180560, -0.5055068428},
    {-0.2006373737, -2.9188056424, 0.2873053927, -1.9305880975, 1.1007207143},
    {6.2857786570, -3.6437212069, -1.5010870343, 4.2713184942, -1.7570498317},
    {0.0826253721, -0.0694589091, -0.0619232843, -0.1121594742, -0.0671094054},
    {-0.4196110691, 0.4455795364, 0.2137717310, 0.6934784634, 0.3034388212},
    {-0.6245583349, 0.0095473330, 0.7145265088, -0.0986637741, 1.4827937835},
};

const fixed_4_t biases_hidden[num_hidden] = {
    1.7409881529, 1.8911043520, 1.5994892269, 0.8993441947, 2.0780462013,
};

const fixed_8_t weights_hidden_output[num_hidden] = {
    5.3060602446, -4.9610595250, -2.7628720652, -8.6004761612, -3.8866495956,
};

const fixed_2_t biases_output = 0.8646510643;

fixed_8_t relu(fixed_8_t x) {
    return (x > 0) ? x : fixed_8_t(0);
}

// fixed_2_t sigmoid(fixed_8_t x) {
//    return 1 / (1 + hls::exp(-x));
// }

fixed_8_t sigmoid(fixed_8_t x) {
     if (x < -4.0) return fixed_8_t(0.0);
     else if (x < -2.0) return fixed_8_t(0.1) * x + fixed_8_t(0.2);
     else if (x < 0.0) return fixed_8_t(0.25) * x + fixed_8_t(0.5);
     else if (x < 2.0) return fixed_8_t(0.25) * x + fixed_8_t(0.5);
     else if (x < 4.0) return fixed_8_t(0.1) * x + fixed_8_t(0.8);
     else return fixed_8_t(1.0);
 }


// fixed_2_t sigmoid(fixed_8_t x) {
//     #pragma HLS INLINE
//     int quotient = x / 2;
//     fixed_2_t a, b;

//     switch (quotient) {
//         case -2:
//             a = fixed_2_t(0.1);
//             b = fixed_2_t(0.2);
//             break;
//         case -1:
//             a = fixed_2_t(0.25);
//             b = fixed_2_t(0.5);
//             break;
//         case 0:
//             a = fixed_2_t(0.25);
//             b = fixed_2_t(0.5);
//             break;
//         case 1:
//             a = fixed_2_t(0.1);
//             b = fixed_2_t(0.8);
//             break;
//         default:
//             a = fixed_2_t(0.0);
//             b = fixed_2_t(1.0);
//             break;
//     }

//     return a * x + b;
// }

void mlp(hls::stream<axis_pkt>& in_stream, hls::stream<axis_pkt>& out_stream) {
    #pragma HLS INTERFACE axis port=in_stream
	#pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS DATAFLOW

    input_t X[num_features];
    #pragma HLS ARRAY_PARTITION variable=X complete

    fixed_8_t hidden[num_hidden];
    #pragma HLS ARRAY_PARTITION variable=hidden complete

    fixed_8_t output_1;
    fixed_8_t output;

    #pragma HLS ARRAY_PARTITION variable=weights_input_hidden complete
    #pragma HLS ARRAY_PARTITION variable=weights_hidden_output complete
    #pragma HLS ARRAY_PARTITION variable=biases_hidden complete

    // Read input data
    for (int i = 0; i < num_features; ++i) {
        #pragma HLS UNROLL
        axis_pkt pkt = in_stream.read();
        X[i] = pkt.data;
    }

    // Compute hidden layer activations
    for (int i = 0; i < num_hidden; ++i) {
        #pragma HLS UNROLL
        hidden[i] = biases_hidden[i];
        for (int j = 0; j < num_features; ++j) {
            #pragma HLS UNROLL
            hidden[i] += weights_input_hidden[j][i] * X[j];
        }
        hidden[i] = relu(hidden[i]);
    }

    // Compute output layer activation
    output_1 = biases_output;
    for (int j = 0; j < num_hidden; ++j) {
        #pragma HLS UNROLL
        output_1 += weights_hidden_output[j] * hidden[j];
    }
    output = sigmoid(output_1);

    // Determine predicted class
    ap_uint<1> predicted_class = (output > 0.5) ? 1 : 0;

    // Write output data
    axis_pkt out_pkt;
    out_pkt.data = predicted_class;
    out_pkt.last = true;
    out_stream.write(out_pkt);
}
