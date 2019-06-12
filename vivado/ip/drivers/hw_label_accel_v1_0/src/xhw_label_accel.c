// ==============================================================
// File generated on Wed May 22 23:06:09 +07 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xhw_label_accel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XHw_label_accel_CfgInitialize(XHw_label_accel *InstancePtr, XHw_label_accel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Axilites_BaseAddress = ConfigPtr->Axilites_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XHw_label_accel_Start(XHw_label_accel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHw_label_accel_ReadReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_AP_CTRL) & 0x80;
    XHw_label_accel_WriteReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_AP_CTRL, Data | 0x01);
}

u32 XHw_label_accel_IsDone(XHw_label_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHw_label_accel_ReadReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XHw_label_accel_IsIdle(XHw_label_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHw_label_accel_ReadReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XHw_label_accel_IsReady(XHw_label_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHw_label_accel_ReadReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XHw_label_accel_EnableAutoRestart(XHw_label_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHw_label_accel_WriteReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_AP_CTRL, 0x80);
}

void XHw_label_accel_DisableAutoRestart(XHw_label_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHw_label_accel_WriteReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_AP_CTRL, 0);
}

void XHw_label_accel_Set_rows(XHw_label_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHw_label_accel_WriteReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_ROWS_DATA, Data);
}

u32 XHw_label_accel_Get_rows(XHw_label_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHw_label_accel_ReadReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_ROWS_DATA);
    return Data;
}

void XHw_label_accel_Set_cols(XHw_label_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHw_label_accel_WriteReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_COLS_DATA, Data);
}

u32 XHw_label_accel_Get_cols(XHw_label_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHw_label_accel_ReadReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_COLS_DATA);
    return Data;
}

void XHw_label_accel_InterruptGlobalEnable(XHw_label_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHw_label_accel_WriteReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_GIE, 1);
}

void XHw_label_accel_InterruptGlobalDisable(XHw_label_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHw_label_accel_WriteReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_GIE, 0);
}

void XHw_label_accel_InterruptEnable(XHw_label_accel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHw_label_accel_ReadReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_IER);
    XHw_label_accel_WriteReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_IER, Register | Mask);
}

void XHw_label_accel_InterruptDisable(XHw_label_accel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XHw_label_accel_ReadReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_IER);
    XHw_label_accel_WriteReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_IER, Register & (~Mask));
}

void XHw_label_accel_InterruptClear(XHw_label_accel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XHw_label_accel_WriteReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_ISR, Mask);
}

u32 XHw_label_accel_InterruptGetEnabled(XHw_label_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHw_label_accel_ReadReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_IER);
}

u32 XHw_label_accel_InterruptGetStatus(XHw_label_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHw_label_accel_ReadReg(InstancePtr->Axilites_BaseAddress, XHW_LABEL_ACCEL_AXILITES_ADDR_ISR);
}

