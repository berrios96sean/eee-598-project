#include "gaussian_naive_bayes.h"
#include <hls_stream.h>
#include <ap_axi_sdata.h> // Include the proper header for ap_axis
#include <iostream>
#include <hls_math.h>
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
    fixed_int16_t weights_means[WEIGHTS_SIZE];
    fixed_int16_t weights_variances[WEIGHTS_SIZE];
    int pass_count = 0;
    int fail_count = 0;

    // Initialize random seed
    std::srand(std::time(0));

    for (int test_iteration = 0; test_iteration < 5; ++test_iteration) {
        std::cout << "========== Running Test Iteration " << test_iteration + 1 << " ==========" << std::endl;

        // Clear streams to ensure no data remains from previous iterations
        while (!in_stream.empty()) in_stream.read();
        while (!out_stream.empty()) out_stream.read();

        // Initialize weights (means and variances) randomly for each iteration
        for (int i = 0; i < WEIGHTS_SIZE; i++) {
            weights_means[i] = (std::rand() % 21) - 10; // Random between -10 and 10 (scaled to fixed-point)
            weights_variances[i] = (std::rand() % 20) + 1; // Random between 1 and 20 to avoid zero variance
        }

        // Generate test input data
        std::vector<fixed_int8_t> test_input(N_FEATURES);
        for (int i = 0; i < N_FEATURES; i++) {
            test_input[i] = ((float)rand() / RAND_MAX) * 2.0f - 1.0f; // Random between -1.0 and 1.0
            test_input[i] = keep_in_range(test_input[i], -0.5f, 0.5f); // Keep between -0.5 and 0.5
        }

        // Prepare input stream with the same data used in expected output calculation
        for (int i = 0; i < N_FEATURES; i++) {
            axis_pkt pkt;
            pkt.data = test_input[i]; // Set fixed-point data directly without additional random variation
            pkt.last = (i == N_FEATURES - 1) ? 1 : 0;
            in_stream.write(pkt);
        }

        // Reset the log_probabilities array to zero explicitly before each iteration
        fixed_t log_probabilities[N_CLASSES] = {0};
        fixed_t reciprocal_variance = (fixed_t)0.5;  // Using a predefined approximation for the reciprocal

        // Expected output calculation (CPU reference)
        for (int c = 0; c < N_CLASSES; c++) {
            log_probabilities[c] = 0; // Reset each probability for each class explicitly

            for (int i = 0; i < N_FEATURES; i++) {
                fixed_t mean = (fixed_t)weights_means[c * N_FEATURES + i];
                fixed_t variance = (fixed_t)weights_variances[c * N_FEATURES + i];

                // Avoid division by zero by adding a small constant to variance
                fixed_t variance_adj = variance + (fixed_t)1e-3;

                // Use a linear approximation for log(variance_adj)
                fixed_t log_value = variance_adj - (fixed_t)1.0;

                // Compute Gaussian log-likelihood contribution using simplified arithmetic
                fixed_t diff = (fixed_t)test_input[i] - mean;
                fixed_t diff_sq = diff * diff;
                fixed_t contribution = ((fixed_t)(-0.25) * diff_sq * reciprocal_variance) - ((fixed_t)(0.25) * log_value);

                // Accumulate the contributions
                log_probabilities[c] += contribution;
            }
        }


        // Determine expected class
        int expected_class = (log_probabilities[0] > log_probabilities[1]) ? 0 : 1;
        std::cout << "Test Iteration " << test_iteration + 1 << ": Expected Class Calculation - Log Probabilities: [" << log_probabilities[0] << ", " << log_probabilities[1] << "] => Expected Class: " << expected_class << std::endl;

        // Call the gaussian_naive_bayes function
        gaussian_naive_bayes(in_stream, out_stream, weights_means, weights_variances);

        // Read output
        if (!out_stream.empty()) {
            axis_pkt output_pkt = out_stream.read();
            int predicted_class = static_cast<int>(output_pkt.data);

            std::cout << "Test Iteration " << test_iteration + 1 << ":" << std::endl;
            std::cout << "  Gaussian Naive Bayes Output: " << predicted_class << std::endl;
            std::cout << "  Expected Output: " << expected_class << std::endl;

            // Compare expected and actual output
            if (predicted_class == expected_class) {
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
