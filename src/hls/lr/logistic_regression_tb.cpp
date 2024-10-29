// Testbench for logistic_regression function
#include "logistic_regression.h"
#include <hls_stream.h>
#include <iostream>
#include <ap_fixed.h>
#include <cmath>
#include <vector>
#include <cstdlib>
#include <ctime>

// Custom helper function to keep a value within a specified range
float keep_in_range(float value, float min_val, float max_val) {
    return std::max(min_val, std::min(value, max_val));
}


int main() {
    hls::stream<axis_pkt> in_stream;
    hls::stream<axis_pkt> out_stream;
    float weights[WEIGHTS_SIZE];

    // Initialize random seed
    std::srand(std::time(0));

    weights[0] = 0.5f; // Bias term
    for (int i = 1; i < WEIGHTS_SIZE; i++) {
        weights[i] = ((float)rand() / RAND_MAX) * 0.2f - 0.1f; // Random between -0.1 and 0.1
    }

    std::vector<std::vector<float>> test_inputs(5, std::vector<float>(N_FEATURES));
    for (auto &input : test_inputs) {
        input[0] = keep_in_range(((float)rand() / RAND_MAX) * 100.0f, 0.0f, 100.0f); // Age: Random between 0 and 100
        input[1] = keep_in_range(((float)rand() / RAND_MAX) * 60.0f, 0.0f, 60.0f); // Tenure: Random between 0 and 60
        input[2] = keep_in_range(((float)rand() / RAND_MAX) * 200.0f, 0.0f, 200.0f); // Monthly Charge: Random between 0 and 200
        input[3] = keep_in_range(((float)rand() / RAND_MAX) * 10.0f, 0.0f, 10.0f); // Support Calls: Random between 0 and 10

        for (int i = 4; i < N_FEATURES; i++) {
            input[i] = ((float)rand() / RAND_MAX) * 2.0f - 1.0f; // Random between -1.0 and 1.0
            input[i] = keep_in_range(input[i], -0.5f, 0.5f); // Keep between -0.5 and 0.5
        }
    }


    // Run test cases
    int pass_count = 0;
    int fail_count = 0;

    for (size_t test_idx = 0; test_idx < test_inputs.size(); ++test_idx) {
        // Prepare input stream
        for (int i = 0; i < N_FEATURES; i++) {
            axis_pkt pkt;
            pkt.data = *((int*)&test_inputs[test_idx][i]);
            pkt.last = (i == N_FEATURES - 1) ? 1 : 0;
            in_stream.write(pkt);
        }

        // Expected output calculation (CPU reference)
        fixed_t linear_sum = weights[0]; // Bias term
        for (int i = 0; i < N_FEATURES; i++) {
            linear_sum += (fixed_t)weights[i + 1] * (fixed_t)test_inputs[test_idx][i];
        }

        // Apply sigmoid function to get the probability
        float probability = 1.0f / (1.0f + std::exp(-linear_sum.to_float()));
        std::cout << " Testbench Probabilities" << std::endl;
        std::cout << "---------------------------------------------" << std::endl;
        std::cout << "  Linear Sum: " << linear_sum << "\n Probability (before rounding): " << probability << std::endl;
        std::cout << "---------------------------------------------" << std::endl;
        float expected_output = (probability >= 0.5f) ? 1.0f : 0.0f;

        // Call the logistic_regression function
        logistic_regression(in_stream, out_stream, weights);

        // Read output
        if (!out_stream.empty()) {
            axis_pkt output_pkt = out_stream.read();
            float output = *((float*)&output_pkt.data);
            std::cout << "Test Case " << test_idx + 1 << ":" << std::endl;
            std::cout << "  Logistic Regression Output: " << output << std::endl;
            std::cout << "  Expected Output: " << expected_output << std::endl;

            // Compare expected and actual output
            if (std::abs(output - expected_output) < 1e-3) {
                pass_count++;
                std::cout << "  Test Passed!" << std::endl;
            } else {
                fail_count++;
                std::cout << "  Test Failed!" << std::endl;
            }
        } else {
            fail_count++;
            std::cout << "Error: Output stream is empty." << std::endl;
        }
    }

        // Output total pass/fail count
    std::cout << " Summary of Test Results:" << std::endl;
    std::cout << "  Total Passed: " << pass_count << std::endl;
    std::cout << "  Total Failed: " << fail_count << std::endl;
    if (fail_count == 0) {
        std::cout << "  Overall Result: PASS" << std::endl;
    } else {
        std::cout << "  Overall Result: FAIL" << std::endl;
    }

    return 0;
}
