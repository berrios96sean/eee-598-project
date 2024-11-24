#include <iostream>
#include <fstream>
#include <vector>
#include "ada_boost.h"

const int num_features = 10; 

int main() {
    std::ifstream infile("test_data.txt");
    if (!infile) {
        std::cerr << "Error opening test data file." << std::endl;
        return 1;
    }

    std::ifstream ref_file("reference_predictions.txt");
    if (!ref_file) {
        std::cerr << "Error opening reference predictions file." << std::endl;
        return 1;
    }

    std::vector<int> reference_predictions;
    int ref_class;
    while (ref_file >> ref_class) {
        reference_predictions.push_back(ref_class);
    }

    hls::stream<axis_pkt> in_stream;
    hls::stream<axis_pkt> out_stream;

    int num_samples;
    infile >> num_samples;
    int correct_predictions = 0;
    num_samples = num_samples/100;
    for (int i = 0; i < num_samples; ++i) {
        for (int j = 0; j < num_features; ++j) {
            float value;
            infile >> value;
            axis_pkt pkt;
            pkt.data = static_cast<input_t>(value);
            pkt.last = (j == num_features - 1);
            in_stream.write(pkt);
        }

        adaboost(in_stream, out_stream);

        while (out_stream.empty()) {
        }

        axis_pkt out_pkt = out_stream.read();
        ap_uint<1> predicted_class = out_pkt.data;
        std::cout << "packet " << i << " predicted_class: " << predicted_class << std::endl;

        int reference_class = reference_predictions[i];
        std::cout << "packet " << i << " reference class: " << reference_class << std::endl;

        if (predicted_class == reference_class) {
            correct_predictions++;
        }
    }

    if (!out_stream.empty()) {
        std::cerr << "WARNING: Output stream contains leftover data." << std::endl;
        return 1;
    }

    float accuracy = static_cast<float>(correct_predictions) / num_samples;
    std::cout << "HLS Implementation Accuracy: " << accuracy << std::endl;

    return 0;
}