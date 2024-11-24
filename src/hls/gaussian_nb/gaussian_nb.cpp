#include "gaussian_nb.h"

const int num_features = 10;
const int num_classes = 2;

const input_t means[num_classes][num_features] = {
    {0.0337266343, 0.0161561237, 0.194828295, 0.0663204929, 0.172113936, 0.102830367, 0.0705979925, 0.000155216623, 0.0047898132, 0.110540169},
    {0.462650049, 0.355474504, 0.823787442, 0.204331433, 0.213493558, 0.447983748, 0.923890595, 0.00000708550793, 0.00000221560356, 0.604198445}
};

const input_t priors[num_classes] = {0.4999177, 0.5000823};  // Prior probabilities

const fixed_8_t sqrt_2pi_variances[num_classes][num_features] = {  // scaledd this by 10
    {2.5751647790, 3.7326966260, 5.5349650500, 4.6907300000, 2.6545100000, 6.6408600000, 1.9093700000, 0.0433600000, 1.1369300000, 6.9075800000},
    {7.2428700000, 8.0690500000, 6.1982400000, 7.4615500000, 2.9728200000, 7.6110800000, 4.5944800000, 0.0188200000, 0.0077200000, 9.3305600000},
};

const fixed_16_t neg_half_div_variances[num_classes][num_features] = {
    {-471.5260000000, -112.8660000000, -10.2570000000, -14.2260000000, -44.5980000000, -7.1040000000, -86.3290000000, -167.5090000000, -244.0130000000, -6.6020000000},
    {-5.9850000000, -4.8220000000, -8.2380000000, -5.6310000000, -35.4930000000, -5.3860000000, -14.8680000000, -416.9860000000, -5258.0190000000, -3.6090000000},
};

void gaussian_nb(hls::stream<axis_pkt>& in_stream, hls::stream<axis_pkt>& out_stream) {
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE axis port=out_stream
	#pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS PIPELINE=II

    input_t X[num_features];
    #pragma HLS ARRAY_PARTITION variable=X complete

    #pragma HLS ARRAY_PARTITION variable=means complete
    #pragma HLS ARRAY_PARTITION variable=sqrt_2pi_variances complete
    #pragma HLS ARRAY_PARTITION variable=neg_half_div_variances complete

    // Read input data
    for (int i = 0; i < num_features; ++i) {
        #pragma HLS UNROLL
        axis_pkt pkt = in_stream.read();
        X[i] = pkt.data;
    }

    fixed_16_t probs[num_classes] = {priors[0], priors[1]};
    #pragma HLS ARRAY_PARTITION variable=probs complete

    for (int c = 0; c < num_classes; ++c) {
        #pragma HLS UNROLL
        for (int f = 0; f < num_features; ++f) {
           #pragma HLS UNROLL
            input_t diff = X[f] - means[c][f];
            fixed_16_t exponent = neg_half_div_variances[c][f] * diff * diff;
            fixed_16_t prob = hls::exp(exponent) / 2*sqrt_2pi_variances[c][f];
            probs[c] *= prob;
        }
    }

    int predicted_class = (probs[0] > probs[1]) ? 0 : 1;

    // Write output data
    axis_pkt out_pkt;
    out_pkt.data = predicted_class;
    out_pkt.last = true;
    out_stream.write(out_pkt);
}
