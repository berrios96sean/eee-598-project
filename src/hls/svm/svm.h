#ifndef SVM_H
#define SVM_H

#include <hls_stream.h>
#include <ap_fixed.h>
#include <ap_axi_sdata.h>

typedef ap_fixed<16, 2> fixed_t; 
typedef ap_axis<16, 0, 0, 0> axis_pkt; 
typedef ap_fixed<16, 2> input_t; 

void svm(hls::stream<axis_pkt>& in_stream, hls::stream<axis_pkt>& out_stream);

#endif // SVM_H