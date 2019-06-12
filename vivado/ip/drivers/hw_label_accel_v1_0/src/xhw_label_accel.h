// ==============================================================
// File generated on Wed May 22 23:06:09 +07 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XHW_LABEL_ACCEL_H
#define XHW_LABEL_ACCEL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xhw_label_accel_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Axilites_BaseAddress;
} XHw_label_accel_Config;
#endif

typedef struct {
    u32 Axilites_BaseAddress;
    u32 IsReady;
} XHw_label_accel;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XHw_label_accel_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XHw_label_accel_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XHw_label_accel_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XHw_label_accel_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XHw_label_accel_Initialize(XHw_label_accel *InstancePtr, u16 DeviceId);
XHw_label_accel_Config* XHw_label_accel_LookupConfig(u16 DeviceId);
int XHw_label_accel_CfgInitialize(XHw_label_accel *InstancePtr, XHw_label_accel_Config *ConfigPtr);
#else
int XHw_label_accel_Initialize(XHw_label_accel *InstancePtr, const char* InstanceName);
int XHw_label_accel_Release(XHw_label_accel *InstancePtr);
#endif

void XHw_label_accel_Start(XHw_label_accel *InstancePtr);
u32 XHw_label_accel_IsDone(XHw_label_accel *InstancePtr);
u32 XHw_label_accel_IsIdle(XHw_label_accel *InstancePtr);
u32 XHw_label_accel_IsReady(XHw_label_accel *InstancePtr);
void XHw_label_accel_EnableAutoRestart(XHw_label_accel *InstancePtr);
void XHw_label_accel_DisableAutoRestart(XHw_label_accel *InstancePtr);

void XHw_label_accel_Set_rows(XHw_label_accel *InstancePtr, u32 Data);
u32 XHw_label_accel_Get_rows(XHw_label_accel *InstancePtr);
void XHw_label_accel_Set_cols(XHw_label_accel *InstancePtr, u32 Data);
u32 XHw_label_accel_Get_cols(XHw_label_accel *InstancePtr);

void XHw_label_accel_InterruptGlobalEnable(XHw_label_accel *InstancePtr);
void XHw_label_accel_InterruptGlobalDisable(XHw_label_accel *InstancePtr);
void XHw_label_accel_InterruptEnable(XHw_label_accel *InstancePtr, u32 Mask);
void XHw_label_accel_InterruptDisable(XHw_label_accel *InstancePtr, u32 Mask);
void XHw_label_accel_InterruptClear(XHw_label_accel *InstancePtr, u32 Mask);
u32 XHw_label_accel_InterruptGetEnabled(XHw_label_accel *InstancePtr);
u32 XHw_label_accel_InterruptGetStatus(XHw_label_accel *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
