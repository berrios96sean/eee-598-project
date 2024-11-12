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
    fixed_int16_t weights[WEIGHTS_SIZE];

    // Initialize random seed
    std::srand(std::time(0));

    weights[0] = 50; // Bias term (scaled to fixed-point)
    for (int i = 1; i < WEIGHTS_SIZE; i++) {
        weights[i] = (std::rand() % 21) - 10; // Random between -10 and 10 (scaled to fixed-point)
    }

    std::vector<std::vector<fixed_int8_t>> test_inputs(5, std::vector<fixed_int8_t>(N_FEATURES));
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
            pkt.data = test_inputs[test_idx][i].range(); // Set fixed-point data directly
            pkt.last = (i == N_FEATURES - 1) ? 1 : 0;
            in_stream.write(pkt);
        }

        // Expected output calculation (CPU reference)
        fixed_t linear_sum = (fixed_t)weights[0]; // Bias term
        for (int i = 0; i < N_FEATURES; i++) {
            linear_sum += (fixed_t)weights[i + 1] * (fixed_t)test_inputs[test_idx][i];
        }

        // Apply sigmoid approximation to get the probability
        fixed_t abs_linear_sum = (linear_sum >= fixed_t(0)) ? linear_sum : (fixed_t)(-linear_sum);
        fixed_t probability = fixed_t(0.5) + linear_sum / (fixed_t(4.0) + abs_linear_sum); // Fixed-point sigmoid approximation

        std::cout << " Testbench Probabilities" << std::endl;
        std::cout << "---------------------------------------------" << std::endl;
        std::cout << "  Linear Sum: " << linear_sum << "\n Probability (before rounding): " << probability << std::endl;
        std::cout << "---------------------------------------------" << std::endl;

        // Classification decision based on threshold of 0.5
        fixed_int8_t expected_output = (probability >= fixed_t(0.5)) ? fixed_int8_t(1) : fixed_int8_t(0);

        // Call the logistic_regression function
        logistic_regression(in_stream, out_stream, weights);

        // Read output
        if (!out_stream.empty()) {
            axis_pkt output_pkt = out_stream.read();
            union {
                uint32_t i;
                float f;
            } output_cast;
            output_cast.i = output_pkt.data;
            fixed_int8_t output = (fixed_int8_t)std::round(output_cast.f); // Cast and round to fixed-point int8

            std::cout << "Test Case " << test_idx + 1 << ":" << std::endl;
            std::cout << "  Logistic Regression Output: " << (int)output << std::endl;
            std::cout << "  Expected Output: " << (int)expected_output << std::endl;

            // Compare expected and actual output
            if (output == expected_output) {
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
