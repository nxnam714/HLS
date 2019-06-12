/***************************************************************************
Copyright (c) 2016, Xilinx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

***************************************************************************/
#include "xf_headers.h"
#include "xf_label_config.h"
#include <stdio.h>

int main(int argc,char **argv){
	cv::Mat img, result, result_ocv,error;

	if(argc != 2){
		printf("Usage : <executable> <input image> \n");
		return -1;
	}
	img = cv::imread(argv[1],0);
	if(!img.data){
		return -1;
	}

	cv::imwrite("input.png",img);
	result_ocv = cv::imread("../../../cvLabelImg.png",0);

	uint16_t height = img.rows;
	uint16_t width = img.cols;
	uint16_t newheight = height;
	uint16_t newwidth = width;

	result.create(cv::Size(newwidth, newheight), img.type());
	//result_ocv.create(cv::Size(newwidth, newheight), img.type());
	error.create(cv::Size(newwidth, newheight), img.type());


	xf::Mat<TYPE_IN, HEIGHT, WIDTH, NPC1> imgInput(height, width);
	xf::Mat<TYPE_OUT, HEIGHT, WIDTH, NPC1> imgOutput(newheight, newwidth);
	imgInput.copyTo(img.data);

	axis_in_t *input = new axis_in_t [height*width];
	axis_out_t *output = new axis_out_t [newheight*newwidth];

	// Store data in axis

	for (int ind=0; ind<(height*width); ind++) {
		input[ind].data = imgInput.data[ind];
	}
	for (int ind=0; ind<(height*width); ind++) {
			imgOutput.data[ind] = input[ind].data;
		}

	FILE *fptr0;
	fptr0 = fopen("programi.txt","w");

	if(fptr0 == NULL)
	{
	   printf("Error!");
	   exit(1);
	}
	xf::Mat<XF_8UC1, HEIGHT, WIDTH, NPC1> imgInput1(height, width);
	imgInput1.copyTo(result_ocv.data);
	for (int i = 0; i < height; i++){
		for (int j = 0; j < width; j++){
			int value = imgInput.data[i*width+j];//input[i*width+j].data; //
			fprintf(fptr0, "%03d ", value);
		}
		fprintf(fptr0, "\n");
	}
	fclose(fptr0);

	hw_label_accel(input, output, height, width);

	// Copy data from axis
	for (int ind=0; ind<(newheight*newwidth); ind++) {
		imgOutput.data[ind] = output[ind].data;
	}


	result.data = imgOutput.copyFrom();

	FILE *fptr;
		fptr = fopen("program.txt","w");

		if(fptr == NULL)
		{
		   printf("Error!");
		   exit(1);
		}
		for (int i = 0; i < height; i++){
			for (int j = 0; j < width; j++){
				int value = imgOutput.data[i*width+j];
				result.data[i*width+j] = value;
				fprintf(fptr, "%03d ", value);
			}
			fprintf(fptr, "\n");
		}
		fclose(fptr);
		delete[] input;
		delete[] output;

	cv::absdiff(result,result_ocv,error);

	double minval=256,maxval=0;
	int cnt = 0;
	for (int i=0;i<error.rows;i++){
		for(int j=0;j<error.cols;j++){
			uchar v = error.at<uchar>(i,j);
			if (v>1)
				cnt++;
			if (minval > v )
				minval = v;
			if (maxval < v)
				maxval = v;
		}
	}
	float err_per = 100.0*(float)cnt/(error.rows*error.cols);

	fprintf(stderr,"Minimum error in intensity = %f\n Maximum error in intensity = %f\n Percentage of pixels above error threshold = %f\n",minval,maxval,err_per);

	cv::imwrite("output_hls.png", result);
	cv::imwrite("resize_ocv.png", result_ocv);
	cv::imwrite("error.png", error);

	if(maxval>2){
		printf("\nTest Failed\n");
		return 0;
	}

	return 0;
}
