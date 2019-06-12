// ==============================================================
// File generated on Wed May 22 23:06:09 +07 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xhw_label_accel.h"

extern XHw_label_accel_Config XHw_label_accel_ConfigTable[];

XHw_label_accel_Config *XHw_label_accel_LookupConfig(u16 DeviceId) {
	XHw_label_accel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XHW_LABEL_ACCEL_NUM_INSTANCES; Index++) {
		if (XHw_label_accel_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XHw_label_accel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XHw_label_accel_Initialize(XHw_label_accel *InstancePtr, u16 DeviceId) {
	XHw_label_accel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XHw_label_accel_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XHw_label_accel_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

