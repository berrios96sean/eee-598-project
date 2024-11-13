#include "cnn.h"


void cnn(hls::stream<ap_uint<8>> &input, hls::stream<ap_uint<16>> &output) {
    #pragma HLS INTERFACE axis port=input
    #pragma HLS INTERFACE axis port=output
//    #pragma HLS INTERFACE s_axilite port=return

	 uint8_t input_buffer[INPUT_FEATURES];
	 int16_t output_buffer[OUTPUT_CLASSES];

	 for (int i = 0; i < INPUT_FEATURES; i++) {
	     input.read(input_buffer[i]);
	 }

    // Define the weights for all layers here
    uint8_t kernel1[KERNEL_SIZE] = {64, 128, 255};
    uint8_t kernel2[KERNEL_SIZE] = {190, 200, 220};
    uint8_t kernel3[KERNEL_SIZE] = {90, 70, 80};

    int16_t fully_connected_weights[OUTPUT_CLASSES][HIDDEN_LAYER_NEURONS / 2] = {
        {67, 160}, // weights 1
        {222, 195}  // weights 2
    };



    int16_t conv_output1[HIDDEN_LAYER_NEURONS];
    uint8_t relu_output1[HIDDEN_LAYER_NEURONS];
    uint8_t pooled_output1[HIDDEN_LAYER_NEURONS / 2];

    int16_t conv_output2[HIDDEN_LAYER_NEURONS];
    uint8_t relu_output2[HIDDEN_LAYER_NEURONS];
    uint8_t pooled_output2[HIDDEN_LAYER_NEURONS / 2];

    int16_t conv_output3[HIDDEN_LAYER_NEURONS];
    uint8_t relu_output3[HIDDEN_LAYER_NEURONS];
    uint8_t pooled_output3[HIDDEN_LAYER_NEURONS / 2];

    uint8_t fc_input[HIDDEN_LAYER_NEURONS / 2];

	#pragma HLS DATAFLOW

    // 1
    convolution(input_buffer, kernel1, conv_output1);
    relu(conv_output1, relu_output1);
    max_pooling(relu_output1, pooled_output1);

    // 2
    convolution(pooled_output1, kernel2, conv_output2);
    relu(conv_output2, relu_output2);
    max_pooling(relu_output2, pooled_output2);

    // 3
    convolution(pooled_output2, kernel3, conv_output3);
    relu(conv_output3, relu_output3);
    max_pooling(relu_output3, pooled_output3);

    // 4
    fully_connected(pooled_output3, fully_connected_weights, output_buffer);

    for (int i = 0; i < OUTPUT_CLASSES; i++) {
        output.write(output_buffer[i]);
    }
}
