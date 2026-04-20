////////////////////////////////////////////////////////////////////////
// Proprietary Notice
// 
//   This document is protected by copyright and other related rights and
//   the use or implementation of the information contained in this document
//   may be protected by one or more patents or pending patent applications.
//   No part of this document may be reproduced in any form by any means
//   without the express prior written permission of Arm Limited ("Arm").
//   No license, express or implied, by estoppel or otherwise to any
//   intellectual property rights is granted by this document unless
//   specifically stated.
// 
//   Your access to the information in this document is conditional upon
//   your acceptance that you will not use or permit others to use the
//   information for the purposes of determining whether the subject matter
//   of this document infringes any third party patents.
// 
//     The content of this document is informational only. Any solutions
//     presented herein are subject to changing conditions, information,
//     scope, and data.  This document was produced using reasonable
//     efforts based on information available as of the date of issue
//     of this document.  The scope of information in this document may
//     exceed that which Arm is required to provide, and such additional
//     information is merely intended to further assist the recipient
//     and does not represent Arm's view of the scope of its obligations.
//     You acknowledge and agree that you possess the necessary
//     expertise in system security and functional safety and that
//     you shall be solely responsible for compliance with all legal,
//     regulatory, safety and security related requirements concerning
//     your products, notwithstanding any information or support that
//     may be provided by Arm herein.  In addition, you are responsible
//     for any applications which are used in conjunction with any Arm
//     technology described in this document, and to minimize risks,
//     adequate design and operating safeguards should be provided for by you.
// 
//     This document may include technical inaccuracies or typographical
//     errors. THIS DOCUMENT IS PROVIDED "AS IS". ARM PROVIDES NO
//     REPRESENTATIONS AND NO WARRANTIES, EXPRESS, IMPLIED OR STATUTORY,
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
//     MERCHANTABILITY, SATISFACTORY QUALITY, NON-INFRINGEMENT OR FITNESS
//     FOR A PARTICULAR PURPOSE WITH RESPECT TO THE DOCUMENT. For the
//     avoidance of doubt, Arm makes no representation with respect to,
//     and has undertaken no analysis to identify or understand the
//     scope and content of, any patents, copyrights, trade secrets,
//     trademarks, or other rights.
// 
//     TO THE EXTENT NOT PROHIBITED BY LAW, IN NO EVENT WILL ARM BE
//     LIABLE FOR ANY DAMAGES, INCLUDING WITHOUT LIMITATION ANY DIRECT,
//     INDIRECT, SPECIAL, INCIDENTAL, PUNITIVE, OR CONSEQUENTIAL DAMAGES,
//     HOWEVER CAUSED AND REGARDLESS OF THE THEORY OF LIABILITY, ARISING
//     OUT OF ANY USE OF THIS DOCUMENT, EVEN IF ARM HAS BEEN ADVISED OF
//     THE POSSIBILITY OF SUCH DAMAGES.
// 
//   Reference by Arm to any third party"s products or services within this
//   document is not an express or implied approval or endorsement of the use thereof.
// 
//     This document consists solely of commercial items. You shall be responsible
//     for ensuring that any permitted use, duplication, or disclosure of this
//     document complies fully with any relevant export laws and regulations to
//     assure that this document or any portion thereof is not exported, directly
//     or indirectly, in violation of such export laws. Use of the word "partner"
//     in reference to Arm"s customers is not intended to create or refer to any
//     partnership relationship with any other company. Arm may make changes to
//     this document at any time and without notice.
// 
//     This document may be translated into other
// languages for convenience, and you agree that if there is any conflict
// between the English version of this document and any translation, the
// terms of the English version of the Agreement shall prevail.
// 
//     The validity, construction and performance of this notice shall be governed by English Law.
// 
//     The Arm corporate logo and words marked with (R) or (TM)
// are registered trademarks or trademarks of Arm Limited (or its
// affiliates) in the US and/or elsewhere. Please follow Arm"s trademark usage
// guidelines at http://www.arm.com/company/policies/trademarks.
// All rights reserved.  Other brands and names mentioned in this document may be the trademarks of
// their respective owners.
// 
//     Copyright (C) 2010-2026 Arm Limited (or its affiliates). All rights reserved.
// 
//     Arm Limited. Company 02557590 registered in England.
// 
//     110 Fulbourn Road, Cambridge, England CB1 9NJ.
// 
//     LES-PRE-20349
// 
//     8 March 2024
////////////////////////////////////////////////////////////////////////

// Interrupt Controller Physical Interrupt Priority Control Register (EL1)
__register 64 { 4:0 PRIORITY } ICC_PCR_EL1;

// MPAM Priority Partitioning Identification Register
__register 32 { 25:20 DSPRI_WD, 17:17 DSPRI_0_IS_LOW, 16:16 HAS_DSPRI, 9:4 INTPRI_WD, 1:1 INTPRI_0_IS_LOW, 0:0 HAS_INTPRI } MPAMF_PRI_IDR;

// Interrupt Controller Interrupt Configuration and State Register
__register 64 { 47:32 IAFFID, 15:11 Priority, 5:5 HM, 4:4 Active, 3:3 IRM, 2:2 Pending, 1:1 Enabled, 0:0 F } ICC_ICSR_EL1;

// OS Lock Status Register
__register 32 { 0:0 OSLM, 2:2 nTT, 1:1 OSLK } OSLSR_EL1;

// Interrupt Controller Control Register (EL1)
__register 32 { 19:19 ExtRange, 18:18 RSS, 15:15 A3V, 14:14 SEIS, 13:11 IDbits, 10:8 PRIbits, 6:6 PMHE, 1:1 EOImode, 0:0 CBPR } ICC_CTLR_EL1;

// Profiling Buffer Write Pointer Register
__register 64 { 63:0 PTR } PMBPTR_EL1;

// Interrupt Controller Binary Point Register 0
__register 32 { 2:0 BinaryPoint } ICC_BPR0_EL1;

// External Debug Feature Register 1
__register 64 { 63:56 ABL_CMPs, 55:52 DPFZS, 51:48 EBEP, 47:44 ITE, 43:40 ABLE, 39:36 PMICNTR, 35:32 SPMU, 31:24 CTX_CMPs, 23:16 WRPs, 15:8 BRPs, 7:0 SYSPMUID } EDDFR1;

// Reset Vector Base Address Register (if EL3 not implemented)
__register 64 { 63:0 ResetAddress } RVBAR_EL2;

// Trace Buffer Base Address Register
__register 64 { 63:12 BASE } TRBBASER_EL1;

// Interrupt Controller Interrupt Group 1 Enable Register
__register 32 { 0:0 Enable } ICC_IGRPEN1_EL1;

// EL0 Read/Write Software Context Number
__register 64 { 63:0 SCXTNUM } SCXTNUM_EL0;

// Condition Flags
__register 32 { 31:31 N, 30:30 Z, 29:29 C, 28:28 V } NZCV;

// Trace Programming Control Register
__register 64 { 0:0 EN } TRCPRGCTLR;

// Architectural Feature Trap Register (EL3)
__register 32 { 31:31 TCPAC, 30:30 TAM, 20:20 TTA, 12:12 ESM, 10:10 TFP, 8:8 EZ } CPTR_EL3;

// Read Check Write Instruction Mask (EL1)
__register 128 { 63:0 RCWMASK } RCWMASK_EL1;

// Trace Timestamp Control Register
__register 32 { 7:7 EVENT_TYPE, 4:0 EVENT_SEL } TRCTSCTLR;

// CPU Interface Aliased Binary Point Register
__register 32 { 2:0 Binary_Point } GICC_ABPR;

// Trace Buffer Trigger Counter Register
__register 64 { 31:0 TRG } TRBTRG_EL1;

// Translation Table Base Register 1 (EL1)
__register 128 { 47:1, 47:5 BADDR, 63:48 ASID, 2:1 SKL, 0:0 CnP } TTBR1_EL1;

// MPAM Cache Storage Allocation Monitor Register
__register 32 { 31:31 NRDY, 30:0 VALUE } MSMON_CSA;

// Data Fault Status Register
__register 32 { 16:16 FnV, 15:14 AET, 13:13 CM, 12:12 ExT, 11:11 WnR, 3:0 FS, 9:9 LPAE, 7:4 Domain, 5:0 STATUS } DFSR;

// Debug Data Transfer Register, Receive
__register 32 { 31:0 DTRRX } DBGDTRRX_EL0;

// Physical Fault Address Register (EL1)
__register 64 { 63:63 NS, 62:62 NSE, 55:52, 51:48 PA } PFAR_EL1;

// Counter-timer Physical Timer Control register
__register 32 { 2:2 ISTATUS, 1:1 IMASK, 0:0 ENABLE } CNTP_CTL;

// Hardware Dirty State Tracking Structure Base Register
__register 64 { 55:12 BADDR, 3:0 SZ } HDBSSBR_EL2;

// Performance Monitors Device Affinity register
__register 64 { 39:32 Aff3, 30:30 U, 24:24 MT, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } PMDEVAFF;

// System Control Register (EL1)
__register 64 { 26:26 TLBOSNIS, 25:25 FDIT, 24:24 BTD, 23:23 BTD0, 22:22 EnIA2, 21:21 EnIB2, 20:20 EnDA2, 19:19 EnDB2, 12:12 CPTM0, 11:11 CPTM, 10:10 CPTA0, 9:9 CPTA, 8:8 EnPACM0, 7:7 EnPACM, 6:6 EnIDCP128, 5:5 EASE, 4:4 EnANERR, 3:3 EnADERR, 2:2 NMEA } SCTLR2_EL1;

// IRS SPI VM Assignment Register
__register 64 { 63:63 VIRT, 15:0 VM_ID } IRS_SPI_VMR;

// Trace Device Configuration Register
__register 64 {  } TRCDEVID;

// Extended System Control Masking Register (EL2)
__register 64 { 26:26 TLBOSNIS, 25:25 FDIT, 24:24 BTD, 23:23 BTD0, 22:22 EnIA2, 21:21 EnIB2, 20:20 EnDA2, 19:19 EnDB2, 12:12 CPTM0, 11:11 CPTM, 10:10 CPTA0, 9:9 CPTA, 8:8 EnPACM0, 7:7 EnPACM, 6:6 EnIDCP128, 5:5 EASE, 4:4 EnANERR, 3:3 EnADERR, 2:2 NMEA, 1:1 EMEC } SCTLR2MASK_EL2;

// Interrupt Controller Domain Highest Priority Pending Interrupt Register
__register 64 { 3:3 P_HPPI, 2:2 RL_HPPI, 1:1 S_HPPI, 0:0 NS_HPPI } ICC_DOMHPPIR_EL3;

// Holds the priority of the corresponding interrupt for each extended SPI supported by the GIC.
array [0..255] of __register 32 { 31:24 Priority_offset_3B, 23:16 Priority_offset_2B, 15:8 Priority_offset_1B, 7:0 Priority_offset_0B } GICD_IPRIORITYRE;

// Virtualization Secure Translation Control Register
__register 32 { 33:33 SL2, 30:30 SA, 29:29 SW, 15:14 TG0, 7:6 SL0, 5:0 T0SZ } VSTCR_EL2;

// Error Record <n> Primary Status Register
array [0..65534] of __register 64 { 31:31 AV, 30:30 V, 26:26 MV, 15:8 IERR, 29:29 ERI, 24:24 FHI, 19:19 CRI, 29:29 UE, 28:28 ER, 27:27 OF, 25:24 CE, 23:23 DE, 22:22 PN, 21:20 UET, 19:19 CI, 18:18 RV, 17:17 RV2, 7:0 SERR } ERRSTATUS;

// Hypervisor Debug Fine-Grained Read Trap Register 2
__register 64 { 24:24 nPMBMAR_EL1, 23:23 nMDSTEPOP_EL1, 22:22 nTRBMPAM_EL1, 20:20 nTRCITECR_EL1, 19:19 nPMSDSFR_EL1, 18:18 nSPMDEVAFF_EL1, 17:17 nSPMID, 16:16 nSPMSCR_EL1, 15:15 nSPMACCESSR_EL1, 14:14 nSPMCR_EL0, 13:13 nSPMOVS, 12:12 nSPMINTEN, 11:11 nSPMCNTEN, 10:10 nSPMSELR_EL0, 9:9 nSPMEVTYPERn_EL0, 8:8 nSPMEVCNTRn_EL0, 7:7 nPMSSCR_EL1, 6:6 nPMSSDATA, 5:5 nMDSELR_EL1, 4:4 nPMUACR_EL1, 3:3 nPMICFILTR_EL0, 2:2 nPMICNTR_EL0, 0:0 nPMECR_EL1 } HDFGRTR2_EL2;

// Virtualization Multiprocessor ID Register
__register 32 { 31:31 M, 30:30 U, 24:24 MT, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } VMPIDR;

// Debug Breakpoint Control Registers
array [0..63] of __register 64 { 31:30 LBNX, 29:29 SSCE, 28:24 MASK, 23:20 BT, 19:16 LBN, 15:14 SSC, 13:13 HMC, 8:5 BAS, 3:3 BT2, 2:1 PMC, 0:0 E } DBGBCR_EL1;

// IRS VPE Status Register
__register 32 { 1:1 V, 0:0 IDLE } IRS_VPE_STATUSR;

// Performance Monitors Instruction Counter Filter Register
__register 64 { 57:56 VS, 31:31 P, 30:30 U, 29:29 NSK, 28:28 NSU, 27:27 NSH, 26:26 M, 24:24 SH, 22:22 RLK, 21:21 RLU, 20:20 RLH, 15:0 evtCount } PMICFILTR_EL0;

// Error Record ID Register
__register 32 { 15:0 NUM } ERRIDR;

// AArch32 Instruction Set Attribute Register 4
__register 32 { 31:28 SWP_frac, 27:24 PSR_M, 23:20 SynchPrim_frac, 19:16 Barrier, 15:12 SMC, 11:8 Writeback, 7:4 WithShifts, 3:0 Unpriv } ID_ISAR4_EL1;

// Interrupt Controller Virtual Binary Point Register 1
__register 32 { 2:0 BinaryPoint } ICV_BPR1;

// MPAM Streaming Mode Bandwidth Control Register (EL1)
__register 64 { 63:63 HW_SCALE_ENABLE, 62:62 ENABLED, 61:61 HARDLIM, 31:0 MAX } MPAMBWSM_EL1;

// IRS Map Level 2 Virtual IST Register
__register 64 { 63:63 M, 47:32 VM_ID, 31:29 TYPE, 23:0 ID } IRS_VMAP_L2_VISTR;

// Non-secure Access Control Registers
array [0..63] of __register 32 {  } GICD_NSACRE;

// Redistributor Implementer Identification Register
__register 32 { 31:24 ProductID, 19:16 Variant, 15:12 Revision, 11:0 Implementer } GICR_IIDR;

// Saved Program Status Register (IRQ mode)
__register 32 { 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 15:10 IT, 24:24 J, 23:23 SSBS, 22:22 PAN, 21:21 DIT, 20:20 IL, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 5:5 T, 4:0 M } SPSR_irq;

// Debug Status and Control Register, Internal View
__register 32 { 30:30 RXfull, 29:29 TXfull, 18:18 NS, 17:17 SPNIDdis, 16:16 SPIDdis, 15:15 MDBGen, 12:12 UDCCdis, 5:2 MOE } DBGDSCRint;

// Counter-timer Kernel Control register
__register 32 { 17:17 EVNTIS, 9:9 PL0PTEN, 8:8 PL0VTEN, 7:4 EVNTI, 3:3 EVNTDIR, 2:2 EVNTEN, 1:1 PL0VCTEN, 0:0 PL0PCTEN } CNTKCTL;

// Selected Error Record Miscellaneous Register 1
__register 32 { 31:0 ERRnMISC0hi } ERXMISC1;

// Interrupt Controller Virtual End Of Interrupt Register 1
__register 32 { 23:0 INTID } ICV_EOIR1;

// System Control Register (EL1)
__register 64 { 63:63 TIDCP, 62:62 SPINTMASK, 61:61 NMI, 60:60 EnTP2, 59:59 TCSO, 58:58 TCSO0, 57:57 EPAN, 56:56 EnALS, 55:55 EnAS0, 54:54 EnASR, 49:46 TWEDEL, 45:45 TWEDEn, 44:44 DSSBS, 43:43 ATA, 42:42 ATA0, 41:40 TCF, 39:38 TCF0, 37:37 ITFSB, 36:36 BT1, 35:35 BT0, 34:34 EnFPM, 33:33 MSCEn, 32:32 CMOW, 31:31 EnIA, 30:30 EnIB, 29:29 LSMAOE, 28:28 nTLSMD, 27:27 EnDA, 26:26 UCI, 25:25 EE, 24:24 E0E, 23:23 SPAN, 22:22 EIS, 21:21 IESB, 20:20 TSCXT, 19:19 WXN, 18:18 nTWE, 16:16 nTWI, 15:15 UCT, 14:14 DZE, 13:13 EnDB, 12:12 I, 11:11 EOS, 10:10 EnRCTX, 9:9 UMA, 8:8 SED, 7:7 ITD, 6:6 nAA, 5:5 CP15BEN, 4:4 SA0, 3:3 SA, 2:2 C, 1:1 A, 0:0 M } SCTLR_EL1;

// Translation Control Masking Register (EL1)
__register 64 { 61:61 MTX1, 60:60 MTX0, 59:59 DS, 58:58 TCMA1, 57:57 TCMA0, 56:56 E0PD1, 55:55 E0PD0, 54:54 NFD1, 53:53 NFD0, 52:52 TBID1, 51:51 TBID0, 50:50 HWU162, 49:49 HWU161, 48:48 HWU160, 47:47 HWU159, 46:46 HWU062, 45:45 HWU061, 44:44 HWU060, 43:43 HWU059, 42:42 HPD1, 41:41 HPD0, 40:40 HD, 39:39 HA, 38:38 TBI1, 37:37 TBI0, 36:36 AS, 32:32 IPS, 30:30 TG1, 28:28 SH1, 26:26 ORGN1, 24:24 IRGN1, 23:23 EPD1, 22:22 A1, 16:16 T1SZ, 14:14 TG0, 12:12 SH0, 10:10 ORGN0, 8:8 IRGN0, 7:7 EPD0, 0:0 T0SZ } TCRMASK_EL1;

// VMID Sample Register
__register 32 { 15:8, 7:0 VMID } PMVIDSR;

// Physical Fault Address Register (EL2)
__register 64 { 63:63 NS, 62:62 NSE, 61:61 NSE2, 55:52, 51:48 PA } PFAR_EL2;

// Counter-timer Virtual Offset register
__register 64 { 63:0 VOffset } CNTVOFF;

// Performance Monitors Device ID register
__register 32 { 11:8 EXTPMN, 7:4 PMSS, 3:0 PCSample } PMDEVID;

// Peripheral Identification Register 6
__register 32 {  } TRBPIDR6;

// Trace IMP DEF Register 0
__register 32 { 7:4 EN, 3:0 SUPPORT } TRCIMSPEC0;

// Activity Monitors Event Counter Registers 0
array [0..3] of __register 64 { 63:0 ACNT } AMEVCNTR0_EL0;

// ITS Software Error Syndrome Register 0
__register 64 { 63:32 DEVICE_ID, 31:0 EVENT_ID } ITS_SWERR_SYNDROMER0;

// Trace Branch Broadcast Control Register
__register 32 { 8:8 MODE } TRCBBCTLR;

// Interrupt Set-Enable Register 0
__register 32 {  } GICR_ISENABLER0;

// Error Record <n> Pseudo-fault Generation Feature Register
array [0..65534] of __register 64 { 30:30 R, 29:29 SYN, 28:28 NA, 12:12 MV, 11:11 AV, 10:10 PN, 9:9 ER, 8:8 CI, 7:6 CE, 5:5 DE, 4:4 UEO, 3:3 UER, 2:2 UEU, 1:1 UC, 0:0 OF } ERRPFGF;

// Trace ViewInst Include/Exclude Control Register
__register 64 {  } TRCVIIECTLR;

// Alternate MECID for EL1&0 stage 2 translation regime
__register 64 { 15:0 MECID } VMECID_A_EL2;

// Hypervisor Configuration Masking Register
__register 64 { 60:60 TWEDEL, 59:59 TWEDEn, 58:58 TID5, 57:57 DCT, 56:56 ATA, 55:55 TTLBOS, 54:54 TTLBIS, 53:53 EnSCXT, 52:52 TOCU, 51:51 AMVOFFEN, 50:50 TICAB, 49:49 TID4, 48:48 GPF, 47:47 FIEN, 46:46 FWB, 45:45 NV2, 44:44 AT, 43:43 NV1, 42:42 NV, 41:41 API, 40:40 APK, 37:37 TEA, 36:36 TERR, 35:35 TLOR, 34:34 E2H, 33:33 ID, 32:32 CD, 31:31 RW, 30:30 TRVM, 29:29 HCD, 28:28 TDZ, 27:27 TGE, 26:26 TVM, 25:25 TTLB, 24:24 TPU, 23:23 TPCP, 22:22 TSW, 21:21 TACR, 20:20 TIDCP, 19:19 TSC, 18:18 TID3, 17:17 TID2, 16:16 TID1, 15:15 TID0, 14:14 TWE, 13:13 TWI, 12:12 DC, 10:10 BSU, 9:9 FB, 8:8 VSE, 7:7 VI, 6:6 VF, 5:5 AMO, 4:4 IMO, 3:3 FMO, 2:2 PTW, 1:1 SWIO, 0:0 VM } HCRMASK_EL2;

// External Debug Component Identification Register 0
__register 32 { 7:0 PRMBL_0 } EDCIDR0;

// Interrupt Controller List Registers
array [0..15] of __register 64 { 63:62 State, 61:61 HW, 60:60 Group, 59:59 NMI, 55:48 Priority, 44:32 pINTID, 31:0 vINTID } ICH_LR_EL2;

// MPAM Long Memory Bandwidth Usage Monitor Register
__register 64 { 63:63 NRDY, 62:0 VALUE } MSMON_MBWU_L;

// Stack Pointer (EL3)
__register 64 { 63:0 StackPointer } SP_EL3;

// Hyp Vector Base Address Register
__register 32 { 31:5 VBA } HVBAR;

// Hardware Accelerator for Cleaning Dirty State Consumer Register
__register 64 { 63:62 ERR_REASON, 18:0 INDEX } HACDBSCONS_EL2;

// Debug OS Lock Status Register
__register 32 { 0:0 OSLM, 2:2 nTT, 1:1 OSLK } DBGOSLSR;

// Guarded Control Stack Pointer Register (EL2)
__register 64 { 63:3 PTR } GCSPR_EL2;

// Trace Claim Tag Clear Register
__register 64 {  } TRCCLAIMCLR;

// Nested Virtual Extended Hypervisor Configuration Masking Register
__register 64 { 36:36 FNB, 35:35 VTLBIDOSEn, 34:34 NVnTTLBOS, 33:33 NVnTTLBIS, 32:32 NVnTTLB, 31:31 FDIT, 27:27 NVTGE, 26:26 SRMASKEn, 25:25 VTLBIDEn, 24:24 PACMEn, 23:23 EnFPM, 22:22 GCSEn, 21:21 EnIDCP128, 20:20 EnSDERR, 19:19 TMEA, 18:18 EnSNERR, 17:17 D128En, 16:16 PTTWI, 15:15 SCTLR2En, 14:14 TCR2En, 11:11 MSCEn, 10:10 MCE2, 9:9 CMOW, 8:8 VFNMI, 7:7 VINMI, 6:6 TALLINT, 5:5 SMPME, 4:4 FGTnXS, 3:3 FnXS, 2:2 EnASR, 1:1 EnALS, 0:0 EnAS0 } NVHCRXMASK_EL2;

// Interrupt Controller Virtual Active Priorities Group 0 Registers
array [0..3] of __register 64 {  } ICV_AP0R_EL1;

// Trace ID Register 13
__register 64 { 31:0 NUMCONDSPC } TRCIDR13;

// Auxiliary Control Register (EL3)
__register 64 {  } ACTLR_EL3;

// Non-secure Access Control Register
__register 32 {  } GICR_NSACR;

// Hyp Configuration Register
__register 32 { 30:30 TRVM, 29:29 HCD, 27:27 TGE, 26:26 TVM, 25:25 TTLB, 24:24 TPU, 23:23 TPC, 22:22 TSW, 21:21 TAC, 20:20 TIDCP, 19:19 TSC, 18:18 TID3, 17:17 TID2, 16:16 TID1, 15:15 TID0, 14:14 TWE, 13:13 TWI, 12:12 DC, 11:10 BSU, 9:9 FB, 8:8 VA, 7:7 VI, 6:6 VF, 5:5 AMO, 4:4 IMO, 3:3 FMO, 2:2 PTW, 1:1 SWIO, 0:0 VM } HCR;

// Activity Monitors Control Register
__register 32 { 17:17 CG1RZ, 10:10 HDBG } AMCR;

// Redistributor Invalidate All Register
__register 64 { 63:63 V, 47:32 vPEID } GICR_INVALLR;

// Interrupt Clear-Enable Registers
array [1..2] of __register 32 {  } GICR_ICENABLERE;

// Interrupt Controller Virtual Interrupt Acknowledge Register 1
__register 32 { 23:0 INTID } ICV_IAR1;

// Activity Monitors Event Counter Registers 1
array [0..15] of __register 64 { 63:0 ACNT } AMEVCNTR1;

// Performance Monitors Implementation Identification Register
__register 64 { 31:20 ProductID, 19:16 Variant, 15:12 Revision, 11:0 Implementer } PMIIDR;

// Reset Management Register (EL2)
__register 32 { 1:1 RR, 0:0 AA64 } RMR_EL2;

// CTI Peripheral Identification Register 2
__register 32 { 7:4 REVISION, 3:3 JEDEC, 2:0 DES_1 } CTIPIDR2;

// Interrupt Configuration Registers
array [0..63] of __register 32 {  } GICD_ICFGR;

// Interrupt Controller Virtual Highest Priority Pending Interrupt Register 1
__register 32 { 23:0 INTID } ICV_HPPIR1_EL1;

// Trace Peripheral Identification Register 0
__register 32 { 7:0 PART_0 } TRCPIDR0;

// IRS Identification Register 1
__register 32 { 22:20 PRI_BITS, 19:16 IAFFID_BITS, 15:0 PE_CNT } IRS_IDR1;

// MPAM Ingress PARTID Translation Mask Configuration Register
__register 32 { 4:0 MASK_WD } MPAMCFG_IN_TL_MASK;

// AArch64 Memory Model Feature Register 2
__register 64 { 63:60 E0PD, 59:56 EVT, 55:52 BBM, 51:48 TTL, 43:40 FWB, 39:36 IDS, 35:32 AT, 31:28 ST, 27:24 NV, 23:20 CCIDX, 19:16 VARange, 15:12 IESB, 11:8 LSM, 7:4 UAO, 3:0 CnP } ID_AA64MMFR2_EL1;

// CTI Lock Status Register
__register 32 { 2:2 nTT, 1:1 SLK, 0:0 SLI } CTILSR;

// System Performance Monitors Access Register (EL3)
__register 64 {  } SPMACCESSR_EL3;

// MPAM Virtual PARTID Mapping Register 0
__register 64 { 63:48 PhyPARTID3, 47:32 PhyPARTID2, 31:16 PhyPARTID1, 15:0 PhyPARTID0 } MPAMVPM0_EL2;

// Tag Fault Status Register (EL2)
__register 64 { 1:1 TF1, 0:0 TF0 } TFSR_EL2;

// Interrupt Controller System Register Enable register
__register 32 { 2:2 DIB, 1:1 DFB, 0:0 SRE } ICC_SRE;

// Interrupt Controller Virtual PPI Set Pending State Registers
array [0..1] of __register 64 {  } ICV_PPI_SPENDR_EL1;

// Sampling Event Filter Register
__register 64 { 63:63, 62:62, 61:61, 60:60, 59:59, 58:58, 57:57, 56:56, 55:55, 54:54, 53:53, 52:52, 51:51, 50:50, 49:49, 48:48, 31:31, 30:30, 29:29, 28:28, 27:27, 26:26, 25:25, 25:25, 24:24, 24:24, 23:23, 22:22, 21:21, 20:20, 19:19, 18:18, 17:17, 15:15, 14:14, 13:13, 12:12, 11:11, 10:10, 9:9, 8:8, 7:7, 6:6, 5:5, 4:4, 3:3, 2:2, 1:1 E } PMSEVFR_EL1;

// AArch32 Memory Model Feature Register 1
__register 32 { 31:28 BPred, 27:24 L1TstCln, 23:20 L1Uni, 19:16 L1Hvd, 15:12 L1UniSW, 11:8 L1HvdSW, 7:4 L1UniVA, 3:0 L1HvdVA } ID_MMFR1_EL1;

// Branch Record Buffer Function Control Register
__register 64 { 29:28 BANK, 22:22 CONDDIR, 21:21 DIRCALL, 20:20 INDCALL, 19:19 RTN, 18:18 INDIRECT, 17:17 DIRECT, 16:16 EnI, 7:7 PAUSED } BRBFCR_EL1;

// MPAM Partition Configuration Selection Register
__register 32 { 27:24 RIS, 18:18 DEFAULT_PARTID, 17:17 INGRESS_TL, 16:16 INTERNAL, 15:0 PARTID_SEL } MPAMCFG_PART_SEL;

// External Debug Halting Syndrome Register
__register 64 { 40:40 GCS, 23:18 WPT, 17:17 WPTV, 16:16 WPF, 15:15 FnP, 13:13 VNCR, 10:10 FnV, 8:8 CM, 6:6 WnR } EDHSR;

// Auxiliary Fault Status Register 1 (EL1)
__register 32 {  } AFSR1_EL1;

// Revision ID Register
__register 32 {  } REVIDR;

// IRS VPE Selection Register
__register 64 { 63:63 S, 47:32 VPE_ID, 15:0 VM_ID } IRS_VPE_SELR;

// Counter-timer Physical Timer CompareValue
__register 64 { 63:0 CompareValue } CNTP_CVAL;

// Selected Pseudo-fault Generation Countdown Register
__register 64 { 63:0 ERRnPFGCDN } ERXPFGCDN_EL1;

// IRS Identification Register 6
__register 32 { 24:0 SPI_IRS_RANGE } IRS_IDR6;

// Interrupt Clear-Enable Registers
array [0..31] of __register 32 {  } GICD_ICENABLER;

// Debug Link Register
__register 32 { 31:0 ADDR } DLR;

// CTI Input Channel to Output Trigger Enable registers
array [0..31] of __register 32 {  } CTIOUTEN;

// Memory Attribute Indirection Register (EL3)
__register 64 {  } MAIR_EL3;

// Instruction Set Attribute Register 1
__register 32 { 31:28 Jazelle, 27:24 Interwork, 23:20 Immediate, 19:16 IfThen, 15:12 Extend, 11:8 Except_AR, 7:4 Except, 3:0 Endian } ID_ISAR1;

// External Debug Peripheral Identification Register 0
__register 32 { 7:0 PART_0 } EDPIDR0;

// Trace Buffer Write Pointer Register
__register 64 { 63:0 PTR } TRBPTR_EL1;

// Extended Memory Attribute Indirection Register (EL1)
__register 64 {  } MAIR2_EL1;

// Tag Fault Status Register (EL0).
__register 64 { 1:1 TF1, 0:0 TF0 } TFSRE0_EL1;

// Interrupt Controller Virtual Machine Control Register
__register 32 { 31:24 VPMR, 23:21 VBPR0, 20:18 VBPR1, 9:9 VEOIM, 4:4 VCBPR, 3:3 VFIQEn, 2:2 VAckCtl, 1:1 VENG1, 0:0 VENG0 } ICH_VMCR;

// Trace Context Identifier Comparator Control Register 0
__register 32 {  } TRCCIDCCTLR0;

// Performance Monitors Cycle Counter
__register 64 { 63:0 CCNT } PMCCNTR_EL0;

// Report ITS's affinity.
__register 32 { 31:24 Aff3, 23:16 Aff2, 15:8 Aff1 } GITS_MPIDR;

// Active Priorities Registers
array [0..3] of __register 32 {  } GICH_APR;

// System Performance Monitors Configuration Register
__register 64 { 31:28 NCG, 24:24 HDBG, 23:23 TRO, 22:22 SS, 21:21 FZO, 20:20 MSI, 17:17 NA, 16:16 EX, 13:8 SIZE, 7:0 N } SPMCFGR_EL1;

// Breakpoint and Watchpoint Selection Register
__register 64 { 5:4 BANK } MDSELR_EL1;

// MPAM Memory Bandwidth Partitioning Window Width Configuration Register
__register 32 { 23:8 US_INT, 7:0 US_FRAC } MPAMCFG_MBW_WINWD;

// MPAM Monitor Overflow Status Register
__register 32 { 31:31 CSU_OFLOW_PND, 30:30 MBWU_OFLOW_PND, 29:29 CSA_OFLOW_PND } MSMON_OFLOW_SR;

// Debug Data Transfer Register, half-duplex
__register 64 { 63:32 HighWord, 31:0 LowWord } DBGDTR_EL0;

// Performance Monitors Event Type Registers
array [0..30] of __register 32 { 31:31 P, 30:30 U, 29:29 NSK, 28:28 NSU, 27:27 NSH, 25:25 MT, 21:21 RLU, 15:10, 9:0 evtCount } PMEVTYPER;

// Hyp Auxiliary Control Register 2
__register 32 {  } HACTLR2;

// Interrupt Controller Interrupt Acknowledge Register 0
__register 32 { 23:0 INTID } ICC_IAR0;

// Distributor Implementer Identification Register
__register 32 { 31:24 ProductID, 19:16 Variant, 15:12 Revision, 11:0 Implementer } GICD_IIDR;

// Pointer Authentication Key B for Instruction (bits[127:64]) 
__register 64 { 63:0 APIBKeyHi } APIBKeyHi_EL1;

// Interrupt Controller Physical PPI Set Pending State Registers
array [0..1] of __register 64 {  } ICC_PPI_SPENDR_EL1;

// MPAM0 Register (EL1)
__register 64 { 63:48 altPMG, 47:32 PMG, 31:16 altPARTID, 15:0 PARTID, 47:40 PMG_D, 39:32 PMG_I, 31:16 PARTID_D, 15:0 PARTID_I } MPAM0_EL1;

// MPAM Control Register (EL2)
__register 64 { 63:63 MPAMEN, 52:52 EN_ALT_IPMG, 51:51 EN_ALT_IPARTID, 50:50 EN_ALT_IPMG_EL0, 49:49 EN_ALT_IPARTID_EL0 } MPAMCTL_EL2;

// MPAM Features Cache Capacity Partitioning ID register
__register 32 { 31:31 HAS_CMAX_SOFTLIM, 30:30 NO_CMAX, 29:29 HAS_CMIN, 28:28 HAS_CASSOC, 12:8 CASSOC_WD, 5:0 CMAX_WD } MPAMF_CCAP_IDR;

// AArch32 Memory Model Feature Register 0
__register 32 { 31:28 InnerShr, 27:24 FCSE, 23:20 AuxReg, 19:16 TCM, 15:12 ShareLvl, 11:8 OuterShr, 7:4 PMSA, 3:0 VMSA } ID_MMFR0_EL1;

// AArch32 Auxiliary Feature Register 0
__register 32 {  } ID_AFR0_EL1;

// CTI Peripheral Identification Register 0
__register 32 { 7:0 PART_0 } CTIPIDR0;

// External Debug Feature Register
__register 64 { 59:56 ExtTrcBuff, 47:44 TraceBuffer, 43:40 TraceFilt, 31:28 CTX_CMPs, 23:20 WRPs, 19:16 PMSS, 15:12 BRPs, 11:8 PMUVer, 7:4 TraceVer } EDDFR;

// Component Identification Register 0
__register 32 { 7:0 PRMBL_0 } ERRCIDR0;

// Interrupt Controller Virtual Interrupt Priority Mask Register
__register 32 { 7:0 Priority } ICV_PMR;

// ITS Configuration Register 1
__register 32 { 7:7 ITT_RA, 6:6 DT_RA, 5:4 IC, 3:2 OC, 1:0 SH } ITS_CR1;

// Auxiliary Feature Register 0
__register 32 {  } ID_AFR0;

// Debug CLAIM Tag Clear Register
__register 32 {  } DBGCLAIMCLR_EL1;

// System Control Register (EL2)
__register 64 { 26:26 TLBOSNIS, 25:25 FDIT, 24:24 BTD, 23:23 BTD0, 22:22 EnIA2, 21:21 EnIB2, 20:20 EnDA2, 19:19 EnDB2, 12:12 CPTM0, 11:11 CPTM, 10:10 CPTA0, 9:9 CPTA, 8:8 EnPACM0, 7:7 EnPACM, 6:6 EnIDCP128, 5:5 EASE, 4:4 EnANERR, 3:3 EnADERR, 2:2 NMEA, 1:1 EMEC } SCTLR2_EL2;

// Interrupt Controller Virtual Interrupt Priority Mask Register
__register 32 { 7:0 Priority } ICV_PMR_EL1;

// Auxiliary Memory Attribute Indirection Register 0
__register 32 {  } AMAIR0;

// Privileged Access Never
__register 32 { 22:22 PAN } PAN;

// Trace Status Register
__register 32 { 1:1 PMSTABLE, 0:0 IDLE } TRCSTATR;

// Error Record <n> Pseudo-fault Generation Countdown Register
array [0..65534] of __register 64 { 31:0 CDN } ERRPFGCDN;

// Guarded Control Stack Control Register (EL2)
__register 64 { 9:9 STREn, 8:8 PUSHMEn, 6:6 EXLOCKEN, 5:5 RVCHKEN, 0:0 PCRSEL } GCSCR_EL2;

// ITS Synchronize Translation Events Register
__register 64 { 63:63 SYNC, 32:32 SYNCALL, 31:0 DEVICE_ID } ITS_SYNCR;

// Counter-timer Frequency Register
__register 32 { 31:0 ClockFreq } CNTFRQ_EL0;

// Interrupt Group Modifier Registers (extended SPI range)
array [0..31] of __register 32 {  } GICD_IGRPMODRE;

// Permission Overlay Register 1 (EL1)
__register 64 {  } POR_EL1;

// Interrupt Controller Virtual PPI Clear Pending State Registers
array [0..1] of __register 64 {  } ICV_PPI_CPENDR_EL1;

// Selected Error Record Miscellaneous Register 1
__register 64 { 63:0 ERRnMISC1 } ERXMISC1_EL1;

// PC Sample-based Profiling Control Register
__register 64 { 4:4 SS, 1:1 IMP, 0:0 EN } PMPCSCTL;

// Redistributor Synchronize Register
__register 32 { 0:0 Busy } GICR_SYNCR;

// Debug Power Control Register
__register 32 { 0:0 CORENPDRQ } DBGPRCR;

// Interrupt Controller Running Priority Register
__register 32 { 7:0 Priority } ICC_RPR;

// Saved Program Status Register
__register 32 { 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 15:10 IT, 24:24 J, 23:23 SSBS, 22:22 PAN, 21:21 DIT, 20:20 IL, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 5:5 T, 4:0 M } SPSR;

// Set PARTID and PMG Register
__register 32 { 23:16 PMG, 15:0 PARTID } GICR_PARTIDR;

// Set Secure SPI Pending Register
__register 32 { 12:0 INTID } GICD_SETSPI_SR;

// EL1 Software Thread ID Register
__register 64 { 63:0 ThreadID } TPIDR_EL1;

// AArch64 Debug Feature Register 1
__register 64 { 63:56 ABL_CMPs, 55:52 DPFZS, 51:48 EBEP, 47:44 ITE, 43:40 ABLE, 39:36 PMICNTR, 35:32 SPMU, 31:24 CTX_CMPs, 23:16 WRPs, 15:8 BRPs, 7:0 SYSPMUID } ID_AA64DFR1_EL1;

// MPAM Monitor Overflow MSI Write MPAM Information Register
__register 32 { 23:16 PMG, 15:0 PARTID } MSMON_OFLOW_MSI_MPAM;

// Trace ID Register 4
__register 64 { 31:28 NUMVMIDC, 27:24 NUMCIDC, 23:20 NUMSSCC, 19:16 NUMRSPAIR, 15:12 NUMPC, 8:8 SUPPDAC, 7:4 NUMDVC, 3:0 NUMACPAIRS } TRCIDR4;

// Hypervisor Auxiliary Control Register
__register 32 {  } HACR_EL2;

// Interrupt Controller Monitor Control Register
__register 32 { 19:19 ExtRange, 18:18 RSS, 17:17 nDS, 15:15 A3V, 14:14 SEIS, 13:11 IDbits, 10:8 PRIbits, 6:6 PMHE, 5:5 RM, 4:4 EOImode_EL1NS, 3:3 EOImode_EL1S, 2:2 EOImode_EL3, 1:1 CBPR_EL1NS, 0:0 CBPR_EL1S } ICC_MCTLR;

// IRS SPI Status Register
__register 32 { 1:1 V, 0:0 IDLE } IRS_SPI_STATUSR;

// Virtual Redistributor LPI Pending Table Base Address Register
__register 64 { 63:63 Valid, 62:62 Doorbell, 61:61 PendingLast, 60:60 Dirty, 59:59 VGrp0En, 58:58 VGrp1En, 15:0 vPEID, 62:62 IDAI, 58:56 OuterCache, 51:16 Physical_Address, 11:10 Shareability, 9:7 InnerCache } GICR_VPENDBASER;

// Memory Model Feature Register 2
__register 32 { 31:28 HWAccFlg, 27:24 WFIStall, 23:20 MemBarr, 19:16 UniTLB, 15:12 HvdTLB, 11:8 L1HvdRng, 7:4 L1HvdBG, 3:0 L1HvdFG } ID_MMFR2;

// External Debug Device ID register 2
__register 32 {  } EDDEVID2;

// Activity Monitors Count Enable Set Register 0
__register 64 {  } AMCNTENSET0_EL0;

// Tag Fault Status Register (EL1)
__register 64 { 1:1 TF1, 0:0 TF0 } TFSR_EL1;

// Interrupt Routing Registers
array [32..1019] of __register 64 { 39:32 Aff3, 31:31 Interrupt_Routing_Mode, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } GICD_IROUTER;

// Critical Error Interrupt Configuration Register 1
__register 32 { 31:0 DATA } ERRCRICR1;

// Activity Monitors Peripheral Identification Register 1
__register 32 { 7:4 DES_0, 3:0 PART_1 } AMPIDR1;

// Interrupt Controller Active Priorities Group 1 Registers
array [0..3] of __register 32 {  } ICC_AP1R;

// Virtualization Translation Table Base Register
__register 128 { 47:5 BADDR, 63:48 VMID, 2:1 SKL, 0:0 CnP } VTTBR_EL2;

// EL0 Read/Write Software Thread ID Register
__register 64 { 63:0 ThreadID } TPIDR_EL0;

// Interrupt Controller Physical Highest Priority Pending Interrupt Register (EL3)
__register 64 { 32:32 HPPIV, 31:29 TYPE, 23:0 ID } ICC_HPPIR_EL3;

// Performance Monitors Count Enable Clear register
__register 32 { 31:31 C } PMCNTENCLR;

// Activity Monitors User Enable Register
__register 32 { 0:0 EN } AMUSERENR;

// Counter-timer Kernel Control Register
__register 32 { 19:19 CNTPMASK, 18:18 CNTVMASK, 17:17 EVNTIS, 16:16 EL1NVVCT, 15:15 EL1NVPCT, 14:14 EL1TVCT, 13:13 EL1TVT, 12:12 ECV, 11:11 EL1PTEN, 10:10 EL1PCTEN, 9:9 EL0PTEN, 8:8 EL0VTEN, 7:4 EVNTI, 3:3 EVNTDIR, 2:2 EVNTEN, 1:1 EL0VCTEN, 0:0 EL0PCTEN } CNTKCTL_EL1;

// External Debug Context ID Sample Register
__register 32 { 31:0 CONTEXTIDR } EDCIDSR;

// System Performance Monitors Event Filter Control Register 2
array [0..63] of __register 64 {  } SPMEVFILT2R_EL0;

// Trace Resources Status Register
__register 32 { 12:12 TA } TRCRSR;

// Exception Syndrome Register (EL2)
__register 32 { 55:32 ISS2, 31:26 EC, 25:25 IL, 24:0 ISS } ESR_EL2;

// Performance Monitors Instruction Counter Register
__register 64 { 63:0 ICNT } PMICNTR_EL0;

// MPAM Error MSI Write Attributes Register
__register 32 { 29:28 MSI_SH, 27:24 MSI_MEMATTR, 0:0 MSIEN } MPAMF_ERR_MSI_ATTR;

// MPAM Features Cache Storage Usage Monitoring ID register
__register 64 { 32:32 HAS_MON_SEC, 31:31 HAS_CAPTURE, 30:30 CSU_RO, 29:29 HAS_XCL, 27:27 HAS_OFLOW_LNKG, 26:26 HAS_OFSR, 25:25 HAS_CEVNT_OFLW, 24:24 HAS_OFLOW_CAPT, 23:23 NO_MATCH_PARTID, 22:22 NO_MATCH_PMG, 15:0 NUM_MON } MPAMF_CSUMON_IDR;

// Counter-timer Hyp Physical Timer Control register
__register 32 { 2:2 ISTATUS, 1:1 IMASK, 0:0 ENABLE } CNTHP_CTL;

// Virtual Machine End Of Interrupt Register
__register 32 { 24:0 INTID } GICV_EOIR;

// Trace ID Register 10
__register 64 { 31:0 NUMP1KEY } TRCIDR10;

// Hypervisor Control Register
__register 32 { 31:27 EOICount, 7:7 VGrp1DIE, 6:6 VGrp1EIE, 5:5 VGrp0DIE, 4:4 VGrp0EIE, 3:3 NPIE, 2:2 LRENPIE, 1:1 UIE, 0:0 En } GICH_HCR;

// Trace Event Control 0 Register
__register 32 { 31:31 EVENT3_TYPE, 28:24 EVENT3_SEL, 23:23 EVENT2_TYPE, 20:16 EVENT2_SEL, 15:15 EVENT1_TYPE, 12:8 EVENT1_SEL, 7:7 EVENT0_TYPE, 4:0 EVENT0_SEL } TRCEVENTCTL0R;

// Interrupt Controller Virtual Machine Control Register
__register 32 { 31:24 VPMR, 0:0 EN, 23:21 VBPR0, 20:18 VBPR1, 9:9 VEOIM, 4:4 VCBPR, 3:3 VFIQEn, 2:2 VAckCtl, 1:1 VENG1, 0:0 VENG0 } ICH_VMCR_EL2;

// Performance Monitors Count Enable Clear Register
__register 32 { 32:32 F0, 31:31 C } PMCNTENCLR_EL0;

// ITS Identification Register 0
__register 32 { 31:16 ITSID, 9:9 MPAM2, 8:8 SWE, 7:7 MPAM, 6:6 MEC, 5:2 PA_RANGE, 1:0 INT_DOM } ITS_IDR0;

// Selected Error Record Feature Register
__register 64 { 63:0 ERRnFR } ERXFR_EL1;

// Virtual Type Register
__register 32 { 31:29 PRIbits, 28:26 PREbits, 25:23 IDbits, 22:22 SEIS, 21:21 A3V, 4:0 ListRegs } GICH_VTR;

// MPAM Virtual Partition Mapping Valid Register
__register 64 {  } MPAMVPMV_EL2;

// Counter-timer Secure Virtual Timer Control Register (EL2)
__register 32 { 2:2 ISTATUS, 1:1 IMASK, 0:0 ENABLE } CNTHVS_CTL_EL2;

// ITS Implementer Identification Register
__register 32 { 31:20 ProductID, 19:16 Variant, 15:12 Revision, 11:0 Implementer } ITS_IIDR;

// MPAM Memory Bandwidth Proportional Stride Partition Configuration Register
__register 32 { 31:31 EN, 15:0 STRIDEM1 } MPAMCFG_MBW_PROP;

// AArch32 Instruction Set Attribute Register 6
__register 32 { 31:28 CLRBHB, 27:24 I8MM, 23:20 BF16, 19:16 SPECRES, 15:12 SB, 11:8 FHM, 7:4 DP, 3:0 JSCVT } ID_ISAR6_EL1;

// AArch32 Processor Feature Register 0
__register 32 { 31:28 RAS, 27:24 DIT, 23:20 AMU, 19:16 CSV2, 15:12 State3, 11:8 State2, 7:4 State1, 3:0 State0 } ID_PFR0_EL1;

// Saved Program Status Register (Undefined mode)
__register 32 { 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 15:10 IT, 24:24 J, 23:23 SSBS, 22:22 PAN, 21:21 DIT, 20:20 IL, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 5:5 T, 4:0 M } SPSR_und;

// Performance Monitors Selected Event Type Register
__register 32 { 63:0 EVTYPERn } PMXEVTYPER_EL0;

// Interrupt Controller Virtual Context Register
__register 64 { 63:63 V, 62:62 F, 61:61 IRICHPPIDIS, 60:60 DB, 59:55 DBPM, 47:32 VPE, 15:0 VM } ICH_CONTEXTR_EL2;

// Peripheral Identification Register 3
__register 32 { 7:4 REVAND, 3:0 CMOD } TRBPIDR3;

// IRS SET LPI Register
__register 32 { 23:0 ID } IRS_SETLPIR;

// SGI Clear-Pending Registers
array [0..3] of __register 32 {  } GICD_CPENDSGIR;

// Counter-timer Physical Count Register
__register 64 { 63:0 PhysicalCount } CNTPCT_EL0;

// MPAM Virtual PARTID Mapping Register 4
__register 64 { 63:48 PhyPARTID19, 47:32 PhyPARTID18, 31:16 PhyPARTID17, 15:0 PhyPARTID16 } MPAMVPM4_EL2;

// Debug CLAIM Tag Clear register
__register 32 {  } DBGCLAIMCLR;

// AArch32 Memory Model Feature Register 2
__register 32 { 31:28 HWAccFlg, 27:24 WFIStall, 23:20 MemBarr, 19:16 UniTLB, 15:12 HvdTLB, 11:8 L1HvdRng, 7:4 L1HvdBG, 3:0 L1HvdFG } ID_MMFR2_EL1;

// Random Number Full Entropy
__register 64 { 63:0 RNDRRS } RNDRRS;

// Debug Breakpoint Value Registers
array [0..63] of __register 64 { 31:0 ContextID, 63:32 ContextID2, 63:57, 56:53, 52:49 RESS, 56:53, 52:49, 48:2 VA, 47:40, 47:40, 39:32, 39:32 VMID } DBGBVR_EL1;

// Performance Monitors Event Count Saved Value Registers
array [0..30] of __register 64 { 63:0 EVCNT } PMEVCNTSVR_EL1;

// Saved Program Status Register (FIQ mode)
__register 32 { 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 15:10 IT, 24:24 J, 23:23 SSBS, 22:22 PAN, 21:21 DIT, 20:20 IL, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 5:5 T, 4:0 M } SPSR_fiq;

// Instruction Set Attribute Register 0
__register 32 { 27:24 Divide, 23:20 Debug, 19:16 Coproc, 15:12 CmpBranch, 11:8 BitField, 7:4 BitCount, 3:0 Swap } ID_ISAR0;

// Hypervisor IPA Fault Address Register
__register 64 { 63:63 NS, 47:4 FIPA } HPFAR_EL2;

// Performance Monitors Common Event Identification register 1
__register 32 {  } PMCEID1;

// Context ID Register (EL1)
__register 32 { 31:0 PROCID } CONTEXTIDR_EL1;

// CPU Interface Interrupt Acknowledge Register
__register 32 { 23:0 INTID } GICC_IAR;

// External Debug Status and Control Register
__register 32 { 31:31 TFO, 30:30 RXfull, 29:29 TXfull, 28:28 ITO, 27:27 RXO, 26:26 TXU, 25:25 PipeAdv, 24:24 ITE, 23:22 INTdis, 21:21 TDA, 20:20 MA, 19:19 SC2, 18:18 NS, 16:16 SDD, 15:15 NSE, 14:14 HDE, 13:10 RW, 9:8 EL, 7:7 A, 6:6 ERR, 5:0 STATUS } EDSCR;

// Virtual TLBI Domain Registers
array [0..3] of __register 64 {  } VTLBID_EL2;

// Interrupt Controller Binary Point Register 1
__register 32 { 2:0 BinaryPoint } ICC_BPR1;

// Trace Single-shot Comparator Control Register <n>
array [0..7] of __register 32 { 24:24 RST } TRCSSCCR;

// Guarded Control Stack Pointer Register (EL0)
__register 64 { 63:3 PTR } GCSPR_EL0;

// Multiprocessor Affinity Register
__register 64 { 39:32 Aff3, 30:30 U, 24:24 MT, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } MPIDR_EL1;

// Stage 2 Permission Indirection Register (EL2)
__register 64 {  } S2PIR_EL2;

// Interrupt Clear-Enable Registers
array [0..31] of __register 32 {  } GICD_ICENABLERE;

// IRS PE Control Register 0
__register 32 { 0:0 DPS } IRS_PE_CR0;

// Application Program Status Register
__register 32 { 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 22:22 PAN, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 4:0 M } APSR;

// Profiling Buffer Memory Attribute Register
__register 64 { 9:8 SH, 7:0 Attr } PMBMAR_EL1;

// Performance Monitors Event Type Registers
array [0..30] of __register 64 { 63:61 TC, 60:60 TE, 57:56 VS, 55:54 TLC, 43:32 TH, 31:31 P, 30:30 U, 29:29 NSK, 28:28 NSU, 27:27 NSH, 26:26 M, 25:25 MT, 24:24 SH, 22:22 RLK, 21:21 RLU, 20:20 RLH, 15:10, 9:0 evtCount } PMEVTYPER_EL0;

// Counter-timer Virtual Timer TimerValue
__register 32 { 31:0 TimerValue } CNTV_TVAL;

// Error Record <n> Feature Register
array [0..65534] of __register 64 { 55:55 NCE, 54:53 CE, 52:52 DE, 51:51 UEO, 50:50 UER, 49:49 UEU, 48:48 UC, 31:31 FRX, 3:2 ERT, 1:0 ED, 30:30 CED, 29:29 SRV, 28:28 RV, 27:26 DFI, 25:24 TS, 23:22 CI, 21:20 INJ, 19:18 CEO, 17:16 DUI, 15:15 RP, 14:12 CEC, 11:10 CFI, 9:8 UE, 7:6 FI, 5:4 UI } ERRFR;

// MPAM Virtual PARTID Mapping Register 1
__register 64 { 63:48 PhyPARTID7, 47:32 PhyPARTID6, 31:16 PhyPARTID5, 15:0 PhyPARTID4 } MPAMVPM1_EL2;

// Clear Non-secure SPI Pending Register
__register 32 { 12:0 INTID } GICM_CLRSPI_NSR;

// MPAM PMG Translation Ingress Control Register
__register 32 { 31:31 ENABLE, 15:0 PMGTL } MSMON_IN_TL;

// Accelerator Data
__register 64 { 31:0 ACCDATA } ACCDATA_EL1;

// Error Record <n> Pseudo-fault Generation Control Register
array [0..65534] of __register 64 { 31:31 CDNEN, 30:30 R, 12:12 MV, 11:11 AV, 10:10 PN, 9:9 ER, 8:8 CI, 7:6 CE, 5:5 DE, 4:4 UEO, 3:3 UER, 2:2 UEU, 1:1 UC, 0:0 OF } ERRPFGCTL;

// Multiple tag transfer ID Register
__register 64 { 3:0 BS } GMID_EL1;

// MPAM Monitor Memory Bandwidth Usage Root Control Register
__register 32 { 2:0 PAS } MSMON_MBWU_ROOTCR;

// Trace Buffer MPAM Configuration Register
__register 64 { 23:16 PMG, 26:26 EN, 15:0 PARTID, 25:24 MPAM_SP } TRBMPAM_EL1;

// Redistributor virtual SGI pending state request register
__register 32 { 15:0 vPEID } GICR_VSGIR;

// CTI Trigger In Status register
__register 32 {  } CTITRIGINSTATUS;

// Debug OS Lock Data Transfer Register, Transmit
__register 32 { 31:0 DTRTX } DBGDTRTXext;

// Saved Program Status Register (EL2)
__register 32 { 36:36 UINJ, 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 15:10 IT, 24:24 DIT, 12:12 SSBS, 22:22 PAN, 21:21 SS, 20:20 IL, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 5:5 T, 35:35 PACM, 34:34 EXLOCK, 32:32 PM, 25:25 TCO, 23:23 UAO, 13:13 ALLINT, 11:10 BTYPE, 9:9 D, 4:4, 4:4, 3:0, 3:0 M } SPSR_EL2;

// MPAM PMG Translation Egress Mask Control Register
__register 32 { 4:0 MASK_WD } MSMON_OUT_TL_MASK;

// Peripheral Identification Register 0
__register 32 { 7:0 PART_0 } ERRPIDR0;

// Profiling Buffer Status/syndrome Register (EL1)
__register 64 { 55:32 MSS2, 31:26 EC, 19:19 DL, 18:18 EA, 17:17 S, 16:16 COLL, 15:0 MSS } PMBSR_EL1;

// Debug Vector Catch Register
__register 32 { 31:31 NSF, 30:30 NSI, 28:28 NSD, 27:27 NSP, 26:26 NSS, 25:25 NSU, 15:15 MF, 14:14 MI, 12:12 MD, 11:11 MP, 10:10 MS, 7:7 SF, 6:6 SI, 4:4 SD, 3:3 SP, 2:2 SS, 1:1 SU, 7:7 F, 6:6 I, 4:4 D, 3:3 P, 2:2 S, 1:1 U } DBGVCR;

// ITS Architecture Identification Register
__register 32 { 11:8 Component, 7:4 ArchMajorRev, 3:0 ArchMinorRev } ITS_AIDR;

// Interrupt Controller Deactivate Interrupt Register
__register 32 { 23:0 INTID } ICC_DIR;

// Trace Counter Reload Value Register <n>
array [0..3] of __register 32 { 15:0 VALUE } TRCCNTRLDVR;

// External Debug Component Identification Register 3
__register 32 { 7:0 PRMBL_3 } EDCIDR3;

// Interrupt Controller Physical Control Register (EL1)
__register 64 { 38:38 PID, 37:32 IPPT, 2:2 LINK_IDLE, 1:1 LINK, 0:0 EN } ICC_CR0_EL1;

// IRS MEC Identification Register
__register 32 { 3:0 MECIDSIZE } IRS_MEC_IDR;

// MPAM Long Cache Storage Allocation Monitor Register
__register 64 { 63:63 NRDY, 62:0 VALUE } MSMON_CSA_L;

// Translation Table Base Register 0 (EL2)
__register 128 { 63:48 ASID, 2:1 SKL, 0:0 CnP, 87:80, 47:1 BADDR } TTBR0_EL2;

// Profiling Buffer Limit Address Register
__register 64 { 63:12 LIMIT, 7:7 nVM, 5:5 PMFZ, 2:1 FM, 0:0 E } PMBLIMITR_EL1;

// Virtual Machine Binary Point Register
__register 32 { 2:0 Binary_Point } GICV_BPR;

// SVE Control Register (EL2)
__register 64 { 3:0 LEN } ZCR_EL2;

// Interrupt Clear-Active Registers
array [1..2] of __register 32 {  } GICR_ICACTIVERE;

// Pointer Authentication Key A for Data (bits[63:0]) 
__register 64 { 63:0 APDAKeyLo } APDAKeyLo_EL1;

// MPAM Error Control Register
__register 32 { 0:0 INTEN } MPAMF_ECR;

// Interrupt Clear-Active Registers
array [0..31] of __register 32 {  } GICD_ICACTIVER;

// Virtualization Multiprocessor ID Register
__register 64 { 39:32 Aff3, 30:30 U, 24:24 MT, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } VMPIDR_EL2;

// Error Record Select Register
__register 32 { 15:0 SEL } ERRSELR;

// MPAM PE-side Maximum Bandwidth Control Register (EL3)
__register 64 { 63:63 HW_SCALE_ENABLE, 62:62 ENABLED, 61:61 HARDLIM, 49:49 nTRAPLOWER, 31:0 MAX } MPAMBW3_EL3;

// Vector Base Address Register (EL1)
__register 64 { 63:11 VBA } VBAR_EL1;

// Instruction Set Attribute Register 6
__register 32 { 31:28 CLRBHB, 27:24 I8MM, 23:20 BF16, 19:16 SPECRES, 15:12 SB, 11:8 FHM, 7:4 DP, 3:0 JSCVT } ID_ISAR6;

// Interrupt Controller PE Interrupt Affinity ID Register
__register 64 { 15:0 IAFFID } ICC_IAFFIDR_EL1;

// Vector Base Address Register
__register 32 { 31:5 VBA } VBAR;

// Current Cache Size ID Register 2
__register 32 { 23:0 NumSets } CCSIDR2_EL1;

// Stack Pointer (EL1)
__register 64 { 63:0 StackPointer } SP_EL1;

// Interrupt Controller Virtual PPI Clear Active Registers
array [0..1] of __register 64 {  } ICV_PPI_CACTIVER_EL1;

// Activity Monitors Event Counter Registers 1
array [0..15] of __register 64 { 63:0 ACNT } AMEVCNTR1_EL0;

// CTI External Multiplexer Control register
__register 32 {  } ASICCTL;

// Counter-timer Virtual Count Register
__register 64 { 63:0 VirtualCount } CNTVCT_EL0;

// MPAM Memory System Monitor Configure Cache Storage Usage Monitor Filter Register
__register 32 { 23:16 PMG, 15:0 PARTID, 31:31 XCL } MSMON_CFG_CSU_FLT;

// CPU Interface Deactivate Interrupt Register
__register 32 { 23:0 INTID } GICC_DIR;

// Counter-timer Virtual Timer Control Register (EL2)
__register 32 { 2:2 ISTATUS, 1:1 IMASK, 0:0 ENABLE } CNTHV_CTL_EL2;

// Fault Handling Interrupt Configuration Register 2
__register 32 { 7:7 IRQEN, 6:6 NSMSI, 5:4 SH, 3:0 MemAttr } ERRFHICR2;

// MPAM Monitor Overflow MSI Low-part Address Register
__register 32 { 31:2 MSI_ADDR_L } MSMON_OFLOW_MSI_ADDR_L;

// ITS DeviceID Register
__register 64 { 31:0 DEVICE_ID } ITS_DIDR;

// Trace Device Architecture Register
__register 32 { 31:21 ARCHITECT, 20:20 PRESENT, 19:16 REVISION, 15:12 ARCHVER, 11:0 ARCHPART } TRCDEVARCH;

// Performance Monitors Selected Event Type Register
__register 32 { 31:0 ETR } PMXEVTYPER;

// Activity Monitors Event Counter Virtual Offset Registers 1
array [0..15] of __register 64 { 63:0 VOffset } AMEVCNTVOFF1_EL2;

// Performance Monitors Control Register
__register 32 { 32:32 FZS, 9:9 FZO, 7:7 LP, 6:6 LC, 5:5 DP, 4:4 X, 3:3 D, 2:2 C, 1:1 P, 0:0 E, 31:24 IMP, 23:16 IDCODE, 15:11 N } PMCR_EL0;

// Primary Region Remap Register
__register 32 { 19:19 NS1, 18:18 NS0, 17:17 DS1, 16:16 DS0 } PRRR;

// Activity Monitors Device Affinity Register 0
__register 32 { 30:30 U, 24:24 MT, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } AMDEVAFF0;

// CTI Component Identification Register 2
__register 32 { 7:0 PRMBL_2 } CTICIDR2;

// Trace OS Lock Status Register
__register 32 { 0:0 OSLM, 1:1 OSLK } TRCOSLSR;

// Performance Monitors Integration mode Control register
__register 32 { 0:0 IME } PMITCTRL;

// MPAM Monitor Selection Root Control Register
__register 32 { 27:24 RIS, 15:0 MON_SEL } MSMON_SEL_ROOTCR;

// Activity Monitors Component Identification Register 3
__register 32 { 7:0 PRMBL_3 } AMCIDR3;

// Interrupt Clear-Active Registers (extended SPI range)
array [0..31] of __register 32 {  } GICD_ICACTIVERE;

// Component Identification Register 2
__register 32 { 7:0 PRMBL_2 } ERRCIDR2;

// Selected Error Record Miscellaneous Register 6
__register 32 { 31:0 ERRnMISC3lo } ERXMISC6;

// Trace ID Register 7
__register 32 {  } TRCIDR7;

// Trace ID Register 9
__register 32 { 31:0 NUMP0KEY } TRCIDR9;

// Performance Monitors Device Type register
__register 32 { 7:4 SUB, 3:0 MAJOR } PMDEVTYPE;

// External Debug Component Identification Register 1
__register 32 { 7:4 CLASS, 3:0 PRMBL_1 } EDCIDR1;

// External Debug Power/Reset Control Register
__register 32 { 1:1 CWRR, 0:0 CORENPDRQ, 3:3 COREPURQ } EDPRCR;

// MPAM PARTID Narrowing ID register
__register 32 { 15:0 INTPARTID_MAX } MPAMF_PARTID_NRW_IDR;

// Selected Error Record Address Register
__register 32 { 31:0 ERRnADDRlo } ERXADDR;

// Software Generated Interrupt Register
__register 32 { 25:24 TargetListFilter, 23:16 CPUTargetList, 15:15 NSATT, 3:0 INTID } GICD_SGIR;

// Cache Size Selection Register
__register 32 { 4:4 TnD, 3:1 Level, 0:0 InD } CSSELR_EL1;

// Trace Component Identification Register 1
__register 32 { 7:4 CLASS, 3:0 PRMBL_1 } TRCCIDR1;

// Performance Monitors Overflow Flag Status Set register
__register 32 { 31:31 C } PMOVSSET;

// Trace Virtual Context Identifier Comparator Value Register <n>
array [0..7] of __register 64 { 63:0 VALUE } TRCVMIDCVR;

// Performance Monitors Interrupt Enable Clear Register
__register 32 { 32:32 F0, 31:31 C } PMINTENCLR_EL1;

// EL0 Read/Write Software Thread ID Register 2
__register 64 { 63:0 ThreadID } TPIDR2_EL0;

// Trace Virtual Context Identifier Comparator Control Register 1
__register 32 {  } TRCVMIDCCTLR1;

// LORegionID (EL1)
__register 64 { 63:63 RL, 23:16 LD, 7:0 LR } LORID_EL1;

// Interrupt Clear-Pending Registers
array [0..31] of __register 32 {  } GICD_ICPENDR;

// Nested Virtual Hypervisor Configuration Masking Register
__register 64 { 60:60 TWEDEL, 59:59 TWEDEn, 58:58 TID5, 57:57 DCT, 56:56 ATA, 55:55 TTLBOS, 54:54 TTLBIS, 53:53 EnSCXT, 52:52 TOCU, 51:51 AMVOFFEN, 50:50 TICAB, 49:49 TID4, 48:48 GPF, 47:47 FIEN, 46:46 FWB, 45:45 NV2, 44:44 AT, 43:43 NV1, 42:42 NV, 41:41 API, 40:40 APK, 37:37 TEA, 36:36 TERR, 35:35 TLOR, 34:34 E2H, 33:33 ID, 32:32 CD, 31:31 RW, 30:30 TRVM, 29:29 HCD, 28:28 TDZ, 27:27 TGE, 26:26 TVM, 25:25 TTLB, 24:24 TPU, 23:23 TPCP, 22:22 TSW, 21:21 TACR, 20:20 TIDCP, 19:19 TSC, 18:18 TID3, 17:17 TID2, 16:16 TID1, 15:15 TID0, 14:14 TWE, 13:13 TWI, 12:12 DC, 10:10 BSU, 9:9 FB, 8:8 VSE, 7:7 VI, 6:6 VF, 5:5 AMO, 4:4 IMO, 3:3 FMO, 2:2 PTW, 1:1 SWIO, 0:0 VM } NVHCRMASK_EL2;

// Profiling Exception Mask
__register 64 { 32:32 PM } PM;

// Interrupt Controller Virtual Active Priorities Group 1 Registers
array [0..3] of __register 32 {  } ICV_AP1R;

// OS Lock Data Transfer Register, Receive
__register 32 { 31:0 DTRRX } OSDTRRX_EL1;

// Activity Monitors Count Enable Clear Register 0
__register 32 {  } AMCNTENCLR0;

// Monitor Debug Step Opcode Register
__register 64 { 31:0 OPCODE } MDSTEPOP_EL1;

// Interrupt Controller Hypervisor Highest Priority Pending Interrupt Register
__register 64 { 32:32 HPPIV, 31:29 TYPE, 23:0 ID } ICH_HPPIR_EL2;

// Error Record <n> Address Register
array [0..65534] of __register 64 { 63:63 NS, 62:62 SI, 61:61 AI, 60:60 VA, 59:59 NSE, 55:0 PADDR } ERRADDR;

// Debug CLAIM Tag Set Register
__register 32 {  } DBGCLAIMSET_EL1;

// Performance Monitors Interrupt Enable Set Register
__register 32 { 32:32 F0, 31:31 C } PMINTENSET_EL1;

// Performance Monitors Event Count Registers
array [0..30] of __register 64 { 31:0 EVCNT } PMEVCNTR_EL0;

// Hypervisor Debug Fine-Grained Read Trap Register
__register 64 { 63:63 PMBIDR_EL1, 62:62 nPMSNEVFR_EL1, 61:61 nBRBDATA, 60:60 nBRBCTL, 59:59 nBRBIDR, 58:58 PMCEIDn_EL0, 57:57 PMUSERENR_EL0, 56:56 TRBTRG_EL1, 55:55 TRBSR_EL1, 54:54 TRBPTR_EL1, 53:53 TRBMAR_EL1, 52:52 TRBLIMITR_EL1, 51:51 TRBIDR_EL1, 50:50 TRBBASER_EL1, 48:48 TRCVICTLR, 47:47 TRCSTATR, 46:46 TRCSSCSRn, 45:45 TRCSEQSTR, 44:44 TRCPRGCTLR, 43:43 TRCOSLSR, 41:41 TRCIMSPECn, 40:40 TRCID, 37:37 TRCCNTVRn, 36:36 TRCCLAIM, 35:35 TRCAUXCTLR, 34:34 TRCAUTHSTATUS, 33:33 TRC, 32:32 PMSLATFR_EL1, 31:31 PMSIRR_EL1, 30:30 PMSIDR_EL1, 29:29 PMSICR_EL1, 28:28 PMSFCR_EL1, 27:27 PMSEVFR_EL1, 26:26 PMSCR_EL1, 25:25 PMBSR_EL1, 24:24 PMBPTR_EL1, 23:23 PMBLIMITR_EL1, 22:22 PMMIR_EL1, 19:19 PMSELR_EL0, 18:18 PMOVS, 17:17 PMINTEN, 16:16 PMCNTEN, 15:15 PMCCNTR_EL0, 14:14 PMCCFILTR_EL0, 13:13 PMEVTYPERn_EL0, 12:12 PMEVCNTRn_EL0, 11:11 OSDLR_EL1, 10:10 OSECCR_EL1, 9:9 OSLSR_EL1, 7:7 DBGPRCR_EL1, 6:6 DBGAUTHSTATUS_EL1, 5:5 DBGCLAIM, 4:4 MDSCR_EL1, 3:3 DBGWVRn_EL1, 2:2 DBGWCRn_EL1, 1:1 DBGBVRn_EL1, 0:0 DBGBCRn_EL1 } HDFGRTR_EL2;

// Counter-timer Physical Offset Register
__register 64 { 63:0 PO } CNTPOFF_EL2;

// Guarded Control Stack Pointer Register (EL1)
__register 64 { 63:3 PTR } GCSPR_EL1;

// Sampling Interval Reload Register
__register 64 { 31:8 INTERVAL, 0:0 RND } PMSIRR_EL1;

// MPAM Features Cache Portion Partitioning ID register
__register 32 { 15:0 CPBM_WD } MPAMF_CPOR_IDR;

// Virtual SError Exception Syndrome Register (EL2)
__register 64 { 15:14 AET, 12:12 ExT, 24:24 IDS, 23:0 ISS } VSESR_EL2;

// Selected Error Record Miscellaneous Register 2
__register 64 { 63:0 ERRnMISC2 } ERXMISC2_EL1;

// Trace ID Register 11
__register 64 { 31:0 NUMP1SPC } TRCIDR11;

// Media and VFP Feature Register 0
__register 32 { 31:28 FPRound, 27:24 FPShVec, 23:20 FPSqrt, 19:16 FPDivide, 15:12 FPTrap, 11:8 FPDP, 7:4 FPSP, 3:0 SIMDReg } MVFR0;

// Virtualization Processor ID Register
__register 32 { 31:24 Implementer, 23:20 Variant, 19:16 Architecture, 15:4 PartNum, 3:0 Revision } VPIDR;

// Pointer Authentication Key A for Instruction (bits[127:64]) 
__register 64 { 63:0 APIAKeyHi } APIAKeyHi_EL1;

// Interrupt Controller Interrupt Group 0 Enable Register
__register 32 { 0:0 Enable } ICC_IGRPEN0_EL1;

// Distributor Control Register
__register 32 { 31:31 RWP, 7:7 E1NWF, 6:6 DS, 4:4 ARE_NS, 4:4 ARE_S, 2:2 EnableGrp1S, 1:1 EnableGrp1NS, 0:0 EnableGrp0, 1:1 EnableGrp1A, 1:1 EnableGrp1, 8:8 nASSGIreq, 4:4 ARE } GICD_CTLR;

// OS Lock Exception Catch Control Register
__register 32 { 31:0 EDECCR } OSECCR_EL1;

// Instruction Fault Address Register
__register 32 { 31:0 VA } IFAR;

// Trace Synchronization Period Register
__register 64 { 4:0 PERIOD } TRCSYNCPR;

// Cache Level ID Register
__register 64 { 32:30 ICB, 29:27 LoUU, 26:24 LoC, 23:21 LoUIS } CLIDR_EL1;

// CTI CLAIM Tag Clear register
__register 32 {  } CTICLAIMCLR;

// Interrupt Clear-Pending Register 0
__register 32 {  } GICR_ICPENDR0;

// AArch32 Media and VFP Feature Register 2
__register 32 { 7:4 FPMisc, 3:0 SIMDMisc } MVFR2_EL1;

// Performance Monitors Device Architecture register
__register 32 { 31:21 ARCHITECT, 20:20 PRESENT, 19:16 REVISION, 15:12 ARCHVER, 11:0 ARCHPART } PMDEVARCH;

// IRS Identification Register 4
__register 32 { 9:6 VPE_ID_BITS, 5:0 VPED_SZ } IRS_IDR4;

// Instruction Fault Status Register
__register 32 { 16:16 FnV, 12:12 ExT, 3:0 FS, 9:9 LPAE, 5:0 STATUS } IFSR;

// Counter-timer Virtual Timer CompareValue Register (EL2)
__register 64 { 63:0 CompareValue } CNTHV_CVAL_EL2;

// Trace Peripheral Identification Register 1
__register 32 { 7:4 DES_0, 3:0 PART_1 } TRCPIDR1;

// Selected Error Record Feature Register
__register 32 { 31:0 ERRnFRlo } ERXFR;

// Performance Monitors Common Event Identification register 0
__register 32 {  } PMCEID0;

// EL3 Software Thread ID Register
__register 64 { 63:0 ThreadID } TPIDR_EL3;

// IRS Map VPE Register
__register 64 { 63:63 M, 47:32 VM_ID, 15:0 VPE_ID } IRS_VMAP_VPER;

// CTI Integration mode Control register
__register 32 { 0:0 IME } CTIITCTRL;

// Interrupt Set-Enable Registers
array [0..31] of __register 32 {  } GICD_ISENABLERE;

// PMU Configuration Control Register
__register 64 { 8:8 OSLO, 7:7 EPME, 4:0 EPMN } PMCCR;

// Counter-timer Virtual Timer TimerValue Register
__register 32 { 31:0 TimerValue } CNTV_TVAL_EL0;

// Counter-timer EL0 Access Control Register
__register 32 { 9:9 EL0PTEN, 8:8 EL0VTEN, 1:1 EL0VCTEN, 0:0 EL0PCTEN } CNTEL0ACR;

// Interrupt Set-Pending Registers (extended SPI range)
array [0..31] of __register 32 {  } GICD_ISPENDRE;

// System Performance Monitors Count Enable Set Register
__register 64 {  } SPMCNTENSET_EL0;

// Monitor Debug Configuration Register (EL3)
__register 32 { 55:55 EnPMS4, 54:53 TRBEE, 52:51 PMSEE, 50:50 EnSTEPOP, 49:48 ETBAD, 47:47 EnITE, 46:45 EPMSSAD, 44:44 EnPMSS, 43:43 EBWE, 42:42 EnPMS3, 41:40 PMEE, 39:39 EnTB2, 38:38 E3BREC, 37:37 E3BREW, 36:36 EnPMSN, 35:35 MPMX, 34:34 MCCD, 33:32 SBRBE, 31:30 PMSSE, 28:28 MTPME, 27:27 TDCC, 26:26 NSTBE, 25:24 NSTB, 23:23 SCCD, 22:22 ETAD, 21:21 EPMAD, 20:20 EDAD, 19:19 TTRF, 18:18 STE, 17:17 SPME, 16:16 SDD, 15:14 SPD32, 13:12 NSPB, 11:11 NSPBE, 10:10 TDOSA, 9:9 TDA, 7:7 EnPM2, 6:6 TPM, 4:4 EDADE, 3:3 ETADE, 2:2 EPMADE, 0:0 RLTE } MDCR_EL3;

// Debug Authentication Status Register
__register 32 { 27:26 RTNID, 25:24 RTID, 15:14 RLNID, 13:12 RLID, 7:6 SNID, 5:4 SID, 3:2 NSNID, 1:0 NSID } DBGAUTHSTATUS_EL1;

// Performance Monitors Event Count Registers
array [0..30] of __register 32 { 31:0 EVCNT } PMEVCNTR;

// Interrupt Controller Interrupt Priority Mask Register
__register 32 { 7:0 Priority } ICC_PMR;

// Trace Virtual Context Identifier Comparator Control Register 0
__register 32 {  } TRCVMIDCCTLR0;

// Interrupt Controller Physical PPI Clear Active Registers
array [0..1] of __register 64 {  } ICC_PPI_CACTIVER_EL1;

// Trace Q Element Control Register
__register 32 { 8:8 MODE } TRCQCTLR;

// Media and VFP Feature Register 2
__register 32 { 7:4 FPMisc, 3:0 SIMDMisc } MVFR2;

// Interrupt Controller Virtual Control Register
__register 32 { 19:19 ExtRange, 18:18 RSS, 15:15 A3V, 14:14 SEIS, 13:11 IDbits, 10:8 PRIbits, 1:1 EOImode, 0:0 CBPR } ICV_CTLR_EL1;

// Trace Component Identification Register 0
__register 32 { 7:0 PRMBL_0 } TRCCIDR0;

// Trace Single-shot Processing Element Comparator Input Control Register <n>
array [0..7] of __register 64 {  } TRCSSPCICR;

// Statistical Profiling Control Register (EL1)
__register 64 { 11:11 EnVM, 10:10 KE, 9:8 EE, 7:6 PCT, 5:5 TS, 4:4 PA, 3:3 CX, 1:1 E1SPE, 0:0 E0SPE } PMSCR_EL1;

// Auxiliary Fault Status Register 1 (EL3)
__register 32 {  } AFSR1_EL3;

// IRS Software Error Status Register
__register 64 { 31:24 IMP_EC, 23:16 EC, 3:3 OF, 2:2 S1V, 1:1 S0V, 0:0 V } IRS_SWERR_STATUSR;

// Floating-Point Exception Control Register
__register 32 { 31:31 EX, 30:30 EN, 29:29 DEX, 28:28 FP2V, 27:27 VV, 26:26 TFV, 10:8 VECITR, 7:7 IDF, 4:4 IXF, 3:3 UFF, 2:2 OFF, 1:1 DZF, 0:0 IOF } FPEXC32_EL2;

// Trace Buffer Status/syndrome Register (EL1)
__register 64 { 55:32 MSS2, 31:26 EC, 22:22 IRQ, 21:21 TRG, 20:20 WRAP, 18:18 EA, 17:17 S, 15:0 MSS, 23:23 DAT } TRBSR_EL1;

// System Control Masking Register (EL1)
__register 64 { 63:63 TIDCP, 62:62 SPINTMASK, 61:61 NMI, 60:60 EnTP2, 59:59 TCSO, 58:58 TCSO0, 57:57 EPAN, 56:56 EnALS, 55:55 EnAS0, 54:54 EnASR, 46:46 TWEDEL, 45:45 TWEDEn, 44:44 DSSBS, 43:43 ATA, 42:42 ATA0, 40:40 TCF, 38:38 TCF0, 37:37 ITFSB, 36:36 BT1, 35:35 BT0, 34:34 EnFPM, 33:33 MSCEn, 32:32 CMOW, 31:31 EnIA, 30:30 EnIB, 29:29 LSMAOE, 28:28 nTLSMD, 27:27 EnDA, 26:26 UCI, 25:25 EE, 24:24 E0E, 23:23 SPAN, 22:22 EIS, 21:21 IESB, 20:20 TSCXT, 19:19 WXN, 18:18 nTWE, 16:16 nTWI, 15:15 UCT, 14:14 DZE, 13:13 EnDB, 12:12 I, 11:11 EOS, 10:10 EnRCTX, 9:9 UMA, 8:8 SED, 7:7 ITD, 6:6 nAA, 5:5 CP15BEN, 4:4 SA0, 3:3 SA, 2:2 C, 1:1 A, 0:0 M } SCTLRMASK_EL1;

// Trace ID Register 8
__register 32 { 31:0 MAXSPEC } TRCIDR8;

// Activity Monitors Event Type Registers 0
array [0..3] of __register 64 { 15:0 evtCount } AMEVTYPER0_EL0;

// Current Cache Size ID Register 2
__register 32 { 23:0 NumSets } CCSIDR2;

// AArch64 Floating-point Feature Register 0
__register 64 { 31:31 F8CVT, 30:30 F8FMA, 29:29 F8DP4, 28:28 F8DP2, 27:27 F8MM8, 26:26 F8MM4, 15:15 F16MM2, 1:1 F8E4M3, 0:0 F8E5M2 } ID_AA64FPFR0_EL1;

// Debug Feature Register 1
__register 32 { 7:4 HPMN0, 3:0 MTPMU } ID_DFR1;

// Debug Device ID register 1
__register 32 { 3:0 PCSROffset } DBGDEVID1;

// Interrupt Priority Registers (extended PPI range)
array [8..23] of __register 32 { 31:24 Priority_offset_3B, 23:16 Priority_offset_2B, 15:8 Priority_offset_1B, 7:0 Priority_offset_0B } GICR_IPRIORITYRE;

// System Performance Monitors Count Enable Clear Register
__register 64 {  } SPMCNTENCLR_EL0;

// Current Exception Level
__register 64 { 3:2 EL } CurrentEL;

// EL1 Read/Write Software Context Number
__register 64 { 63:0 SCXTNUM } SCXTNUM_EL1;

// IRS Virtualization Data Structures Management Status Register
__register 32 { 0:0 IDLE } IRS_VMT_STATUSR;

// Interrupt Controller Virtual Interrupt Active Registers
array [0..1] of __register 64 {  } ICH_PPI_ACTIVER_EL2;

// GIC PMU Event Filter 2 Register
array [0..63] of __register 64 { 60:60 FILTER_EID_SPAN, 59:59 FILTER_EID, 58:58 FILTER_DID_SPAN, 57:57 FILTER_DID, 15:0 ITSID, 63:63 FILTER_VM_ID, 62:61 FILTER_VIRT, 60:60 FILTER_INTID_SPAN, 59:59 FILTER_INTID, 58:57 FILTER_RW, 56:56 FILTER_SRC_PE, 15:0 IAFFID } GIC_PMEVFILT2R;

// System Control Register (EL3)
__register 64 { 62:62 SPINTMASK, 61:61 NMI, 59:59 TCSO, 44:44 DSSBS, 43:43 ATA, 41:40 TCF, 37:37 ITFSB, 36:36 BT, 31:31 EnIA, 30:30 EnIB, 27:27 EnDA, 25:25 EE, 22:22 EIS, 21:21 IESB, 19:19 WXN, 13:13 EnDB, 12:12 I, 11:11 EOS, 6:6 nAA, 3:3 SA, 2:2 C, 1:1 A, 0:0 M } SCTLR_EL3;

// Error Recovery Interrupt Configuration Register 0
__register 64 { 55:2 ADDR } ERRERICR0;

// SVE Control Register (EL1)
__register 64 { 3:0 LEN } ZCR_EL1;

// Interrupt Controller Type Register 2
__register 32 { 8:8 nASSGIcap, 7:7 VIL, 4:0 VID } GICD_TYPER2;

// Trace ID Register 3
__register 32 { 31:31 NOOVERFLOW, 13:12 NUMPROC, 27:27 SYSSTALL, 26:26 STALLCTL, 25:25 SYNCPR, 24:24 TRCERR, 22:22 EXLEVEL_NS_EL2, 21:21 EXLEVEL_NS_EL1, 20:20 EXLEVEL_NS_EL0, 19:19 EXLEVEL_S_EL3, 18:18 EXLEVEL_S_EL2, 17:17 EXLEVEL_S_EL1, 16:16 EXLEVEL_S_EL0, 11:0 CCITMIN } TRCIDR3;

// CTI Channel Gate Enable register
__register 32 {  } CTIGATE;

// External Debug Lock Status Register
__register 32 { 2:2 nTT, 1:1 SLK, 0:0 SLI } EDLSR;

// MPAM Bandwidth Portion Bitmap Partition Configuration Register
array [0..127] of __register 32 {  } MPAMCFG_MBW_PBM;

// CPU Interface Binary Point Register
__register 32 { 2:0 Binary_Point } GICC_BPR;

// ITS Identification Register
__register 32 { 31:24 ProductID, 19:16 Variant, 15:12 Revision, 11:0 Implementer } GITS_IIDR;

// Hypervisor GIC Fine-Grained Write Trap Register
__register 64 { 20:20 ICC_PPI_ACTIVERn_EL1, 19:19 ICC_PPI_PRIORITYRn_EL1, 18:18 ICC_PPI_PENDRn_EL1, 17:17 ICC_PPI_ENABLERn_EL1, 6:6 ICC_ICSR_EL1, 5:5 ICC_PCR_EL1, 2:2 ICC_CR0_EL1, 0:0 ICC_APR_EL1 } ICH_HFGWTR_EL2;

// Hyp Auxiliary Configuration Register
__register 32 {  } HACR;

// Debug Breakpoint Control Registers
array [0..15] of __register 32 { 23:20 BT, 19:16 LBN, 15:14 SSC, 13:13 HMC, 8:5 BAS, 2:1 PMC, 0:0 E } DBGBCR;

// MPAM Error Status Register
__register 64 { 31:31 OVRWR, 27:24 ERRCODE, 35:32 RIS, 23:16 PMG, 15:0 PARTID_MON } MPAMF_ESR;

// Trace Auxiliary Control Register
__register 32 {  } TRCAUXCTLR;

// CTI Channel Out Status register
__register 32 {  } CTICHOUTSTATUS;

// Instruction Set Attribute Register 3
__register 32 { 31:28 T32EE, 27:24 TrueNOP, 23:20 T32Copy, 19:16 TabBranch, 15:12 SynchPrim, 11:8 SVC, 7:4 SIMD, 3:0 Saturate } ID_ISAR3;

// Activity Monitors Root Control Register
__register 64 { 31:31 IMPL, 6:4 RA } AMROOTCR;

// Pointer Authentication Key A for Instruction (bits[63:0]) 
__register 64 { 63:0 APIAKeyLo } APIAKeyLo_EL1;

// DCC Interrupt Enable Register
__register 32 { 30:30 RX, 29:29 TX } DBGDCCINT;

// Counter-timer Hyp Physical CompareValue register
__register 64 { 63:0 CompareValue } CNTHP_CVAL;

// Activity Monitors Implementation Identification Register
__register 64 { 31:20 ProductID, 19:16 Variant, 15:12 Revision, 11:0 Implementer } AMIIDR;

// Performance Monitors User Access Control Register
__register 64 { 32:32 F0, 31:31 C } PMUACR_EL1;

// Counter-timer Secure Physical Timer CompareValue Register (EL2)
__register 64 { 63:0 CompareValue } CNTHPS_CVAL;

// Auxiliary Control Masking Register (EL2)
__register 64 {  } ACTLRMASK_EL2;

// Architectural Feature Access Control Register
__register 32 { 31:31 ASEDIS, 28:28 TRCDIS, 23:22 cp11, 21:20 cp10 } CPACR;

// Counter Scale Register
__register 32 { 31:0 ScaleVal } CNTSCR;

// Activity Monitors Counter Group Configuration Register
__register 64 { 15:8 CG1NC, 7:0 CG0NC } AMCGCR;

// Speculative Store Bypass Safe
__register 32 { 12:12 SSBS } SSBS;

// Saved Program Status Register (Abort mode)
__register 32 { 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 15:10 IT, 24:24 J, 23:23 SSBS, 22:22 PAN, 21:21 DIT, 20:20 IL, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 5:5 T, 4:0 M } SPSR_abt;

// Counter-timer Secure Virtual Timer TimerValue Register (EL2)
__register 32 { 31:0 TimerValue } CNTHVS_TVAL;

// Hyp Auxiliary Instruction Fault Status Register
__register 32 {  } HAIFSR;

// Extended Translation Control Masking Register (EL2)
__register 64 { 18:18 FNG1, 17:17 FNG0, 16:16 A2, 15:15 DisCH1, 14:14 DisCH0, 13:13 AMEC1, 12:12 AMEC0, 11:11 HAFT, 10:10 PTTWI, 5:5 D128, 4:4 AIE, 3:3 POE, 2:2 E0POE, 1:1 PIE, 0:0 PnCH } TCR2MASK_EL2;

// AArch64 Instruction Set Attribute Register 2
__register 64 { 63:60 ATS1A, 59:56 LUT, 55:52 CSSC, 51:48 RPRFM, 47:44 PCDPHINT, 43:40 PRFMSLC, 39:36 SYSINSTR_128, 35:32 SYSREG_128, 31:28 CLRBHB, 27:24 PAC_frac, 23:20 BC, 19:16 MOPS, 15:12 APA3, 11:8 GPA3, 7:4 RPRES, 3:0 WFxT } ID_AA64ISAR2_EL1;

// Branch Record Buffer Information Register <n>
array [0..31] of __register 64 { 46:46 CCU, 45:32 CC, 13:8 TYPE, 7:6 EL, 5:5 MPRED, 1:0 VALID } BRBINF_EL1;

// Profiling Buffer Syndrome Register (EL3)
__register 64 { 55:32 MSS2, 31:26 EC, 19:19 DL, 18:18 EA, 17:17 S, 16:16 COLL, 15:0 MSS } PMBSR_EL3;

// Counter-timer Secure Physical Timer Control Register (EL2)
__register 32 { 2:2 ISTATUS, 1:1 IMASK, 0:0 ENABLE } CNTHPS_CTL;

// TLBI Domains Identification Register (EL1)
__register 64 { 44:40 NVOS, 36:32 NOS, 12:8 NVIS, 4:0 NIS } TLBIDIDR_EL1;

// Distributor MSI Type Register
__register 32 { 31:31 Valid, 30:30 CLR, 29:29 SR, 28:16 INTID, 10:0 NumSPIs } GICM_TYPER;

// Instruction Set Attribute Register 2
__register 32 { 31:28 Reversal, 27:24 PSR_AR, 23:20 MultU, 19:16 MultS, 15:12 Mult, 11:8 MultiAccessInt, 7:4 MemHint, 3:0 LoadStore } ID_ISAR2;

// Software Read Check Write Instruction Mask (EL1)
__register 128 { 63:0 RCWSMASK } RCWSMASK_EL1;

// Cache Type Register
__register 32 { 37:32 TminLine, 29:29 DIC, 28:28 IDC, 27:24 CWG, 23:20 ERG, 19:16 DminLine, 15:14 L1Ip, 3:0 IminLine } CTR_EL0;

// Interrupt Group Modifier Registers
array [0..31] of __register 32 {  } GICD_IGRPMODR;

// Counter-timer Physical Timer Control Register
__register 32 { 2:2 ISTATUS, 1:1 IMASK, 0:0 ENABLE } CNTP_CTL_EL0;

// Interrupt Controller Hyp Active Priorities Group 1 Registers
array [0..3] of __register 64 { 63:63 NMI } ICH_AP1R_EL2;

// Hyp Auxiliary Memory Attribute Indirection Register 0
__register 32 {  } HAMAIR0;

// Interrupt Controller Virtual Binary Point Register 0
__register 32 { 2:0 BinaryPoint } ICV_BPR0;

// Saved Program Status Register (EL3)
__register 32 { 36:36 UINJ, 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 15:10 IT, 24:24 DIT, 12:12 SSBS, 22:22 PAN, 21:21 SS, 20:20 IL, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 5:5 T, 35:35 PACM, 34:34 EXLOCK, 32:32 PM, 25:25 TCO, 23:23 UAO, 13:13 ALLINT, 11:10 BTYPE, 9:9 D, 4:4, 4:4, 3:0, 3:0 M } SPSR_EL3;

// Trace External Input Select Register <n>
array [0..3] of __register 32 { 15:0 evtCount } TRCEXTINSELR;

// Hypervisor Configuration Register
__register 64 { 63:60 TWEDEL, 59:59 TWEDEn, 58:58 TID5, 57:57 DCT, 56:56 ATA, 55:55 TTLBOS, 54:54 TTLBIS, 53:53 EnSCXT, 52:52 TOCU, 51:51 AMVOFFEN, 50:50 TICAB, 49:49 TID4, 48:48 GPF, 47:47 FIEN, 46:46 FWB, 45:45 NV2, 44:44 AT, 43:43 NV1, 42:42 NV, 41:41 API, 40:40 APK, 37:37 TEA, 36:36 TERR, 35:35 TLOR, 34:34 E2H, 33:33 ID, 32:32 CD, 31:31 RW, 30:30 TRVM, 29:29 HCD, 28:28 TDZ, 27:27 TGE, 26:26 TVM, 25:25 TTLB, 24:24 TPU, 23:23 TPCP, 22:22 TSW, 21:21 TACR, 20:20 TIDCP, 19:19 TSC, 18:18 TID3, 17:17 TID2, 16:16 TID1, 15:15 TID0, 14:14 TWE, 13:13 TWI, 12:12 DC, 11:10 BSU, 9:9 FB, 8:8 VSE, 7:7 VI, 6:6 VF, 5:5 AMO, 4:4 IMO, 3:3 FMO, 2:2 PTW, 1:1 SWIO, 0:0 VM } HCR_EL2;

// SME Control Register (EL2)
__register 64 { 31:31 FA64, 30:30 EZT0, 3:0 LEN } SMCR_EL2;

// Selected Error Record Miscellaneous Register 7
__register 32 { 31:0 ERRnMISC3hi } ERXMISC7;

// IWB Wire Interrupt Domain Selection Register
array [0..4095] of __register 32 {  } IWB_WDOMAINR;

// Trace Filter Control Register (EL1)
__register 64 { 11:11 DnVM, 10:10 KE, 9:8 EE, 6:5 TS, 3:3 CX, 1:1 E1TRE, 0:0 E0TRE } TRFCR_EL1;

// Non-maskable Interrupt Registers, x = 0 to 31
array [0..31] of __register 32 {  } GICD_INMIR;

// Interrupt Clear-Pending Registers
array [1..2] of __register 32 {  } GICR_ICPENDRE;

// IRS Implementer Identification Register
__register 32 { 31:20 ProductID, 19:16 Variant, 15:12 Revision, 11:0 Implementer } IRS_IIDR;

// Interrupt Controller Virtual Binary Point Register 1
__register 32 { 2:0 BinaryPoint } ICV_BPR1_EL1;

// Trace IMP DEF Register <n>
array [1..7] of __register 32 {  } TRCIMSPEC;

// Trace Peripheral Identification Register 2
__register 32 { 7:4 REVISION, 3:3 JEDEC, 2:0 DES_1 } TRCPIDR2;

// IRS VM Table Configuration Register
__register 32 { 16:16 STRUCTURE, 4:0 VM_ID_BITS } IRS_VMT_CFGR;

// Exception Link Register (EL1)
__register 64 { 63:0 ADDR } ELR_EL1;

// ITS MPAM Identification Register
__register 32 { 24:24 HAS_MPAM_SP, 31:16 PMG_MAX, 15:0 PARTID_MAX } ITS_MPAM_IDR;

// Trace Resource Selection Control Register <n>
array [2..31] of __register 32 { 21:21 PAIRINV, 20:20 INV, 19:16 GROUP, 15:0 SELECT } TRCRSCTLR;

// Memory Model Feature Register 0
__register 32 { 31:28 InnerShr, 27:24 FCSE, 23:20 AuxReg, 19:16 TCM, 15:12 ShareLvl, 11:8 OuterShr, 7:4 PMSA, 3:0 VMSA } ID_MMFR0;

// Counter-timer Hyp Control register
__register 32 { 17:17 EVNTIS, 7:4 EVNTI, 3:3 EVNTDIR, 2:2 EVNTEN, 1:1 PL1PCEN, 0:0 PL1PCTEN } CNTHCTL;

// MPAM Cache Storage Allocation Monitor Capture Register
__register 32 { 31:31 NRDY, 30:0 VALUE } MSMON_CSA_CAPTURE;

// Interrupt Controller Virtual End Of Interrupt Register 1
__register 32 { 23:0 INTID } ICV_EOIR1_EL1;

// MPAM CSA Monitor Overflow Status Register
__register 32 {  } MSMON_CSA_OFSR;

// Auxiliary Fault Status Register 0 (EL2)
__register 32 {  } AFSR0_EL2;

// MPAM Implementation-Specific Partitioning Feature Identification Register
__register 32 { 31:0 IMPLFEAT } MPAMF_IMPL_IDR;

// MPAM Features Cache Storage Allocation Monitoring ID register
__register 64 { 32:32 HAS_MON_SEC, 31:31 HAS_CAPTURE, 30:30 HAS_LONG, 29:29 LWD, 27:27 HAS_OFLOW_LNKG, 26:26 HAS_OFSR, 25:25 HAS_CEVNT_OFLW, 24:24 HAS_OFLOW_CAPT, 23:23 NO_MATCH_PARTID, 22:22 NO_MATCH_PMG, 20:16 SCALE, 15:0 NUM_MON } MPAMF_CSAMON_IDR;

// Trace Buffer Memory Attribute Register
__register 64 { 11:10 PAS, 9:8 SH, 7:0 Attr } TRBMAR_EL1;

// External Debug Auxiliary Processor Feature Register
__register 64 { 19:16 MSA_frac, 15:12 EL3, 11:8 EL2, 7:4 PMSA, 3:0 VMSA } EDAA32PFR;

// Peripheral Identification Register 5
__register 32 {  } TRBPIDR5;

// Debug OS Lock Exception Catch Control Register
__register 32 { 31:0 EDECCR } DBGOSECCR;

// Hypervisor Fine-Grained Instruction Trap Register 2
__register 64 { 14:14 DCGBVA, 1:1 nDCCIVAPS, 0:0 TSBCSYNC } HFGITR2_EL2;

// Trace Buffer Syndrome Register (EL2)
__register 64 { 55:32 MSS2, 31:26 EC, 22:22 IRQ, 21:21 TRG, 20:20 WRAP, 18:18 EA, 17:17 S, 15:0 MSS } TRBSR_EL2;

// Performance Monitors Component Identification Register 1
__register 32 { 7:4 CLASS, 3:0 PRMBL_1 } PMCIDR1;

// Counter-timer Physical Timer CompareValue Register (EL2)
__register 64 { 63:0 CompareValue } CNTHP_CVAL_EL2;

// Monitor Debug ROM Address Register
__register 64 { 55:12 ROMADDR, 1:0 Valid } MDRAR_EL1;

// Extended Translation Control Register (EL2)
__register 64 { 12:12 AMEC0, 11:11 HAFT, 10:10 PTTWI, 4:4 AIE, 3:3 POE, 1:1 PIE, 0:0 PnCH, 18:18 FNG1, 17:17 FNG0, 16:16 A2, 15:15 DisCH1, 14:14 DisCH0, 13:13 AMEC1, 5:5 D128, 2:2 E0POE } TCR2_EL2;

// CTI Lock Access Register
__register 32 { 31:0 KEY } CTILAR;

// Interrupt Controller PPI Domain Registers
array [0..3] of __register 64 {  } ICC_PPI_DOMAINR_EL3;

// Selected Pseudo-fault Generation Control Register
__register 64 { 63:0 ERRnPFGCTL } ERXPFGCTL_EL1;

// Physical Fault Address Register (EL3)
__register 64 { 63:63 NS, 62:62 NSE, 55:52, 51:48 FPA, 61:61 NSE2, 55:52, 51:48 PA } MFAR_EL3;

// External Debug Auxiliary Control Register
__register 32 {  } EDACR;

// Counter-timer Virtual Count
__register 64 { 63:0 VirtualCount } CNTVCT;

// Counter-timer Self-Synchronized Virtual Count Register
__register 64 { 63:0 SSVirtualCount } CNTVCTSS_EL0;

// Performance Monitors Software Increment register
__register 32 {  } PMSWINC;

// Integration Mode Control Register
__register 32 { 0:0 IME } TRBITCTRL;

// Selected Error Record Control Register
__register 64 { 63:0 ERRnCTLR } ERXCTLR_EL1;

// ITS Table Descriptors
array [0..7] of __register 64 { 63:63 Valid, 62:62 Indirect, 61:59 InnerCache, 58:56 Type, 55:53 OuterCache, 52:48 Entry_Size, 47:12 Physical_Address, 11:10 Shareability, 9:8 Page_Size, 7:0 Size } GITS_BASER;

// Debug Device ID register 0
__register 32 { 31:28 CIDMask, 27:24 AuxRegs, 23:20 DoubleLock, 19:16 VirtExtns, 15:12 VectorCatch, 11:8 BPAddrMask, 7:4 WPAddrMask, 3:0 PCSample } DBGDEVID;

// Trace Lock Access Register
__register 32 { 31:0 KEY } TRCLAR;

// Auxiliary Instruction Fault Status Register
__register 32 {  } AIFSR;

// Secure Debug Control Register
__register 32 { 28:28 MTPME, 27:27 TDCC, 23:23 SCCD, 21:21 EPMAD, 20:20 EDAD, 19:19 TTRF, 18:18 STE, 17:17 SPME, 15:14 SPD } SDCR;

// Trace Buffer Syndrome Register (EL3)
__register 64 { 55:32 MSS2, 31:26 EC, 22:22 IRQ, 21:21 TRG, 20:20 WRAP, 18:18 EA, 17:17 S, 15:0 MSS } TRBSR_EL3;

// CONTEXTIDR_ELx Sample Register
__register 64 { 63:32 CONTEXTIDR_EL2, 31:0 CONTEXTIDR_EL1 } PMCCIDSR;

// Main ID Register
__register 32 { 31:24 Implementer, 23:20 Variant, 19:16 Architecture, 15:4 PartNum, 3:0 Revision } MIDR_EL1;

// Performance Monitors Peripheral Identification Register 1
__register 32 { 7:4 DES_0, 3:0 PART_1 } PMPIDR1;

// Memory Model Feature Register 4
__register 32 { 31:28 EVT, 27:24 CCIDX, 23:20 LSM, 19:16 HPDS, 15:12 CnP, 11:8 XNX, 7:4 AC2, 3:0 SpecSEI } ID_MMFR4;

// Selected Error Record Miscellaneous Register 3
__register 64 { 63:0 ERRnMISC3 } ERXMISC3_EL1;

// Interrupt Routing Registers (Extended SPI Range)
array [0..1023] of __register 64 { 39:32 Aff3, 31:31 Interrupt_Routing_Mode, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } GICD_IROUTERE;

// Counter-timer Physical Timer TimerValue Register (EL2)
__register 32 { 31:0 TimerValue } CNTHP_TVAL_EL2;

// IRS Architecture Identification Register
__register 32 { 11:8 Component, 7:4 ArchMajorRev, 3:0 ArchMinorRev } IRS_AIDR;

// Nested Virtual Extended Hypervisor Configuration Register
__register 64 { 36:36 FNB, 35:35 VTLBIDOSEn, 34:34 NVnTTLBOS, 33:33 NVnTTLBIS, 32:32 NVnTTLB, 31:31 FDIT, 27:27 NVTGE, 26:26 SRMASKEn, 25:25 VTLBIDEn, 24:24 PACMEn, 23:23 EnFPM, 22:22 GCSEn, 21:21 EnIDCP128, 20:20 EnSDERR, 19:19 TMEA, 18:18 EnSNERR, 17:17 D128En, 16:16 PTTWI, 15:15 SCTLR2En, 14:14 TCR2En, 11:11 MSCEn, 10:10 MCE2, 9:9 CMOW, 8:8 VFNMI, 7:7 VINMI, 6:6 TALLINT, 5:5 SMPME, 4:4 FGTnXS, 3:3 FnXS, 2:2 EnASR, 1:1 EnALS, 0:0 EnAS0 } NVHCRX_EL2;

// CPU Interface Aliased Interrupt Acknowledge Register
__register 32 { 23:0 INTID } GICC_AIAR;

// Hyp Translation Table Base Register
__register 64 { 47:1 BADDR, 0:0 CnP } HTTBR;

// IRS Identification Register 2
__register 32 { 19:15 ISTMD_SZ, 14:14 ISTMD, 13:11 IST_L2SZ, 10:10 IST_LEVELS, 9:6 MIN_LPI_ID_BITS, 5:5 LPI, 4:0 ID_BITS } IRS_IDR2;

// Pointer Authentication Key B for Instruction (bits[63:0]) 
__register 64 { 63:0 APIBKeyLo } APIBKeyLo_EL1;

// Hyp Syndrome Register
__register 32 { 31:26 EC, 25:25 IL, 24:0 ISS } HSR;

// Trace Buffer Device Architecture Register
__register 32 { 31:21 ARCHITECT, 20:20 PRESENT, 19:16 REVISION, 15:12 ARCHVER, 11:0 ARCHPART } TRBDEVARCH;

// Virtualization Secure Translation Table Base Register
__register 64 { 47:1 BADDR, 2:1 SKL, 0:0 CnP } VSTTBR_EL2;

// Virtualization Translation Control Register
__register 32 { 28:28 HWU62, 27:27 HWU61, 26:26 HWU60, 25:25 HWU59, 13:12 SH0, 11:10 ORGN0, 9:8 IRGN0, 7:6 SL0, 4:4 S, 3:0 T0SZ } VTCR;

// Performance Monitors Cycle Count Saved Value Register
__register 64 { 63:0 CCNT } PMCCNTSVR_EL1;

// Trace Cycle Count Control Register
__register 64 { 11:0 THRESHOLD } TRCCCCTLR;

// OS Lock Access Register
__register 32 { 0:0 OSLK } OSLAR_EL1;

// Guarded Control Stack Control Register (EL1)
__register 64 { 9:9 STREn, 8:8 PUSHMEn, 6:6 EXLOCKEN, 5:5 RVCHKEN, 0:0 PCRSEL } GCSCR_EL1;

// MPAM Root Control Register
__register 32 { 2:0 PAS_MAP } MPAMF_ROOTCR;

// MPAM MBWU Monitor Overflow Status Register
__register 32 {  } MSMON_MBWU_OFSR;

// Interrupt Set-Pending Registers
array [0..31] of __register 32 {  } GICD_ISPENDR;

// Device Type Register
__register 32 { 7:4 SUB, 3:0 MAJOR } TRBDEVTYPE;

// Processor Feature Register 2
__register 32 { 11:8 RAS_frac, 7:4 SSBS, 3:0 CSV3 } ID_PFR2;

// Trace Sequencer State Transition Control Register <n>
array [0..2] of __register 32 { 15:15 B_TYPE, 12:8 B_SEL, 7:7 F_TYPE, 4:0 F_SEL } TRCSEQEVR;

// Interrupt Controller Hyp Active Priorities Group 0 Registers
array [0..3] of __register 64 {  } ICH_AP0R_EL2;

// Alternate MECID for EL2 and EL2&0 translation regimes
__register 64 { 15:0 MECID } MECID_A0_EL2;

// Virtual Nested Control Register
__register 64 { 63:12 BADDR } VNCR_EL2;

// Saved Program Status Register (Monitor mode)
__register 32 { 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 15:10 IT, 24:24 J, 23:23 SSBS, 22:22 PAN, 21:21 DIT, 20:20 IL, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 5:5 T, 4:0 M } SPSR_mon;

// Debug Watchpoint Value Registers
array [0..15] of __register 32 { 31:2 VA } DBGWVR;

// CTI Device Affinity register 0
__register 32 { 30:30 U, 24:24 MT, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } CTIDEVAFF0;

// IRS VM Table Base Address Register
__register 64 { 55:3 ADDR, 0:0 VALID } IRS_VMT_BASER;

// MPAM Memory Bandwidth Usage Monitor Register
__register 32 { 31:31 NRDY, 30:0 VALUE } MSMON_MBWU;

// External Debug Device ID register 0
__register 32 { 27:24 AuxRegs, 7:4 DebugPower, 3:0 PCSample } EDDEVID;

// Performance Monitors Common Event Identification register 2
__register 32 {  } PMCEID2;

// Trace ViewInst Start/Stop Control Register
__register 64 {  } TRCVISSCTLR;

// ITS SGI Register
__register 64 { 47:32 vPEID, 3:0 vINTID } GITS_SGIR;

// Virtual Machine Control Register
__register 32 { 31:24 VPMR, 23:21 VBPR0, 20:18 VBPR1, 9:9 VEOIM, 4:4 VCBPR, 3:3 VFIQEn, 2:2 VAckCtl, 1:1 VENG1, 0:0 VENG0 } GICH_VMCR;

// Interrupt Controller Virtual Highest Priority Pending Interrupt Register 0
__register 32 { 23:0 INTID } ICV_HPPIR0_EL1;

// Exception Link Register (EL3)
__register 64 { 63:0 ADDR } ELR_EL3;

// Deferred Interrupt Status Register
__register 32 { 31:31 A, 15:14 AET, 9:9 EA, 5:0 DFSC, 12:12 ExT, 3:0 FS, 9:9 LPAE, 5:0 STATUS } DISR;

// IRS VM 1ofN Doorbell Configuration Register
__register 64 { 63:63 EN, 15:0 VPE_ID } IRS_VM_DBR;

// MPAM Features Identification Register
__register 64 { 59:56 RIS_MAX, 55:55 PAS_CFG, 31:31 HAS_PARTID_NRW, 30:30 HAS_MSMON, 29:29 HAS_IMPL_IDR, 27:27 HAS_PRI_PART, 26:26 HAS_MBW_PART, 25:25 HAS_CPOR_PART, 24:24 HAS_CCAP_PART, 46:46 HAS_DEFAULT_PARTID, 45:45 HAS_OUT_TL, 44:44 HAS_IN_TL, 43:43 HAS_NFU, 42:42 HAS_ENDIS, 40:40 HAS_ERR_MSI, 39:39 HAS_ESR, 37:37 NO_IMPL_MSMON, 36:36 NO_IMPL_PART, 32:32 HAS_RIS, 23:16 PMG_MAX, 15:0 PARTID_MAX, 41:41 SP4, 38:38 HAS_EXTD_ESR, 28:28 EXT } MPAMF_IDR;

// Hypervisor Fine-Grained Write Trap Register 2
__register 64 { 39:39 ACTLR_EL1, 14:14 nACTLRALIAS_EL1, 13:13 nACTLRMASK_EL1, 12:12 nTCR2ALIAS_EL1, 11:11 nTCRALIAS_EL1, 10:10 nSCTLR2ALIAS_EL1, 9:9 nSCTLRALIAS_EL1, 8:8 nCPACRALIAS_EL1, 7:7 nTCR2MASK_EL1, 6:6 nTCRMASK_EL1, 5:5 nSCTLR2MASK_EL1, 4:4 nSCTLRMASK_EL1, 3:3 nCPACRMASK_EL1, 2:2 nRCWSMASK_EL1, 0:0 nPFAR_EL1 } HFGWTR2_EL2;

// Interrupt Controller Active Priorities Group 0 Registers
array [0..3] of __register 32 {  } ICC_AP0R;

// LORegion End Address (EL1)
__register 64 { 55:52, 51:48, 47:16 EA } LOREA_EL1;

// MPAM Long Cache Storage Allocation Monitor Capture Register
__register 64 { 63:63 NRDY, 62:0 VALUE } MSMON_CSA_L_CAPTURE;

// Interrupt configuration registers
array [2..5] of __register 32 {  } GICR_ICFGRE;

// External Debug Event Status Register
__register 32 { 3:3 EC, 2:2 SS, 1:1 RC, 0:0 OSUC } EDESR;

// Extended Hypervisor Configuration Register
__register 64 { 36:36 FNB, 35:35 VTLBIDOSEn, 34:34 NVnTTLBOS, 33:33 NVnTTLBIS, 32:32 NVnTTLB, 31:31 FDIT, 27:27 NVTGE, 26:26 SRMASKEn, 25:25 VTLBIDEn, 24:24 PACMEn, 23:23 EnFPM, 22:22 GCSEn, 21:21 EnIDCP128, 20:20 EnSDERR, 19:19 TMEA, 18:18 EnSNERR, 17:17 D128En, 16:16 PTTWI, 15:15 SCTLR2En, 14:14 TCR2En, 11:11 MSCEn, 10:10 MCE2, 9:9 CMOW, 8:8 VFNMI, 7:7 VINMI, 6:6 TALLINT, 5:5 SMPME, 4:4 FGTnXS, 3:3 FnXS, 2:2 EnASR, 1:1 EnALS, 0:0 EnAS0 } HCRX_EL2;

// Trace Integration Mode Control Register
__register 32 { 0:0 IME } TRCITCTRL;

// Trace Component Identification Register 2
__register 32 { 7:0 PRMBL_2 } TRCCIDR2;

// MPAM Ingress PARTID Translation ID Register
__register 32 { 31:31 HAS_DIRECT_TL, 30:30 HAS_BASE_MASK, 15:0 IN_PARTID_MAX } MPAMF_IN_TL_IDR;

// IWB Wire Resample Register
__register 32 { 15:0 IWI } IWB_WRESAMPLER;

// AArch32 Memory Model Feature Register 3
__register 32 { 31:28 Supersec, 27:24 CMemSz, 23:20 CohWalk, 19:16 PAN, 15:12 MaintBcst, 11:8 BPMaint, 7:4 CMaintSW, 3:0 CMaintVA } ID_MMFR3_EL1;

// Counter-timer Secure Virtual Timer CompareValue Register (EL2)
__register 64 { 63:0 CompareValue } CNTHVS_CVAL;

// LORegion Start Address (EL1)
__register 64 { 55:16 SA, 1:1 RL, 0:0 Valid } LORSA_EL1;

// Counter Frequency IDs, n > 0
array [1..1003] of __register 32 { 31:0 Frequency } CNTFID;

// Pointer Authentication Key B for Data (bits[63:0]) 
__register 64 { 63:0 APDBKeyLo } APDBKeyLo_EL1;

// Virtual Redistributor Properties Base Address Register
__register 64 { 63:63 Valid, 61:59 Entry_Size, 58:56 OuterCache, 55:55 Indirect, 54:53 Page_Size, 52:52 Z, 51:12 Physical_Address, 11:10 Shareability, 9:7 InnerCache, 6:0 Size, 4:0 IDbits } GICR_VPROPBASER;

// Processor Feature Register 1
__register 32 { 31:28 GIC, 27:24 Virt_frac, 23:20 Sec_frac, 19:16 GenTimer, 15:12 Virtualization, 11:8 MProgMod, 7:4 Security, 3:0 ProgMod } ID_PFR1;

// Counter-timer Virtual Timer Control Register
__register 32 { 2:2 ISTATUS, 1:1 IMASK, 0:0 ENABLE } CNTV_CTL_EL0;

// CPU Interface Identification Register
__register 32 { 31:20 ProductID, 19:16 Architecture_version, 15:12 Revision, 11:0 Implementer } GICC_IIDR;

// ITS Type Register
__register 64 { 46:46 INV, 45:45 UMSIirq, 44:44 UMSI, 43:43 nID, 42:41 SVPET, 40:40 VMAPP, 39:39 VSGI, 38:38 MPAM, 37:37 VMOVP, 36:36 CIL, 35:32 CIDbits, 31:24 HCC, 19:19 PTA, 18:18 SEIS, 17:13 Devbits, 12:8 ID_bits, 7:4 ITT_entry_size, 2:2 CCT, 1:1 Virtual, 0:0 Physical } GITS_TYPER;

// Permission Overlay Register 0 (EL0)
__register 64 {  } POR_EL0;

// Fault Handling Interrupt Configuration Register 0
__register 64 { 55:2 ADDR } ERRFHICR0;

// Component Identification Register 3
__register 32 { 7:0 PRMBL_3 } TRBCIDR3;

// Interrupt Clear-Active Register 0
__register 32 {  } GICR_ICACTIVER0;

// Device Configuration Register 1
__register 32 { 23:16 PMG_MAX, 15:0 PARTID_MAX } TRBDEVID1;

// Performance Monitors Component Identification Register 3
__register 32 { 7:0 PRMBL_3 } PMCIDR3;

// AArch32 Debug Feature Register 0
__register 32 { 31:28 TraceFilt, 27:24 PerfMon, 23:20 MProfDbg, 19:16 MMapTrc, 15:12 CopTrc, 11:8 MMapDbg, 7:4 CopSDbg, 3:0 CopDbg } ID_DFR0_EL1;

// Pointer Authentication Key A for Data (bits[127:64]) 
__register 64 { 63:0 APDAKeyHi } APDAKeyHi_EL1;

// Error Reporting Status Register
__register 32 { 3:3 WROD, 2:2 RWOD, 1:1 WRD, 0:0 RRD } GICD_STATUSR;

// Stack Pointer Select
__register 64 { 0:0 SP } SPSel;

// Translation Control Register (EL2)
__register 64 { 33:33 MTX, 59:59 DS, 30:30 TCMA, 29:29 TBID, 28:28 HWU62, 27:27 HWU61, 26:26 HWU60, 25:25 HWU59, 24:24 HPD, 40:40 HD, 39:39 HA, 20:20 TBI, 18:16 PS, 15:14 TG0, 13:12 SH0, 11:10 ORGN0, 9:8 IRGN0, 5:0 T0SZ, 61:61 MTX1, 60:60 MTX0, 58:58 TCMA1, 57:57 TCMA0, 56:56 E0PD1, 55:55 E0PD0, 54:54 NFD1, 53:53 NFD0, 52:52 TBID1, 51:51 TBID0, 50:50 HWU162, 49:49 HWU161, 48:48 HWU160, 47:47 HWU159, 46:46 HWU062, 45:45 HWU061, 44:44 HWU060, 43:43 HWU059, 42:42 HPD1, 41:41 HPD0, 38:38 TBI1, 37:37 TBI0, 36:36 AS, 34:32 IPS, 31:30 TG1, 29:28 SH1, 27:26 ORGN1, 25:24 IRGN1, 23:23 EPD1, 22:22 A1, 21:16 T1SZ, 7:7 EPD0 } TCR_EL2;

// MPAM PMG Translation Ingress Base Control Register
__register 32 { 15:0 BASE } MSMON_IN_TL_BASE;

// Debug Saved Process State Register 2
__register 32 { 4:4 UINJ } DSPSR2;

// System Performance Monitors Access Register (EL1)
__register 64 {  } SPMACCESSR_EL1;

// Interrupt Set-Enable Registers
array [0..31] of __register 32 {  } GICD_ISENABLER;

// Streaming Mode Priority Register
__register 64 { 3:0 Priority } SMPRI_EL1;

// MPAM Virtual PARTID Mapping Register 3
__register 64 { 63:48 PhyPARTID15, 47:32 PhyPARTID14, 31:16 PhyPARTID13, 15:0 PhyPARTID12 } MPAMVPM3_EL2;

// IRS PE Status Register
__register 32 { 2:2 ONLINE, 1:1 V, 0:0 IDLE } IRS_PE_STATUSR;

// Instrumentation Trace Extension External Debug Control Register
__register 64 { 6:6 RL, 5:5 S, 4:4 NS, 3:3 E3 } TRCITEEDCR;

// Error Record Select Register
__register 64 { 15:0 SEL } ERRSELR_EL1;

// Trace PowerDown Status Register
__register 32 { 5:5 OSLK, 1:1 STICKYPD, 0:0 POWER } TRCPDSR;

// External Debug Lock Access Register
__register 32 { 31:0 KEY } EDLAR;

// Set LPI Pending Register
__register 64 { 31:0 pINTID } GICR_SETLPIR;

// Hardware Dirty State Tracking Structure Producer Register
__register 64 { 31:26 FSC, 18:0 INDEX } HDBSSPROD_EL2;

// MPAM Cache Portion Bitmap Partition Configuration Register
array [0..1023] of __register 32 {  } MPAMCFG_CPBM;

// Counter-timer Physical Timer TimerValue Register
__register 32 { 31:0 TimerValue } CNTP_TVAL_EL0;

// Deferred Interrupt Status Register
__register 64 { 31:31 A, 24:24 IDS, 17:16 WU, 12:10 AET, 9:9 EA, 7:7 WnRV, 6:6 WnR, 5:0 DFSC, 23:0 ISS } DISR_EL1;

// Selected Error Record Primary Status Register
__register 32 { 31:0 ERRnSTATUSlo } ERXSTATUS;

// Peripheral Identification Register 4
__register 32 { 7:4 SIZE, 3:0 DES_2 } ERRPIDR4;

// Counter-timer Non-secure Access Register
__register 32 {  } CNTNSAR;

// Counter Group Configuration Register 0
__register 64 { 15:8 CG1NC, 7:0 CG0NC } PMCGCR0;

// CPU Interface Priority Mask Register
__register 32 { 7:0 Priority } GICC_PMR;

// Component Identification Register 0
__register 32 { 7:0 PRMBL_0 } TRBCIDR0;

// External Debug Device Architecture Register
__register 32 { 31:21 ARCHITECT, 20:20 PRESENT, 19:16 REVISION, 15:12 ARCHVER, 11:0 ARCHPART } EDDEVARCH;

// Counter-timer Physical Secure Timer Control Register
__register 32 { 2:2 ISTATUS, 1:1 IMASK, 0:0 ENABLE } CNTPS_CTL_EL1;

// Redistributor Wake Register
__register 32 { 2:2 ChildrenAsleep, 1:1 ProcessorSleep } GICR_WAKER;

// IRS Save VM Register
__register 64 { 63:63 S, 62:62 Q, 15:0 VM_ID } IRS_SAVE_VMR;

// Reset Vector Base Address Register (if EL3 implemented)
__register 64 { 63:0 ResetAddress } RVBAR_EL3;

// Branch Record Buffer Source Address Register <n>
array [0..31] of __register 64 { 63:0 ADDRESS } BRBSRC_EL1;

// External Debug Device Type register
__register 32 { 7:4 SUB, 3:0 MAJOR } EDDEVTYPE;

// Trace ID Register 1
__register 64 { 31:24 DESIGNER, 11:8 TRCARCHMAJ, 7:4 TRCARCHMIN, 3:0 REVISION } TRCIDR1;

// Virtualization Translation Control Register
__register 32 { 45:45 HDBSS, 44:44 HAFT, 41:41 TL0, 40:40 GCSH, 38:38 D128, 37:37 S2POE, 36:36 S2PIE, 35:35 TL1, 34:34 AssuredOnly, 33:33 SL2, 32:32 DS, 30:30 NSA, 29:29 NSW, 28:28 HWU62, 27:27 HWU61, 26:26 HWU60, 25:25 HWU59, 22:22 HD, 21:21 HA, 19:19 VS, 18:16 PS, 15:14 TG0, 13:12 SH0, 11:10 ORGN0, 9:8 IRGN0, 7:6 SL0, 5:0 T0SZ } VTCR_EL2;

// Trace ID Register
__register 32 { 6:0 TRACEID } TRCTRACEIDR;

// Domain Access Control Register
__register 32 {  } DACR;

// Permission Overlay Register 2 (EL2)
__register 64 {  } POR_EL2;

// Guarded Control Stack Pointer Register (EL3)
__register 64 { 63:3 PTR } GCSPR_EL3;

// Performance Monitors Overflow Flag Status Clear Register
__register 32 { 32:32 F0, 31:31 C } PMOVSCLR_EL0;

// CTI Output Trigger Acknowledge register
__register 32 {  } CTIINTACK;

// ITS Cache Invalidation Device Register
__register 32 { 31:31 I, 5:1 EVENTID_BITS, 0:0 L1 } ITS_INV_DEVICER;

// MPAM Egress PARTID Translation Configuration Register
__register 32 { 31:31 ENABLE, 15:0 PARTID_TL } MPAMCFG_OUT_TL;

// Auxiliary Memory Attribute Indirection Register (EL3)
__register 64 {  } AMAIR_EL3;

// MPAM Cache Storage Usage Monitor Capture Register
__register 32 { 31:31 NRDY, 30:0 VALUE } MSMON_CSU_CAPTURE;

// MPAM Memory System Monitor Configure Memory Bandwidth Usage Monitor Filter Register
__register 32 { 23:16 PMG, 15:0 PARTID, 31:30 RWBW } MSMON_CFG_MBWU_FLT;

// Multiprocessor Affinity Register
__register 32 { 31:31 M, 30:30 U, 24:24 MT, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } MPIDR;

// PL0 Read-Only Software Thread ID Register
__register 32 { 31:0 TID } TPIDRURO;

// Interrupt Controller List Registers
array [0..15] of __register 32 { 31:30 State, 29:29 HW, 28:28 Group, 23:16 Priority, 12:0 pINTID } ICH_LRC;

// Interrupt Controller Physical Highest Priority Pending Interrupt Register (EL1)
__register 64 { 32:32 HPPIV, 31:29 TYPE, 23:0 ID } ICC_HPPIR_EL1;

// Reset Vector Base Address Register
__register 32 { 31:1 ResetAddress } RVBAR;

// MPAM Monitor Overflow MSI Write High-part Address Register
__register 32 { 19:0 MSI_ADDR_H } MSMON_OFLOW_MSI_ADDR_H;

// Interrupt Controller Physical PPI Set Active Registers
array [0..1] of __register 64 {  } ICC_PPI_SACTIVER_EL1;

// Interrupt Controller Software Generated Interrupt Group 0 Register
__register 64 { 55:48 Aff3, 47:44 RS, 40:40 IRM, 39:32 Aff2, 27:24 INTID, 23:16 Aff1, 15:0 TargetList } ICC_SGI0R_EL1;

// MPAM PMG Translation Egress Base Control Register
__register 32 { 15:0 BASE } MSMON_OUT_TL_BASE;

// Trace Counter Control Register <n>
array [0..3] of __register 64 { 17:17 CNTCHAIN, 16:16 RLDSELF, 15:15 RLDEVENT_TYPE, 12:8 RLDEVENT_SEL, 7:7 CNTEVENT_TYPE, 4:0 CNTEVENT_SEL } TRCCNTCTLR;

// Counter Frequency ID
__register 32 { 31:0 Frequency } CNTFID0;

// Performance Monitors Software Increment Register
__register 32 {  } PMSWINC_EL0;

// CTI Control register
__register 32 { 0:0 GLBEN } CTICONTROL;

// System Performance Monitors Event Filter Control Register
array [0..63] of __register 64 {  } SPMEVFILTR_EL0;

// System Performance Monitors Secure Control Register
__register 64 { 4:4 NAO, 0:0 SO } SPMSCR_EL1;

// Interrupt Controller Virtual Interrupt Priority Control Register
__register 64 { 4:0 PRIORITY } ICV_PCR_EL1;

// ITS Unmapped MSI register
__register 64 { 63:32 DeviceID, 31:0 EventID } GITS_UMSIR;

// Memory Attribute Indirection Register 0
__register 32 {  } MAIR0;

// Activity Monitors Configuration Register
__register 64 { 31:28 NCG, 24:24 HDBG, 13:8 SIZE, 7:0 N } AMCFGR_EL0;

// CPU Interface Aliased Highest Priority Pending Interrupt Register
__register 32 { 23:0 INTID } GICC_AHPPIR;

// MPAM Long Memory Bandwidth Usage Monitor Capture Register
__register 64 { 63:63 NRDY, 62:0 VALUE } MSMON_MBWU_L_CAPTURE;

// Revision ID Register
__register 32 {  } REVIDR_EL1;

// Debug ROM Address Register
__register 64 { 1:0 Valid, 47:12 ROMADDR } DBGDRAR;

// Activity Monitors Component Identification Register 2
__register 32 { 7:0 PRMBL_2 } AMCIDR2;

// Performance Monitors Configuration Register
__register 64 { 31:28 NCG, 22:22 SS, 21:21 FZO, 19:19 UEN, 18:18 WT, 17:17 NA, 16:16 EX, 15:15 CCD, 14:14 CC, 13:8 SIZE, 7:0 N } PMCFGR;

// Performance Monitors Common Event Identification register 3
__register 32 {  } PMCEID3;

// Performance Monitors Snapshot Status and Capture Register
__register 64 { 32:32 NC, 0:0 SS } PMSSCR_EL1;

// Primary MECID for EL2&0 translation regimes
__register 64 { 15:0 MECID } MECID_P1_EL2;

// ITS MPAM PARTID and PMG Register
__register 32 { 31:31 IDLE, 25:24 MPAM_SP, 23:16 PMG, 15:0 PARTID } ITS_MPAM_PARTID_R;

// Trace Device Configuration Register 1
__register 32 {  } TRCDEVID1;

// CPU Interface Active Priorities Registers
array [0..3] of __register 32 {  } GICC_APR;

// CTI Device ID register 1
__register 32 {  } CTIDEVID1;

// System Performance Monitors Interrupt Enable Set Register
__register 64 {  } SPMINTENSET_EL1;

// IRS SPI Selection Register
__register 32 { 23:0 ID } IRS_SPI_SELR;

// IWB Implementer Identification Register
__register 32 { 31:20 ProductID, 19:16 Variant, 15:12 Revision, 11:0 Implementer } IWB_IIDR;

// Performance Monitors Device Affinity register 0
__register 32 { 30:30 U, 24:24 MT, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } PMDEVAFF0;

// Performance Monitors Count Enable Set Register
__register 32 { 32:32 F0, 31:31 C } PMCNTENSET_EL0;

// Interrupt Controller Virtual Interrupt Acknowledge Register 1
__register 32 { 23:0 INTID } ICV_IAR1_EL1;

// Interrupt Set-Enable Registers
array [1..2] of __register 32 {  } GICR_ISENABLERE;

// Profiling Buffer ID Register
__register 64 { 47:32 MaxBuffSize, 11:8 EA, 7:6 AddrMode, 5:5 F, 4:4 P, 3:0 Align } PMBIDR_EL1;

// Trace Authentication Status Register
__register 64 { 27:26 RTNID, 25:24 RTID, 15:14 RLNID, 13:12 RLID, 11:10 HNID, 9:8 HID, 7:6 SNID, 5:4 SID, 3:2 NSNID, 1:0 NSID } TRCAUTHSTATUS;

// ITS Command Queue Descriptor
__register 64 { 63:63 Valid, 61:59 InnerCache, 55:53 OuterCache, 51:12 Physical_Address, 11:10 Shareability, 7:0 Size } GITS_CBASER;

// Component Identification Register 3
__register 32 { 7:0 PRMBL_3 } ERRCIDR3;

// ITS Read Event Request Register
__register 32 { 31:31 R } ITS_READ_EVENTR;

// Hyp Auxiliary Control Register
__register 32 {  } HACTLR;

// Instruction Set Attribute Register 4
__register 32 { 31:28 SWP_frac, 27:24 PSR_M, 23:20 SynchPrim_frac, 19:16 Barrier, 15:12 SMC, 11:8 Writeback, 7:4 WithShifts, 3:0 Unpriv } ID_ISAR4;

// Translation Table Base Control Register 2
__register 32 { 18:18 HWU162, 17:17 HWU161, 16:16 HWU160, 15:15 HWU159, 14:14 HWU062, 13:13 HWU061, 12:12 HWU060, 11:11 HWU059, 10:10 HPD1, 9:9 HPD0 } TTBCR2;

// Performance Monitors User Enable Register
__register 32 { 6:6 TID, 3:3 ER, 2:2 CR, 1:1 SW, 0:0 EN } PMUSERENR;

// CTI Input Trigger to Output Channel Enable registers
array [0..31] of __register 32 {  } CTIINEN;

// External Debug Device ID Register 1
__register 32 { 7:4 HSR, 3:0 PCSROffset } EDDEVID1;

// Interrupt Controller Binary Point Register 1
__register 32 { 2:0 BinaryPoint } ICC_BPR1_EL1;

// Virtual Machine Deactivate Interrupt Register
__register 32 { 24:0 INTID } GICV_DIR;

// Auxiliary Fault Status Register 0 (EL3)
__register 32 {  } AFSR0_EL3;

// MPAM Memory Bandwidth Maximum Partition Configuration Register
__register 32 { 31:31 HARDLIM, 15:0 MAX } MPAMCFG_MBW_MAX;

// Interrupt Controller Control Register (EL3)
__register 32 { 19:19 ExtRange, 18:18 RSS, 17:17 nDS, 15:15 A3V, 14:14 SEIS, 13:11 IDbits, 10:8 PRIbits, 6:6 PMHE, 5:5 RM, 4:4 EOImode_EL1NS, 3:3 EOImode_EL1S, 2:2 EOImode_EL3, 1:1 CBPR_EL1NS, 0:0 CBPR_EL1S } ICC_CTLR_EL3;

// MPAM Cache Maximum Associativity Partition Configuration Register
__register 32 { 15:0 CASSOC } MPAMCFG_CASSOC;

// Trace Peripheral Identification Register 4
__register 32 { 7:4 SIZE, 3:0 DES_2 } TRCPIDR4;

// Counter-timer Virtual Timer TimerValue register (EL2)
__register 32 { 31:0 TimerValue } CNTHV_TVAL;

// Hyp Memory Attribute Indirection Register 0
__register 32 {  } HMAIR0;

// Interrupt Controller Virtual Interrupt Priority Registers
array [0..15] of __register 64 { 60:56 PRIORITY7, 52:48 PRIORITY6, 44:40 PRIORITY5, 36:32 PRIORITY4, 28:24 PRIORITY3, 20:16 PRIORITY2, 12:8 PRIORITY1, 4:0 PRIORITY0 } ICH_PPI_PRIORITYR_EL2;

// Interrupt Clear-Enable Register 0
__register 32 {  } GICR_ICENABLER0;

// Trace Peripheral Identification Register 7
__register 32 {  } TRCPIDR7;

// MPAM PMG Selection Control Register
__register 32 { 17:17 INGRESS_TL, 15:0 PMG } MSMON_PMG_SEL;

// Critical Error Interrupt Configuration Register 2
__register 32 { 7:7 IRQEN, 6:6 NSMSI, 5:4 SH, 3:0 MemAttr } ERRCRICR2;

// Activity Monitors Count Enable Set Register
__register 64 {  } AMCNTENSET;

// Counter-timer Secure Physical Timer TimerValue Register (EL2)
__register 32 { 31:0 TimerValue } CNTHPS_TVAL_EL2;

// System Performance Monitor Control Register
__register 64 { 11:11 TRO, 10:10 HDBG, 9:9 FZO, 8:8 NA, 4:4 EX, 1:1 P, 0:0 E } SPMCR_EL0;

// CPU Interface Control Register
__register 32 { 10:10 EOImodeNS, 8:8 IRQBypDisGrp1, 7:7 FIQBypDisGrp1, 1:1 EnableGrp1, 9:9 EOImodeS, 6:6 IRQBypDisGrp0, 5:5 FIQBypDisGrp0, 4:4 CBPR, 3:3 FIQEn, 0:0 EnableGrp0, 9:9 EOImode } GICC_CTLR;

// Debug Status and Control Register, External View
__register 32 { 31:31 TFO, 30:30 RXfull, 29:29 TXfull, 27:27 RXO, 26:26 TXU, 23:22 INTdis, 21:21 TDA, 19:19 SC2, 18:18 NS, 17:17 SPNIDdis, 16:16 SPIDdis, 15:15 MDBGen, 14:14 HDE, 12:12 UDCCdis, 6:6 ERR, 5:2 MOE } DBGDSCRext;

// Exception Syndrome Register (EL3)
__register 32 { 55:32 ISS2, 31:26 EC, 25:25 IL, 24:0 ISS } ESR_EL3;

// Auxiliary Control Register 2
__register 32 {  } ACTLR2;

// Memory Model Feature Register 5
__register 32 { 7:4 nTLBPA, 3:0 ETS } ID_MMFR5;

// Set Secure SPI Pending Register
__register 32 { 12:0 INTID } GICM_SETSPI_SR;

// IWB Wire Enable Register
array [0..2047] of __register 32 {  } IWB_WENABLER;

// External Debug Instruction Transfer Register
__register 32 { 31:16 hw2, 15:0 hw1, 31:0 A64_Instruction } EDITR;

// Interrupt Configuration Register 1
__register 32 {  } GICR_ICFGR1;

// Authentication Status Register
__register 32 { 27:26 RTNID, 25:24 RTID, 15:14 RLNID, 13:12 RLID, 7:6 SNID, 5:4 SID, 3:2 NSNID, 1:0 NSID } TRBAUTHSTATUS;

// Interrupt Controller Deactivate Interrupt Register
__register 32 { 23:0 INTID } ICC_DIR_EL1;

// Interrupt Controller Virtual Active Priorities Register
__register 64 {  } ICV_APR_EL1;

// Tag Control Register.
__register 64 { 16:16 RRND, 15:0 Exclude } GCR_EL1;

// ITS Cache Invalidation Event Register
__register 32 { 31:31 I, 2:1 ITT_L2SZ, 0:0 L1 } ITS_INV_EVENTR;

// System Performance Monitors Device Architecture Register
__register 64 { 31:21 ARCHITECT, 20:20 PRESENT, 19:16 REVISION, 15:12 ARCHVER, 11:0 ARCHPART } SPMDEVARCH_EL1;

// MPAM Implementation Identification Register
__register 32 { 31:20 ProductID, 19:16 Variant, 15:12 Revision, 11:0 Implementer } MPAMF_IIDR;

// IRS IST Configuration Register
__register 32 { 16:16 STRUCTURE, 8:7 ISTSZ, 6:5 L2SZ, 4:0 LPI_ID_BITS } IRS_IST_CFGR;

// Debug Watchpoint Control Registers
array [0..63] of __register 64 { 31:30 LBNX, 29:29 SSCE, 28:24 MASK, 22:22 WT2, 20:20 WT, 19:16 LBN, 15:14 SSC, 13:13 HMC, 12:5 BAS, 4:3 LSC, 2:1 PAC, 0:0 E } DBGWCR_EL1;

// Debug Power Control Register
__register 32 { 0:0 CORENPDRQ } DBGPRCR_EL1;

// External Debug Device Affinity register 1
__register 32 { 7:0 Aff3 } EDDEVAFF1;

// Clear Secure SPI Pending Register
__register 32 { 12:0 INTID } GICM_CLRSPI_SR;

// Interrupt Controller Maintenance Interrupt State Register
__register 32 { 7:7 VGrp1D, 6:6 VGrp1E, 5:5 VGrp0D, 4:4 VGrp0E, 3:3 NP, 2:2 LRENP, 1:1 U, 0:0 EOI } ICH_MISR;

// Device Affinity Register
__register 64 { 39:32 Aff3, 30:30 U, 24:24 MT, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } TRBDEVAFF;

// MPAM Ingress PARTID Translation Base Configuration Register
__register 32 { 15:0 BASE } MPAMCFG_IN_TL_BASE;

// Context ID Register
__register 32 { 31:0 PROCID, 7:0 ASID } CONTEXTIDR;

// Floating-point Status Register
__register 32 { 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 QC, 7:7 IDC, 4:4 IXC, 3:3 UFC, 2:2 OFC, 1:1 DZC, 0:0 IOC } FPSR;

// CTI Device ID register 2
__register 32 {  } CTIDEVID2;

// Interrupt Controller VGIC Type Register
__register 32 { 31:29 PRIbits, 28:26 PREbits, 25:23 IDbits, 22:22 SEIS, 21:21 A3V, 20:20 nV4, 19:19 TDS, 4:0 ListRegs } ICH_VTR;

// Interrupt Controller Virtual Interrupt Enable Registers
array [0..1] of __register 64 {  } ICH_PPI_ENABLER_EL2;

// Interrupt Controller End Of Interrupt Register 1
__register 32 { 23:0 INTID } ICC_EOIR1_EL1;

// IRS MEC MECID Register for the Realm PAS
__register 32 { 15:0 MECID } IRS_MEC_MECID_R;

// Peripheral Identification Register 1
__register 32 { 7:4 DES_0, 3:0 PART_1 } ERRPIDR1;

// Interrupt Controller Virtual End Of Interrupt Register 0
__register 32 { 23:0 INTID } ICV_EOIR0;

// Trace Context Identifier Comparator Value Registers <n>
array [0..7] of __register 64 { 63:0 VALUE } TRCCIDCVR;

// Virtual Machine Active Priorities Registers
array [0..3] of __register 32 {  } GICV_APR;

// Access Configuration Register
__register 64 { 31:31 IMPL, 5:4 RLRA, 3:2 SRA, 1:0 NSRA } ERRACR;

// Activity Monitors Configuration Register
__register 32 { 31:28 NCG, 24:24 HDBG, 13:8 SIZE, 7:0 N } AMCFGR;

// Guarded Control Stack Control Register (EL3)
__register 64 { 9:9 STREn, 8:8 PUSHMEn, 6:6 EXLOCKEN, 5:5 RVCHKEN, 0:0 PCRSEL } GCSCR_EL3;

// Interrupt Set-Pending Registers
array [1..2] of __register 32 {  } GICR_ISPENDRE;

// Counter Control Register
__register 32 { 17:8 FCREQ, 2:2 SCEN, 1:1 HDBG, 0:0 EN } CNTCR;

// Debug Authentication Status register
__register 32 { 7:6 SNID, 5:4 SID, 3:2 NSNID, 1:0 NSID } DBGAUTHSTATUS;

// Interrupt Controller System Register Enable Register (EL2)
__register 32 { 3:3 Enable, 2:2 DIB, 1:1 DFB, 0:0 SRE } ICC_SRE_EL2;

// IRS Software Error Syndrome Register 0
__register 64 { 63:63 VIRTUAL, 62:60 TYPE, 55:32 ID, 15:0 VM_ID } IRS_SWERR_SYNDROMER0;

// Critical Error Interrupt Configuration Register 0
__register 64 { 55:2 ADDR } ERRCRICR0;

// Interrupt Controller Virtual End Of Interrupt Register 0
__register 32 { 23:0 INTID } ICV_EOIR0_EL1;

// CTI Device Control register
__register 32 { 1:1 RCE, 0:0 OSUCE } CTIDEVCTL;

// Interrupt Controller Binary Point Register 0
__register 32 { 2:0 BinaryPoint } ICC_BPR0;

// Redistributor Control Register
__register 32 { 31:31 UWP, 26:26 DPG1S, 25:25 DPG1NS, 24:24 DPG0, 3:3 RWP, 2:2 IR, 1:1 CES, 0:0 EnableLPIs } GICR_CTLR;

// Trace ViewInst Main Control Register
__register 32 { 26:26 EXLEVEL_RL_EL2, 25:25 EXLEVEL_RL_EL1, 24:24 EXLEVEL_RL_EL0, 22:22 EXLEVEL_NS_EL2, 21:21 EXLEVEL_NS_EL1, 20:20 EXLEVEL_NS_EL0, 19:19 EXLEVEL_S_EL3, 18:18 EXLEVEL_S_EL2, 17:17 EXLEVEL_S_EL1, 16:16 EXLEVEL_S_EL0, 11:11 TRCERR, 10:10 TRCRESET, 9:9 SSSTATUS, 7:7 EVENT_TYPE, 4:0 EVENT_SEL, 4:0 Reserved } TRCVICTLR;

// Auxiliary Memory Attribute Indirection Register (EL1)
__register 64 {  } AMAIR_EL1;

// Hypervisor GIC Fine-Grained Read Trap Register
__register 64 { 20:20 ICC_PPI_ACTIVERn_EL1, 19:19 ICC_PPI_PRIORITYRn_EL1, 18:18 ICC_PPI_PENDRn_EL1, 17:17 ICC_PPI_ENABLERn_EL1, 16:16 ICC_PPI_HMRn_EL1, 7:7 ICC_IAFFIDR_EL1, 6:6 ICC_ICSR_EL1, 5:5 ICC_PCR_EL1, 4:4 ICC_HPPIR_EL1, 2:2 ICC_CR0_EL1, 1:1 ICC_IDRn_EL1, 0:0 ICC_APR_EL1 } ICH_HFGRTR_EL2;

// IRS Map Virtual IST Register
__register 64 { 63:63 M, 62:62 U, 47:32 VM_ID, 31:29 TYPE } IRS_VMAP_VISTR;

// AArch64 Auxiliary Feature Register 0
__register 64 {  } ID_AA64AFR0_EL1;

// CTI Peripheral Identification Register 3
__register 32 { 7:4 REVAND, 3:0 CMOD } CTIPIDR3;

// MPAM Cache Maximum Capacity Partition Configuration Register
__register 32 { 31:31 SOFTLIM, 15:0 CMAX } MPAMCFG_CMAX;

// Current Cache Size ID Register
__register 32 { 27:13 NumSets, 12:3 Associativity, 2:0 LineSize } CCSIDR_EL1;

// SME Control Register (EL3)
__register 64 { 31:31 FA64, 30:30 EZT0, 3:0 LEN } SMCR_EL3;

// Secure Configuration Register
__register 64 { 62:62 NSE, 61:61 HACDBSEn, 60:60 HDBSSEn, 59:59 FGTEn2, 58:58 EnDSE, 57:57 DSE, 56:56 VTLBIDEn, 55:55 EnIDCP128, 54:54 SRMASKEn, 53:53 PFAREn, 52:52 TWERR, 51:51 TMEA, 50:50 EnFPM, 49:49 MECEn, 48:48 GPF, 47:47 D128En, 46:46 AIEn, 45:45 PIEn, 44:44 SCTLR2En, 43:43 TCR2En, 42:42 RCWMASKEn, 41:41 EnTP2, 40:40 TRNDR, 39:39 GCSEn, 38:38 HXEn, 37:37 ADEn, 36:36 EnAS0, 35:35 AMVOFFEN, 33:30 TWEDEL, 29:29 TWEDEn, 28:28 ECVEn, 27:27 FGTEn, 26:26 ATA, 25:25 EnSCXT, 23:23 TID5, 22:22 TID3, 21:21 FIEN, 20:20 NMEA, 19:19 EASE, 18:18 EEL2, 17:17 API, 16:16 APK, 15:15 TERR, 14:14 TLOR, 13:13 TWE, 12:12 TWI, 11:11 ST, 10:10 RW, 9:9 SIF, 8:8 HCE, 7:7 SMD, 3:3 EA, 2:2 FIQ, 1:1 IRQ, 0:0 NS } SCR_EL3;

// Memory Attribute Indirection Register (EL1)
__register 64 {  } MAIR_EL1;

// Activity Monitors Event Counter Virtual Offset Registers 0
array [0..15] of __register 64 { 63:0 VOffset } AMEVCNTVOFF0_EL2;

// Hardware Accelerator for Cleaning Dirty State Base Register
__register 64 { 55:12 BADDR, 11:11 EN, 3:0 SZ } HACDBSBR_EL2;

// MPAM Cache Storage Usage Monitor Register
__register 32 { 31:31 NRDY, 30:0 VALUE } MSMON_CSU;

// Interrupt Controller Virtual Interrupt Group 1 Enable Register
__register 32 { 0:0 Enable } ICV_IGRPEN1_EL1;

// External Debug Execution Control Register
__register 32 { 6:6 TRBE, 5:5 TRCE, 4:4 PME, 2:2 SS, 1:1 RCE, 0:0 OSUCE } EDECR;

// AArch64 Memory Model Feature Register 1
__register 64 { 63:60 ECBHB, 59:56 CMOW, 55:52 TIDCP1, 51:48 nTLBPA, 47:44 AFP, 43:40 HCX, 39:36 ETS, 35:32 TWED, 31:28 XNX, 27:24 SpecSEI, 23:20 PAN, 19:16 LO, 15:12 HPDS, 11:8 VH, 7:4 VMIDBits, 3:0 HAFDBS } ID_AA64MMFR1_EL1;

// Performance Monitors Machine Identification Register
__register 64 { 28:28 SME, 27:24 EDGE, 23:20 THWIDTH, 19:16 BUS_WIDTH, 15:8 BUS_SLOTS, 7:0 SLOTS } PMMIR;

// Branch Record Buffer Target Address Injection Register
__register 64 { 63:0 ADDRESS } BRBTGTINJ_EL1;

// Interrupt Controller Physical PPI Enable Registers
array [0..1] of __register 64 {  } ICC_PPI_ENABLER_EL1;

// Performance Monitors Component Identification Register 0
__register 32 { 7:0 PRMBL_0 } PMCIDR0;

// Trace Counter Value Register <n>
array [0..3] of __register 32 { 15:0 VALUE } TRCCNTVR;

// Branch Record Buffer Timestamp Register
__register 64 { 63:0 TS } BRBTS_EL1;

// AArch64 Memory Model Feature Register 4
__register 64 { 59:56 SCRX, 47:44 SRMASK, 43:40 TLBID, 39:36 E3DSE, 35:32 EAESR, 31:28 RMEGDI, 27:24 E2H0, 23:20 NV_frac, 19:16 FGWTE3, 15:12 HACDBS, 11:8 ASID2, 7:4 EIESB, 3:0 PoPS } ID_AA64MMFR4_EL1;

// Interrupt Controller Active Priorities Group 1 Registers
array [0..3] of __register 64 { 63:63 NMI } ICC_AP1R_EL1;

// IRS VM Selection Register
__register 32 { 15:0 VM_ID } IRS_VM_SELR;

// External Debug Feature Register 2
__register 64 { 27:24 TRBE_EXC, 23:20 SPE_nVM, 19:16 SPE_EXC, 7:4 BWE, 3:0 STEP } EDDFR2;

// AArch32 Instruction Set Attribute Register 1
__register 32 { 31:28 Jazelle, 27:24 Interwork, 23:20 Immediate, 19:16 IfThen, 15:12 Extend, 11:8 Except_AR, 7:4 Except, 3:0 Endian } ID_ISAR1_EL1;

// End Interrupt Status Register
__register 32 {  } GICH_EISR;

// SVE Control Register (EL3)
__register 64 { 3:0 LEN } ZCR_EL3;

// Interrupt Controller Virtual PPI Handling mode Registers
array [0..1] of __register 64 {  } ICV_PPI_HMR_EL1;

// Extended Memory Attribute Indirection Register (EL3)
__register 64 {  } MAIR2_EL3;

// ITS Device Table Base Address Register
__register 64 { 55:3 ADDR } ITS_DT_BASER;

// Sampling Latency Filter Register
__register 64 { 15:0 MINLAT } PMSLATFR_EL1;

// Performance Monitors Lock Status Register
__register 32 { 2:2 nTT, 1:1 SLK, 0:0 SLI } PMLSR;

// Domain Access Control Register
__register 32 {  } DACR32_EL2;

// Interrupt Controller Virtual Highest Priority Pending Interrupt Register 0
__register 32 { 23:0 INTID } ICV_HPPIR0;

// MPAM Monitor Instance Selection Register
__register 32 { 27:24 RIS, 15:0 MON_SEL } MSMON_CFG_MON_SEL;

// Counter-timer Timer ID Register
__register 32 {  } CNTTIDR;

// Interrupt Controller Interrupt Priority Control Register (EL3)
__register 64 { 4:0 PRIORITY } ICC_PCR_EL3;

// External Debug Processor Feature Register
__register 64 { 47:44 AMU, 39:36 SEL2, 35:32 SVE, 27:24 GIC, 23:20 AdvSIMD, 19:16 FP, 15:12 EL3, 11:8 EL2, 7:4 EL1, 3:0 EL0 } EDPFR;

// Hyp Memory Attribute Indirection Register 1
__register 32 {  } HMAIR1;

// Instruction Set Attribute Register 5
__register 32 { 31:28 VCMA, 27:24 RDM, 19:16 CRC32, 15:12 SHA2, 11:8 SHA1, 7:4 AES, 3:0 SEVL } ID_ISAR5;

// Device Configuration Register
__register 32 { 21:21 PFG, 19:16 IRQCR, 15:0 NUM } ERRDEVID;

// Debug ID Register
__register 32 { 31:28 WRPs, 27:24 BRPs, 23:20 CTX_CMPs, 19:16 Version, 14:14 nSUHD_imp, 12:12 SE_imp } DBGDIDR;

// CTI CLAIM Tag Set register
__register 32 {  } CTICLAIMSET;

// Guarded Control Stack Control Register (EL0)
__register 64 { 10:10 nTR, 9:9 STREn, 8:8 PUSHMEn, 5:5 RVCHKEN, 0:0 PCRSEL } GCSCRE0_EL1;

// CTI Channel In Status register
__register 32 {  } CTICHINSTATUS;

// Translation Table Base Register 0 (EL3)
__register 64 { 47:1 BADDR, 2:1 SKL, 0:0 CnP } TTBR0_EL3;

// Hypervisor Debug Fine-Grained Write Trap Register 2
__register 64 { 24:24 nPMBMAR_EL1, 23:23 nMDSTEPOP_EL1, 22:22 nTRBMPAM_EL1, 21:21 nPMZR_EL0, 20:20 nTRCITECR_EL1, 19:19 nPMSDSFR_EL1, 16:16 nSPMSCR_EL1, 15:15 nSPMACCESSR_EL1, 14:14 nSPMCR_EL0, 13:13 nSPMOVS, 12:12 nSPMINTEN, 11:11 nSPMCNTEN, 10:10 nSPMSELR_EL0, 9:9 nSPMEVTYPERn_EL0, 8:8 nSPMEVCNTRn_EL0, 7:7 nPMSSCR_EL1, 5:5 nMDSELR_EL1, 4:4 nPMUACR_EL1, 3:3 nPMICFILTR_EL0, 2:2 nPMICNTR_EL0, 0:0 nPMECR_EL1 } HDFGWTR2_EL2;

// Lock Status Register
__register 32 { 0:0 SLI } TRBLSR;

// Performance Monitors Cycle Count Register
__register 64 { 63:0 CCNT } PMCCNTR;

// System Performance Monitors Zero with Mask
__register 64 {  } SPMZR_EL0;

// Hypervisor Debug Fine-Grained Write Trap Register
__register 64 { 62:62 nPMSNEVFR_EL1, 61:61 nBRBDATA, 60:60 nBRBCTL, 57:57 PMUSERENR_EL0, 56:56 TRBTRG_EL1, 55:55 TRBSR_EL1, 54:54 TRBPTR_EL1, 53:53 TRBMAR_EL1, 52:52 TRBLIMITR_EL1, 50:50 TRBBASER_EL1, 49:49 TRFCR_EL1, 48:48 TRCVICTLR, 46:46 TRCSSCSRn, 45:45 TRCSEQSTR, 44:44 TRCPRGCTLR, 42:42 TRCOSLAR, 41:41 TRCIMSPECn, 37:37 TRCCNTVRn, 36:36 TRCCLAIM, 35:35 TRCAUXCTLR, 33:33 TRC, 32:32 PMSLATFR_EL1, 31:31 PMSIRR_EL1, 29:29 PMSICR_EL1, 28:28 PMSFCR_EL1, 27:27 PMSEVFR_EL1, 26:26 PMSCR_EL1, 25:25 PMBSR_EL1, 24:24 PMBPTR_EL1, 23:23 PMBLIMITR_EL1, 21:21 PMCR_EL0, 20:20 PMSWINC_EL0, 19:19 PMSELR_EL0, 18:18 PMOVS, 17:17 PMINTEN, 16:16 PMCNTEN, 15:15 PMCCNTR_EL0, 14:14 PMCCFILTR_EL0, 13:13 PMEVTYPERn_EL0, 12:12 PMEVCNTRn_EL0, 11:11 OSDLR_EL1, 10:10 OSECCR_EL1, 8:8 OSLAR_EL1, 7:7 DBGPRCR_EL1, 5:5 DBGCLAIM, 4:4 MDSCR_EL1, 3:3 DBGWVRn_EL1, 2:2 DBGWCRn_EL1, 1:1 DBGBVRn_EL1, 0:0 DBGBCRn_EL1 } HDFGWTR_EL2;

// Performance Monitors Extended Control Register (EL1)
__register 64 { 4:3 SSE, 2:2 KPME, 1:0 PMEE } PMECR_EL1;

// ITS Read Register
__register 64 { 19:5 Offset, 0:0 Stalled } GITS_CREADR;

// MPAM CSU Monitor Overflow Status Register
__register 32 {  } MSMON_CSU_OFSR;

// Error Record <n> Miscellaneous Register 0
array [0..65534] of __register 64 { 39:39 OF, 38:32 CEC, 47:47 OFO, 46:40 CECO, 39:39 OFR, 38:32 CECR } ERRMISC0;

// ITS Generate Incoming Event Status Register
__register 32 { 0:0 IDLE } ITS_GEN_EVENT_STATUSR;

// Interrupt Controller ID Register 0
__register 64 { 11:8 GCIE_LEGACY, 7:4 PRI_BITS, 3:0 ID_BITS } ICC_IDR0_EL1;

// Interrupt Controller Virtual Interrupt Acknowledge Register 0
__register 32 { 23:0 INTID } ICV_IAR0_EL1;

// Trace Claim Tag Set Register
__register 32 {  } TRCCLAIMSET;

// MPAM Monitor Cache Storage Usage Root Control Register
__register 32 { 2:0 PAS } MSMON_CSU_ROOTCR;

// Counter ID registers
array [0..11] of __register 32 {  } CounterID;

// MPAM Architecture Identification Register
__register 32 { 7:4 ArchMajorRev, 3:0 ArchMinorRev } MPAMF_AIDR;

// Activity Monitors Event Counter Registers 0
array [0..3] of __register 64 { 63:0 ACNT } AMEVCNTR0;

// AArch32 Instruction Set Attribute Register 3
__register 32 { 31:28 T32EE, 27:24 TrueNOP, 23:20 T32Copy, 19:16 TabBranch, 15:12 SynchPrim, 11:8 SVC, 7:4 SIMD, 3:0 Saturate } ID_ISAR3_EL1;

// Debug Saved Program Status Register
__register 32 { 36:36 UINJ, 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 15:10 IT, 24:24 DIT, 12:12 SSBS, 22:22 PAN, 21:21 SS, 20:20 IL, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 5:5 T, 35:35 PACM, 34:34 EXLOCK, 32:32 PM, 25:25 TCO, 23:23 UAO, 13:13 ALLINT, 11:10 BTYPE, 9:9 D, 4:4, 4:4, 3:0, 3:0 M } DSPSR_EL0;

// Interrupt Controller Interrupt Group 1 Enable register
__register 32 { 0:0 Enable } ICC_IGRPEN1;

// Translation Control Masking Register (EL2)
__register 64 { 61:61 MTX1, 60:60 MTX0, 59:59 DS, 58:58 TCMA1, 57:57 TCMA0, 56:56 E0PD1, 55:55 E0PD0, 54:54 NFD1, 53:53 NFD0, 52:52 TBID1, 51:51 TBID0, 50:50 HWU162, 49:49 HWU161, 48:48 HWU160, 47:47 HWU159, 46:46 HWU062, 45:45 HWU061, 44:44 HWU060, 43:43 HWU059, 42:42 HPD1, 41:41 HPD0, 40:40 HD, 39:39 HA, 38:38 TBI1, 37:37 TBI0, 36:36 AS, 32:32 IPS, 30:30 TG1, 28:28 SH1, 26:26 ORGN1, 24:24 IRGN1, 23:23 EPD1, 22:22 A1, 16:16 T1SZ, 14:14 TG0, 12:12 SH0, 10:10 ORGN0, 8:8 IRGN0, 7:7 EPD0, 0:0 T0SZ } TCRMASK_EL2;

// Reset Management Register
__register 32 { 1:1 RR, 0:0 AA64 } RMR;

// Counter Count Value register
__register 64 { 63:0 CountValue } CNTCV;

// MPAM Error MSI Low-part Address Register
__register 32 { 31:2 MSI_ADDR_L } MPAMF_ERR_MSI_ADDR_L;

// Interrupt Group Modifier Registers
array [1..2] of __register 32 {  } GICR_IGRPMODRE;

// AArch64 Debug Feature Register 0
__register 64 { 63:60 HPMN0, 59:56 ExtTrcBuff, 55:52 BRBE, 51:48 MTPMU, 47:44 TraceBuffer, 43:40 TraceFilt, 39:36 DoubleLock, 35:32 PMSVer, 31:28 CTX_CMPs, 23:20 WRPs, 19:16 PMSS, 15:12 BRPs, 11:8 PMUVer, 7:4 TraceVer, 3:0 DebugVer } ID_AA64DFR0_EL1;

// Trace Context Identifier Comparator Control Register 1
__register 64 {  } TRCCIDCCTLR1;

// Counter-timer Virtual Timer Control register (EL2)
__register 32 { 2:2 ISTATUS, 1:1 IMASK, 0:0 ENABLE } CNTHV_CTL;

// ITS Identification Register 1
__register 32 { 10:8 L2SZ, 7:7 ITT_LEVELS, 6:6 DT_LEVELS, 5:0 DEVICEID_BITS } ITS_IDR1;

// Interrupt Controller Virtual PPI Priority Registers
array [0..15] of __register 64 { 60:56 PRIORITY7, 52:48 PRIORITY6, 44:40 PRIORITY5, 36:32 PRIORITY4, 28:24 PRIORITY3, 20:16 PRIORITY2, 12:8 PRIORITY1, 4:0 PRIORITY0 } ICV_PPI_PRIORITYR_EL1;

// Error Record <n> Control Register
array [0..65534] of __register 64 { 15:15 WDFI, 14:14 DFI, 14:14 RDFI, 13:13 CI, 12:12 CED, 11:11 WDUI, 10:10 DUI, 10:10 RDUI, 9:9 WCFI, 8:8 CFI, 8:8 RCFI, 7:7 WUE, 6:6 WFI, 5:5 WUI, 4:4 UE, 4:4 RUE, 3:3 FI, 3:3 RFI, 2:2 UI, 2:2 RUI, 0:0 ED } ERRCTLR;

// Counter-timer Physical Timer TimerValue
__register 32 { 31:0 TimerValue } CNTP_TVAL;

// Counter-timer Virtual Timer Control
__register 32 { 2:2 ISTATUS, 1:1 IMASK, 0:0 ENABLE } CNTV_CTL;

// Trace Component Identification Register 3
__register 32 { 7:0 PRMBL_3 } TRCCIDR3;

// MPAM Memory Bandwidth Usage Monitor Capture Register
__register 32 { 31:31 NRDY, 30:0 VALUE } MSMON_MBWU_CAPTURE;

// Fault Handling Interrupt Configuration Register 1
__register 32 { 31:0 DATA } ERRFHICR1;

// Auxiliary Control Register
__register 32 {  } ACTLR;

// Trace Filter Control Register
__register 32 { 6:5 TS, 1:1 E1TRE, 0:0 E0TRE } TRFCR;

// System Performance Monitors Event Count Register
array [0..63] of __register 64 { 63:0 CNTR } SPMEVCNTR_EL0;

// Interrupt Controller Virtual Binary Point Register 0
__register 32 { 2:0 BinaryPoint } ICV_BPR0_EL1;

// Interrupt Controller Interrupt Acknowledge Register 0
__register 32 { 23:0 INTID } ICC_IAR0_EL1;

// IWB ID register 0
__register 32 { 14:11 INT_DOMS, 10:0 IW_RANGE } IWB_IDR0;

// Processor Feature Register 0
__register 32 { 31:28 RAS, 27:24 DIT, 23:20 AMU, 19:16 CSV2, 15:12 State3, 11:8 State2, 7:4 State1, 3:0 State0 } ID_PFR0;

// CTI Device Affinity register 1
__register 32 { 7:0 Aff3 } CTIDEVAFF1;

// Trace Buffer Limit Address Register
__register 64 { 63:12 LIMIT, 6:6 XE, 5:5 nVM, 4:3 TM, 2:1 FM, 0:0 E } TRBLIMITR_EL1;

// EL2 Read/Write Software Context Number
__register 64 { 63:0 SCXTNUM } SCXTNUM_EL2;

// Interrupt Controller Active Priorities Group 0 Registers
array [0..3] of __register 64 {  } ICC_AP0R_EL1;

// Secure Configuration Register
__register 64 { 2:2 SRMASK2En, 1:1 NV3En, 0:0 FDIT } SCR2_EL3;

// Interrupt Controller Virtual Non-maskable Interrupt Acknowledge Register 1
__register 64 { 23:0 INTID } ICV_NMIAR1_EL1;

// Floating-point Mode Register
__register 64 { 37:32 LSCALE2, 31:24 NSCALE, 22:16 LSCALE, 15:15 OSC, 14:14 OSM, 8:6 F8D, 5:3 F8S2, 2:0 F8S1 } FPMR;

// Selected Error Record Control Register 2
__register 32 { 31:0 ERRnCTLRhi } ERXCTLR2;

// Interrupt Controller Control Register
__register 32 { 19:19 ExtRange, 18:18 RSS, 15:15 A3V, 14:14 SEIS, 13:11 IDbits, 10:8 PRIbits, 6:6 PMHE, 1:1 EOImode, 0:0 CBPR } ICC_CTLR;

// Component Identification Register 1
__register 32 { 7:4 CLASS, 3:0 PRMBL_1 } ERRCIDR1;

// AArch32 Secure Debug Enable Register
__register 32 { 1:1 SUNIDEN, 0:0 SUIDEN } SDER32_EL3;

// Primary MECID for EL1&0 stage 2 translation regime
__register 64 { 15:0 MECID } VMECID_P_EL2;

// Performance Monitors Count Enable Set register
__register 32 { 31:31 C } PMCNTENSET;

// Performance Monitors Cycle Counter Filter Register
__register 32 { 57:56 VS, 31:31 P, 30:30 U, 29:29 NSK, 28:28 NSU, 27:27 NSH, 26:26 M, 24:24 SH, 22:22 RLK, 21:21 RLU, 20:20 RLH } PMCCFILTR_EL0;

// Trace Single-shot Comparator Control Status Register <n>
array [0..7] of __register 32 { 31:31 STATUS, 30:30 PENDING, 3:3 PC, 2:2 DV, 1:1 DA, 0:0 INST } TRCSSCSR;

// Performance Monitors Device Affinity register 1
__register 32 { 7:0 Aff3 } PMDEVAFF1;

// Fine-Grained Write Traps EL3
__register 64 { 22:22 GPCBW_EL3, 21:21 VBAR_EL3, 20:20 TTBR0_EL3, 19:19 TPIDR_EL3, 18:18 TCR_EL3, 17:17 SPMROOTCR_EL3, 16:16 SCTLR2_EL3, 15:15 SCTLR_EL3, 14:14 PIR_EL3, 13:13 MPAM3_EL3, 12:12 MECID_RL_A_EL3, 11:11 MDCR_EL3, 10:10 MAIR2_EL3, 9:9 MAIR_EL3, 8:8 GPTBR_EL3, 7:7 GPCCR_EL3, 6:6 GCSPR_EL3, 5:5 GCSCR_EL3, 4:4 AMAIR2_EL3, 3:3 AMAIR_EL3, 2:2 AFSR1_EL3, 1:1 AFSR0_EL3, 0:0 ACTLR_EL3 } FGWTE3_EL3;

// Exception Syndrome Register (EL1)
__register 32 { 55:32 ISS2, 31:26 EC, 25:25 IL, 24:0 ISS } ESR_EL1;

// IRS Identification Register 3
__register 32 { 10:10 VMT_LEVELS, 9:5 VM_ID_BITS, 4:1 VMD_SZ, 0:0 VMD } IRS_IDR3;

// Statistical Profiling Control Register (EL2)
__register 64 { 11:11 EnVM, 10:10 KE, 9:8 EE, 7:6 PCT, 5:5 TS, 4:4 PA, 3:3 CX, 1:1 E2SPE, 0:0 E0HSPE } PMSCR_EL2;

// MPAM PMG Translation Egress Control Register
__register 32 { 31:31 ENABLE, 15:0 PMGTL } MSMON_OUT_TL;

// Data Independent Timing
__register 32 { 24:24 DIT } DIT;

// Permission Indirection Register 2 (EL2)
__register 64 {  } PIR_EL2;

// Interrupt Controller Highest Priority Pending Interrupt Register 0
__register 32 { 23:0 INTID } ICC_HPPIR0;

// Extended Translation Control Masking Register (EL1)
__register 64 { 21:21 FNGNA1, 20:20 FNGNA0, 18:18 FNG1, 17:17 FNG0, 16:16 A2, 15:15 DisCH1, 14:14 DisCH0, 11:11 HAFT, 10:10 PTTWI, 5:5 D128, 4:4 AIE, 3:3 POE, 2:2 E0POE, 1:1 PIE, 0:0 PnCH } TCR2MASK_EL1;

// Interrupt Controller Virtual Interrupt Acknowledge Register 0
__register 32 { 23:0 INTID } ICV_IAR0;

// AArch64 Instruction Set Attribute Register 3
__register 64 { 47:44 LSCP, 43:40 LSCSHINT, 39:36 MTETC, 35:32 PAC_frac2, 31:28 FPRCVT, 27:24 LSUI, 23:20 OCCMO, 19:16 LSFE, 15:12 PACM, 11:8 TLBIW, 7:4 FAMINMAX, 3:0 CPA } ID_AA64ISAR3_EL1;

// Trace Filter Control Register (EL2)
__register 64 { 11:11 DnVM, 10:10 KE, 9:8 EE, 6:5 TS, 3:3 CX, 1:1 E2TRE, 0:0 E0HTRE } TRFCR_EL2;

// Pointer Authentication Key B for Data (bits[127:64]) 
__register 64 { 63:0 APDBKeyHi } APDBKeyHi_EL1;

// Trace Address Comparator Access Type Register <n>
array [0..15] of __register 64 { 18:18 EXLEVEL_RL_EL2, 17:17 EXLEVEL_RL_EL1, 16:16 EXLEVEL_RL_EL0, 14:14 EXLEVEL_NS_EL2, 13:13 EXLEVEL_NS_EL1, 12:12 EXLEVEL_NS_EL0, 11:11 EXLEVEL_S_EL3, 10:10 EXLEVEL_S_EL2, 9:9 EXLEVEL_S_EL1, 8:8 EXLEVEL_S_EL0, 6:4 CONTEXT, 3:2 CONTEXTTYPE } TRCACATR;

// MPAM Egress PARTID Translation ID Register
__register 32 { 31:31 HAS_DIRECT_TL, 30:30 HAS_BASE_MASK, 15:0 OUT_PARTID_MAX } MPAMF_OUT_TL_IDR;

// Interrupt Controller Interrupt Group 0 Enable register
__register 32 { 0:0 Enable } ICC_IGRPEN0;

// System Performance Monitors Device Affinity Register
__register 64 { 39:32 Aff3, 31:31 F0V, 30:30 U, 24:24 MT, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } SPMDEVAFF_EL1;

// Interrupt Controller Interrupt Priority Mask Register
__register 32 { 7:0 Priority } ICC_PMR_EL1;

// Activity Monitors Count Enable Set Register 1
__register 32 {  } AMCNTENSET1;

// Activity Monitors Device Type Register
__register 32 { 7:4 SUB, 3:0 MAJOR } AMDEVTYPE;

// Fault Address Register (EL2)
__register 64 { 63:0 VA } FAR_EL2;

// Hyp System Trap Register
__register 32 { 15:15 T15, 13:13 T13, 12:12 T12, 11:11 T11, 10:10 T10, 9:9 T9, 8:8 T8, 7:7 T7, 6:6 T6, 5:5 T5, 3:3 T3, 2:2 T2, 1:1 T1, 0:0 T0 } HSTR;

// Hypervisor Fine-Grained Instruction Trap Register
__register 64 { 63:63 PSBCSYNC, 62:62 ATS1E1A, 60:60 COSPRCTX, 59:59 nGCSEPP, 58:58 nGCSSTR_EL1, 57:57 nGCSPUSHM_EL1, 56:56 nBRBIALL, 55:55 nBRBINJ, 54:54 DCCVAC, 53:53 SVC_EL1, 52:52 SVC_EL0, 51:51 ERET, 50:50 CPPRCTX, 49:49 DVPRCTX, 48:48 CFPRCTX, 47:47 TLBIVAALE1, 46:46 TLBIVALE1, 45:45 TLBIVAAE1, 44:44 TLBIASIDE1, 43:43 TLBIVAE1, 42:42 TLBIVMALLE1, 41:41 TLBIRVAALE1, 40:40 TLBIRVALE1, 39:39 TLBIRVAAE1, 38:38 TLBIRVAE1, 37:37 TLBIRVAALE1IS, 36:36 TLBIRVALE1IS, 35:35 TLBIRVAAE1IS, 34:34 TLBIRVAE1IS, 33:33 TLBIVAALE1IS, 32:32 TLBIVALE1IS, 31:31 TLBIVAAE1IS, 30:30 TLBIASIDE1IS, 29:29 TLBIVAE1IS, 28:28 TLBIVMALLE1IS, 27:27 TLBIRVAALE1OS, 26:26 TLBIRVALE1OS, 25:25 TLBIRVAAE1OS, 24:24 TLBIRVAE1OS, 23:23 TLBIVAALE1OS, 22:22 TLBIVALE1OS, 21:21 TLBIVAAE1OS, 20:20 TLBIASIDE1OS, 19:19 TLBIVAE1OS, 18:18 TLBIVMALLE1OS, 17:17 ATS1E1WP, 16:16 ATS1E1RP, 15:15 ATS1E0W, 14:14 ATS1E0R, 13:13 ATS1E1W, 12:12 ATS1E1R, 11:11 DCZVA, 10:10 DCCIVAC, 9:9 DCCVADP, 8:8 DCCVAP, 7:7 DCCVAU, 6:6 DCCISW, 5:5 DCCSW, 4:4 DCISW, 3:3 DCIVAC, 2:2 ICIVAU, 1:1 ICIALLU, 0:0 ICIALLUIS } HFGITR_EL2;

// MPAM Error MSI Data Register
__register 32 { 31:0 MSI_DATA } MPAMF_ERR_MSI_DATA;

// Report maximum PARTID and PMG Register
__register 32 { 23:16 PMGmax, 15:0 PARTIDmax } GITS_MPAMIDR;

// Selected Error Record Address Register
__register 64 { 63:0 ERRnADDR } ERXADDR_EL1;

// Non-maskable Interrupt Registers for Extended SPIs, x = 0 to 31
array [0..31] of __register 32 {  } GICD_INMIRE;

// Saved Program Status Register (Hyp mode)
__register 32 { 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 15:10 IT, 24:24 J, 23:23 SSBS, 22:22 PAN, 21:21 DIT, 20:20 IL, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 5:5 T, 4:0 M } SPSR_hyp;

// AArch64 Processor Feature Register 0
__register 64 { 63:60 CSV3, 59:56 CSV2, 55:52 RME, 51:48 DIT, 47:44 AMU, 43:40 MPAM, 39:36 SEL2, 35:32 SVE, 31:28 RAS, 27:24 GIC, 23:20 AdvSIMD, 19:16 FP, 15:12 EL3, 11:8 EL2, 7:4 EL1, 3:0 EL0 } ID_AA64PFR0_EL1;

// Interrupt Controller End of Interrupt Status Register
__register 32 {  } ICH_EISR;

// Monitor DCC Interrupt Enable Register
__register 32 { 30:30 RX, 29:29 TX } MDCCINT_EL1;

// IRS MPAM PARTID and PMG Register
__register 32 { 31:31 IDLE, 25:24 MPAM_SP, 23:16 PMG, 15:0 PARTID } IRS_MPAM_PARTID_R;

// CPU Interface Highest Priority Pending Interrupt Register
__register 32 { 23:0 INTID } GICC_HPPIR;

// Architectural Feature Trap Masking Register
__register 64 { 31:31 TCPAC, 30:30 TAM, 29:29 E0POE, 28:28 TTA, 24:24 SMEN, 20:20 FPEN, 16:16 ZEN } CPTRMASK_EL2;

// Architectural Feature Trap Register (EL2)
__register 32 { 31:31 TCPAC, 30:30 TAM, 29:29 E0POE, 20:20 TTA, 25:24 SMEN, 21:20 FPEN, 17:16 ZEN, 12:12 TSM, 10:10 TFP, 8:8 TZ } CPTR_EL2;

// Translation Table Base Register 1
__register 64 { 31:7 TTB1, 0:0 IRGN, 5:5 NOS, 4:3 RGN, 2:2 IMP, 1:1 S, 55:48 ASID, 47:1 BADDR, 0:0 CnP } TTBR1;

// Interrupt Controller System Register Enable Register (EL3)
__register 32 { 3:3 Enable, 2:2 DIB, 1:1 DFB, 0:0 SRE } ICC_SRE_EL3;

// Interrupt Controller Virtual Active Priorities Group 0 Registers
array [0..3] of __register 32 {  } ICV_AP0R;

// AArch64 Debug Feature Register 2
__register 64 { 27:24 TRBE_EXC, 23:20 SPE_nVM, 19:16 SPE_EXC, 7:4 BWE, 3:0 STEP } ID_AA64DFR2_EL1;

// Performance Monitors Cycle Count Filter Register
__register 32 { 31:31 P, 30:30 U, 29:29 NSK, 28:28 NSU, 27:27 NSH, 21:21 RLU } PMCCFILTR;

// Counter-timer Frequency
__register 32 { 31:0 ClockFreq } CNTFRQ;

// EL0 Read-Only Software Thread ID Register
__register 64 { 63:0 ThreadID } TPIDRRO_EL0;

// Performance Monitors Authentication Status register
__register 32 { 27:26 RTNID, 25:24 RTID, 15:14 RLNID, 13:12 RLID, 7:6 SNID, 5:4 SID, 3:2 NSNID, 1:0 NSID } PMAUTHSTATUS;

// External Debug Reserve Control Register
__register 32 { 4:4 CBRRQ, 3:3 CSPA, 2:2 CSE } EDRCR;

// Activity Monitors Secure Control Register
__register 64 { 31:31 IMPL, 1:1 NSRA } AMSCR;

// Interrupt Controller Virtual Highest Priority Pending Interrupt Register 1
__register 32 { 23:0 INTID } ICV_HPPIR1;

// Interrupt Controller Hyp Control Register
__register 32 { 31:27 EOIcount, 14:14 TDIR, 13:13 TSEI, 12:12 TALL1, 11:11 TALL0, 10:10 TC, 8:8 vSGIEOICount, 7:7 VGrp1DIE, 6:6 VGrp1EIE, 5:5 VGrp0DIE, 4:4 VGrp0EIE, 3:3 NPIE, 2:2 LRENPIE, 1:1 UIE, 0:0 En } ICH_HCR;

// MPAM ID Register (EL1)
__register 64 { 56:56 HAS_BW_CTRL, 39:32 PMG_MAX, 22:22 HAS_INSTR_ALT_ID, 21:21 HAS_ALT_ID, 17:17 HAS_HCR, 15:0 PARTID_MAX, 61:61 HAS_SDEFLT, 60:60 HAS_FORCE_NS, 59:59 SP4, 58:58 HAS_TIDR, 57:57 HAS_ALTSP, 20:18 VPMR_MAX } MPAMIDR_EL1;

// Counter-timer Physical Count
__register 64 { 63:0 PhysicalCount } CNTPCT;

// Auxiliary Control Register (EL1)
__register 64 {  } ACTLR_EL1;

// Interrupt Configuration Register 0
__register 32 {  } GICR_ICFGR0;

// Debug Data Transfer Register, Transmit
__register 32 { 31:0 DTRTX } DBGDTRTXint;

// AArch32 Memory Model Feature Register 4
__register 32 { 31:28 EVT, 27:24 CCIDX, 23:20 LSM, 19:16 HPDS, 15:12 CnP, 11:8 XNX, 7:4 AC2, 3:0 SpecSEI } ID_MMFR4_EL1;

// Virtual Machine Aliased Binary Point Register
__register 32 { 2:0 Binary_Point } GICV_ABPR;

// Interrupt Controller Type Register
__register 32 { 31:27 ESPI_range, 26:26 RSS, 25:25 No1N, 24:24 A3V, 23:19 IDbits, 18:18 DVIS, 17:17 LPIS, 16:16 MBIS, 15:11 num_LPIs, 10:10 SecurityExtn, 9:9 NMI, 8:8 ESPI, 7:5 CPUNumber, 4:0 ITLinesNumber } GICD_TYPER;

// CTI Peripheral Identification Register 1
__register 32 { 7:4 DES_0, 3:0 PART_1 } CTIPIDR1;

// Debug Watchpoint Control Registers
array [0..15] of __register 32 { 28:24 MASK, 20:20 WT, 19:16 LBN, 15:14 SSC, 13:13 HMC, 12:5 BAS, 4:3 LSC, 2:1 PAC, 0:0 E } DBGWCR;

// Interrupt Controller Software Generated Interrupt Group 1 Register
__register 64 { 55:48 Aff3, 47:44 RS, 40:40 IRM, 39:32 Aff2, 27:24 INTID, 23:16 Aff1, 15:0 TargetList } ICC_SGI1R;

// ITS Generate Incoming Event DeviceID Register
__register 64 { 31:0 DEVICE_ID } ITS_GEN_EVENT_DIDR;

// Activity Monitors Event Type Registers 0
array [0..3] of __register 64 { 15:0 evtCount } AMEVTYPER0;

// Debug Watchpoint Value Registers
array [0..63] of __register 64 { 63:57, 56:53, 52:49 RESS, 56:53, 52:49, 48:2 VA } DBGWVR_EL1;

// ITS Configuration Register 0
__register 32 { 1:1 IDLE, 0:0 ITSEN } ITS_CR0;

// Interrupt Controller End Of Interrupt Register 1
__register 32 { 23:0 INTID } ICC_EOIR1;

// Granule Protection Check Control Register (EL3)
__register 64 { 29:29 GPCBW, 28:28 NA7, 27:27 NA6, 26:26 NSP, 25:25 SA, 24:24 APPSAA, 23:20 L0GPTSZ, 19:19 NSO, 18:18 TBGPCD, 17:17 GPCP, 16:16 GPC, 15:14 PGS, 13:12 SH, 11:10 ORGN, 9:8 IRGN, 7:7 SPAD, 6:6 NSPAD, 5:5 RLPAD, 3:3 PPS3, 2:0 PPS } GPCCR_EL3;

// Error Record <n> Miscellaneous Register 1
array [0..65534] of __register 64 {  } ERRMISC1;

// Performance Monitors Peripheral Identification Register 0
__register 32 { 7:0 PART_0 } PMPIDR0;

// MPAM Resource Monitoring Identification Register
__register 32 { 31:31 HAS_LOCAL_CAPT_EVNT, 30:30 NO_HW_OFLW_INTR, 29:29 HAS_OFLW_MSI, 28:28 HAS_OFLOW_SR, 27:26 HAS_TL_MONITORING, 18:18 MSMON_CSA, 17:17 MSMON_MBWU, 16:16 MSMON_CSU } MPAMF_MSMON_IDR;

// Reset Vector Base Address Register (if EL2 and EL3 not implemented)
__register 64 { 63:0 ResetAddress } RVBAR_EL1;

// Performance Monitors Instruction Count Saved Value Register
__register 64 { 63:0 ICNT } PMICNTSVR_EL1;

// Cache Size Selection Register
__register 32 { 3:1 Level, 0:0 InD } CSSELR;

// Trace Event Control 1 Register
__register 64 { 13:13 OE, 12:12 LPOVERRIDE, 11:11 ATB } TRCEVENTCTL1R;

// Counter-timer Secure Physical Timer CompareValue Register (EL2)
__register 64 { 63:0 CompareValue } CNTHPS_CVAL_EL2;

// Media and VFP Feature Register 1
__register 32 { 31:28 SIMDFMAC, 27:24 FPHP, 23:20 SIMDHP, 19:16 SIMDSP, 15:12 SIMDInt, 11:8 SIMDLS, 7:4 FPDNaN, 3:0 FPFtZ } MVFR1;

// Interrupt Controller Highest Priority Pending Interrupt Register 1
__register 32 { 23:0 INTID } ICC_HPPIR1;

// Performance Monitors Zero with Mask
__register 64 { 32:32 F0, 31:31 C } PMZR_EL0;

// Tag Check Override
__register 64 { 25:25 TCO } TCO;

// Counter Identification Register
__register 32 { 3:0 CNTSC } CNTID;

// Architectural Feature Access Control Register
__register 32 { 31:31 TCPAC, 30:30 TAM, 29:29 E0POE, 28:28 TTA, 25:24 SMEN, 21:20 FPEN, 17:16 ZEN } CPACR_EL1;

// External Debug Virtual Context Sample Register
__register 32 { 31:31 NS, 30:30 E2, 29:29 E3, 28:28 HV, 31:0 CONTEXTIDR_EL2, 15:8, 7:0 VMID } EDVIDSR;

// Alternate MECID for EL2&0 translation regimes.
__register 64 { 15:0 MECID } MECID_A1_EL2;

// Floating-point Control Register
__register 32 { 26:26 AHP, 25:25 DN, 24:24 FZ, 23:22 RMode, 21:20 Stride, 19:19 FZ16, 18:16 Len, 15:15 IDE, 13:13 EBF, 12:12 IXE, 11:11 UFE, 10:10 OFE, 9:9 DZE, 8:8 IOE, 2:2 NEP, 1:1 AH, 0:0 FIZ } FPCR;

// Device Configuration Register
__register 32 {  } TRBDEVID;

// Peripheral Identification Register 2
__register 32 { 7:4 REVISION, 3:3 JEDEC, 2:0 DES_1 } TRBPIDR2;

// Interrupt Set-Active Registers (extended SPI range)
array [0..31] of __register 32 {  } GICD_ISACTIVERE;

// MPAM Error MSI Write MPAM Information Register
__register 32 { 23:16 PMG, 15:0 PARTID } MPAMF_ERR_MSI_MPAM;

// Debug Saved Program Status Register
__register 32 { 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 15:10 IT, 24:24 DIT, 23:23 SSBS, 22:22 PAN, 21:21 SS, 20:20 IL, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 5:5 T, 4:0 M } DSPSR;

// Hyp Translation Control Register
__register 32 { 28:28 HWU62, 27:27 HWU61, 26:26 HWU60, 25:25 HWU59, 24:24 HPD, 13:12 SH0, 11:10 ORGN0, 9:8 IRGN0, 2:0 T0SZ } HTCR;

// Performance Monitors Event Counter Selection Register
__register 32 { 4:0 SEL } PMSELR_EL0;

// Instrumentation Trace Control Register (EL1)
__register 64 { 1:1 E1E, 0:0 E0E } TRCITECR_EL1;

// System Control Masking Register (EL2)
__register 64 { 63:63 TIDCP, 62:62 SPINTMASK, 61:61 NMI, 60:60 EnTP2, 59:59 TCSO, 58:58 TCSO0, 57:57 EPAN, 56:56 EnALS, 55:55 EnAS0, 54:54 EnASR, 46:46 TWEDEL, 45:45 TWEDEn, 44:44 DSSBS, 43:43 ATA, 42:42 ATA0, 40:40 TCF, 38:38 TCF0, 37:37 ITFSB, 36:36 BT, 35:35 BT0, 34:34 EnFPM, 33:33 MSCEn, 32:32 CMOW, 31:31 EnIA, 30:30 EnIB, 29:29 LSMAOE, 28:28 nTLSMD, 27:27 EnDA, 26:26 UCI, 25:25 EE, 24:24 E0E, 23:23 SPAN, 22:22 EIS, 21:21 IESB, 20:20 TSCXT, 19:19 WXN, 18:18 nTWE, 16:16 nTWI, 15:15 UCT, 14:14 DZE, 13:13 EnDB, 12:12 I, 11:11 EOS, 10:10 EnRCTX, 8:8 SED, 7:7 ITD, 6:6 nAA, 5:5 CP15BEN, 4:4 SA0, 3:3 SA, 2:2 C, 1:1 A, 0:0 M } SCTLRMASK_EL2;

// Random Allocation Tag Seed Register.
__register 32 { 55:8 SEED, 3:0 TAG } RGSR_EL1;

// ITS Translate Event Register
__register 32 { 31:0 EVENT_ID } ITS_TRANSLATER;

// Monitor Vector Base Address Register
__register 32 { 31:5 VBA, 4:0 Reserved } MVBAR;

// Counter-timer Secure Virtual Timer TimerValue Register (EL2)
__register 32 { 31:0 TimerValue } CNTHVS_TVAL_EL2;

// Performance Monitors Component Identification Register 2
__register 32 { 7:0 PRMBL_2 } PMCIDR2;

// CTI Application Pulse register
__register 32 {  } CTIAPPPULSE;

// MPAM Monitor Overflow MSI Write Attributes Register
__register 32 { 29:28 MSI_SH, 27:24 MSI_MEMATTR, 0:0 MSIEN } MSMON_OFLOW_MSI_ATTR;

// External Debug Exception Catch Control Register
__register 32 { 22:22 RLR2, 21:21 RLR1, 20:20 RLR0, 18:18 RLE2, 17:17 RLE1, 16:16 RLE0, 15:15 NSR3, 14:14 NSR2, 13:13 NSR1, 12:12 NSR0, 11:11 SR3, 10:10 SR2, 9:9 SR1, 8:8 SR0, 7:7 NSE3, 6:6 NSE2, 5:5 NSE1, 4:4 NSE0, 3:3 SE3, 2:2 SE2, 1:1 SE1, 0:0 SE0 } EDECCR;

// Trace Device Configuration Register 2
__register 32 {  } TRCDEVID2;

// Component Identification Register 2
__register 32 { 7:0 PRMBL_2 } TRBCIDR2;

// MPAM Virtual PARTID Mapping Register 2
__register 64 { 63:48 PhyPARTID11, 47:32 PhyPARTID10, 31:16 PhyPARTID9, 15:0 PhyPARTID8 } MPAMVPM2_EL2;

// Interrupt Controller Virtual Interrupt Group 0 Enable Register
__register 32 { 0:0 Enable } ICV_IGRPEN0_EL1;

// Tag Fault Status Register (EL3)
__register 64 { 0:0 TF0 } TFSR_EL3;

// Peripheral Identification Register 1
__register 32 { 7:4 DES_0, 3:0 PART_1 } TRBPIDR1;

// Performance Monitors Lock Access Register
__register 32 { 31:0 KEY } PMLAR;

// MPAM Hypervisor Control Register (EL2)
__register 64 { 58:58 nTIDR, 50:50 nTRAPMPAMSM, 49:49 nTRAPMPAM0EL1, 48:48 nTRAPMPAM1EL1, 31:31 TRAP_MPAMIDR_EL1, 8:8 GSTAPP_PLK, 1:1 EL1_VPMEN, 0:0 EL0_VPMEN } MPAMHCR_EL2;

// Trace Sequencer Reset Control Register
__register 64 { 7:7 RST_TYPE, 4:0 RST_SEL } TRCSEQRSTEVR;

// List Registers
array [0..15] of __register 32 { 31:31 HW, 30:30 Group, 29:28 State, 27:23 Priority, 19:10 pINTID, 9:0 vINTID } GICH_LR;

// Performance Monitors Overflow Flag Status Set Register
__register 32 { 32:32 F0, 31:31 C } PMOVSSET_EL0;

// AArch64 Processor Feature Register 1
__register 64 { 63:60 PFAR, 59:56 DF2, 55:52 MTEX, 51:48 THE, 47:44 GCS, 43:40 MTE_frac, 39:36 NMI, 35:32 CSV2_frac, 31:28 RNDR_trap, 27:24 SME, 19:16 MPAM_frac, 15:12 RAS_frac, 11:8 MTE, 7:4 SSBS, 3:0 BT } ID_AA64PFR1_EL1;

// Redistributor LPI Pending Table Base Address Register
__register 64 { 62:62 PTZ, 58:56 OuterCache, 51:16 Physical_Address, 11:10 Shareability, 9:7 InnerCache } GICR_PENDBASER;

// Counter-timer Virtual Timer CompareValue register (EL2)
__register 64 { 63:0 CompareValue } CNTHV_CVAL;

// Selected Error Record Control Register
__register 32 { 31:0 ERRnCTLRlo } ERXCTLR;

// Redistributor virtual SGI pending state register
__register 32 { 31:31 Busy, 15:0 Pending } GICR_VSGIPENDR;

// System Performance Monitors Access Register (EL2)
__register 64 {  } SPMACCESSR_EL2;

// Interrupt Controller Physical PPI Priority Registers
array [0..15] of __register 64 { 60:56 PRIORITY7, 52:48 PRIORITY6, 44:40 PRIORITY5, 36:32 PRIORITY4, 28:24 PRIORITY3, 20:16 PRIORITY2, 12:8 PRIORITY1, 4:0 PRIORITY0 } ICC_PPI_PRIORITYR_EL1;

// MPAM Ingress PARTID Translation Configuration Register
__register 32 { 31:31 ENABLE, 15:0 PARTID_TL } MPAMCFG_IN_TL;

// AArch32 Processor Feature Register 1
__register 32 { 31:28 GIC, 27:24 Virt_frac, 23:20 Sec_frac, 19:16 GenTimer, 15:12 Virtualization, 11:8 MProgMod, 7:4 Security, 3:0 ProgMod } ID_PFR1_EL1;

// MPAM Control Register (EL3)
__register 64 { 63:63 MPAMEN, 62:62 nTRAPLOWER, 52:52 EN_ALT_IPMG, 51:51 EN_ALT_IPARTID } MPAMCTL_EL3;

// Activity Monitors Peripheral Identification Register 3
__register 32 { 7:4 REVAND, 3:0 CMOD } AMPIDR3;

// Activity Monitors Device Architecture Register
__register 32 { 31:21 ARCHITECT, 20:20 PRESENT, 19:16 REVISION, 15:0 ARCHID } AMDEVARCH;

// Granule Protection Check Bypass Window Register (EL3)
__register 64 { 39:37 BWSIZE, 36:32 BWSTRIDE, 25:0 BWADDR } GPCBW_EL3;

// Extended Auxiliary Memory Attribute Indirection Register (EL2)
__register 64 {  } AMAIR2_EL2;

// Nested Virtual Hypervisor Configuration Register
__register 64 { 60:60 TWEDEL, 59:59 TWEDEn, 58:58 TID5, 57:57 DCT, 56:56 ATA, 55:55 TTLBOS, 54:54 TTLBIS, 53:53 EnSCXT, 52:52 TOCU, 51:51 AMVOFFEN, 50:50 TICAB, 49:49 TID4, 48:48 GPF, 47:47 FIEN, 46:46 FWB, 45:45 NV2, 44:44 AT, 43:43 NV1, 42:42 NV, 41:41 API, 40:40 APK, 37:37 TEA, 36:36 TERR, 35:35 TLOR, 34:34 E2H, 33:33 ID, 32:32 CD, 31:31 RW, 30:30 TRVM, 29:29 HCD, 28:28 TDZ, 27:27 TGE, 26:26 TVM, 25:25 TTLB, 24:24 TPU, 23:23 TPCP, 22:22 TSW, 21:21 TACR, 20:20 TIDCP, 19:19 TSC, 18:18 TID3, 17:17 TID2, 16:16 TID1, 15:15 TID0, 14:14 TWE, 13:13 TWI, 12:12 DC, 10:10 BSU, 9:9 FB, 8:8 VSE, 7:7 VI, 6:6 VF, 5:5 AMO, 4:4 IMO, 3:3 FMO, 2:2 PTW, 1:1 SWIO, 0:0 VM } NVHCR_EL2;

// Sampling Filter Control Register
__register 64 { 52:48 TYPEm, 20:16 TYPE, 4:4 FDS, 3:3 FnE, 2:2 FL, 1:1 FT, 0:0 FE } PMSFCR_EL1;

// ITS Translate Event in Realm ITS Domain Register
__register 32 { 31:0 EVENT_ID } ITS_RL_TRANSLATER;

// Virtual Machine Control Register
__register 32 { 9:9 EOImode, 4:4 CBPR, 3:3 FIQEn, 2:2 AckCtl, 1:1 EnableGrp1, 0:0 EnableGrp0 } GICV_CTLR;

// IRS Control Register 1
__register 32 { 15:15 VPED_WA, 14:14 VPED_RA, 13:13 VMD_WA, 12:12 VMD_RA, 11:11 VPET_WA, 10:10 VPET_RA, 9:9 VMT_WA, 8:8 VMT_RA, 7:7 IST_WA, 6:6 IST_RA, 5:4 IC, 3:2 OC, 1:0 SH } IRS_CR1;

// Counter-timer Secure Virtual Timer Control Register (EL2)
__register 32 { 2:2 ISTATUS, 1:1 IMASK, 0:0 ENABLE } CNTHVS_CTL;

// Trace Sequencer State Register
__register 32 { 1:0 STATE } TRCSEQSTR;

// Performance Monitors Peripheral Identification Register 3
__register 32 { 7:4 REVAND, 3:0 CMOD } PMPIDR3;

// CONTEXTIDR_EL1 Sample Register
__register 32 { 31:0 CONTEXTIDR_EL1 } PMCID1SR;

// Interrupt Controller Virtual Interrupt Group 0 Enable register
__register 32 { 0:0 Enable } ICV_IGRPEN0;

// Trace ViewInst Start/Stop PE Comparator Control Register
__register 32 {  } TRCVIPCSSCTLR;

// External Debug Device Affinity register 0
__register 32 { 30:30 U, 24:24 MT, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } EDDEVAFF0;

// Monitor DCC Status Register
__register 32 { 30:30 RXfull, 29:29 TXfull } MDCCSR_EL0;

// IRS SPI Interrupt Domain Configuration Register
__register 32 { 1:0 DOMAIN } IRS_SPI_DOMAINR;

// Selected Pseudo-fault Generation Feature Register
__register 64 { 63:0 ERRnPFGF } ERXPFGF_EL1;

// Interrupt Controller Virtual Highest Priority Pending Interrupt Register
__register 64 { 32:32 HPPIV, 31:29 TYPE, 23:0 ID } ICV_HPPIR_EL1;

// TLB Type Register
__register 32 { 0:0 nU } TLBTR;

// Counter-timer Virtual Timer CompareValue Register
__register 64 { 63:0 CompareValue } CNTV_CVAL_EL0;

// ITS MEC MECID Register for the Realm PAS
__register 32 { 15:0 MECID } ITS_MEC_MECID_R;

// Error Record <n> Miscellaneous Register 3
array [0..65534] of __register 64 { 63:0 TS } ERRMISC3;

// Trace ID Register 5
__register 32 { 31:31 OE, 30:28 NUMCNTR, 27:25 NUMSEQSTATE, 23:23 LPOVERRIDE, 22:22 ATBTRIG, 21:16 TRACEIDSIZE, 11:9 NUMEXTINSEL, 8:0 NUMEXTIN } TRCIDR5;

//  Permission Indirection Register 3 (EL3)
__register 64 {  } PIR_EL3;

// IRS MPAMv2 PMG register.
__register 32 { 15:0 PMG } IRS_MPAM_PMGR;

// MPAM Monitor Cache Storage Allocation Root Control Register
__register 32 { 2:0 PAS } MSMON_CSA_ROOTCR;

// Interrupt Controller Physical Control Register (EL3)
__register 64 { 33:32 PID, 2:2 LINK_IDLE, 1:1 LINK, 0:0 EN } ICC_CR0_EL3;

// Set Non-secure SPI Pending Register
__register 32 { 12:0 INTID } GICM_SETSPI_NSR;

// Clear Non-secure SPI Pending Register
__register 32 { 12:0 INTID } GICD_CLRSPI_NSR;

// Interrupt Priority Registers
array [0..7] of __register 32 { 31:24 Priority_offset_3B, 23:16 Priority_offset_2B, 15:8 Priority_offset_1B, 7:0 Priority_offset_0B } GICR_IPRIORITYR;

// Interrupt Controller Alias Software Generated Interrupt Group 1 Register
__register 64 { 55:48 Aff3, 47:44 RS, 40:40 IRM, 39:32 Aff2, 27:24 INTID, 23:16 Aff1, 15:0 TargetList } ICC_ASGI1R_EL1;

// Set PARTID and PMG Register
__register 32 { 23:16 PMG, 15:0 PARTID } GITS_PARTIDR;

// Translation Table Base Register 0 (EL1)
__register 128 { 47:1, 47:5 BADDR, 63:48 ASID, 2:1 SKL, 0:0 CnP } TTBR0_EL1;

// Counter-timer Virtual Timer CompareValue
__register 64 { 63:0 CompareValue } CNTV_CVAL;

// IWB Wire Trigger Mode Register
array [0..2047] of __register 32 {  } IWB_WTMR;

// Activity Monitors Count Enable Clear Register 1
__register 32 {  } AMCNTENCLR1;

// SVE Feature ID Register 0
__register 64 { 59:56 F64MM, 55:52 F32MM, 51:48 F16MM, 47:44 I8MM, 43:40 SM4, 35:32 SHA3, 27:24 B16B16, 23:20 BF16, 19:16 BitPerm, 15:12 EltPerm, 7:4 AES, 3:0 SVEver } ID_AA64ZFR0_EL1;

// Interrupt Controller Virtual Running Priority Register
__register 32 { 7:0 Priority } ICV_RPR;

// TCM Type Register
__register 32 {  } TCMTR;

// Hyp Auxiliary Data Fault Status Register
__register 32 {  } HADFSR;

// Debug OS Lock Access Register
__register 32 { 31:0 OSLA } DBGOSLAR;

// CPU Interface Non-secure Active Priorities Registers
array [0..3] of __register 32 {  } GICC_NSAPR;

// OS Lock Data Transfer Register, Transmit
__register 32 { 31:0 DTRTX } OSDTRTX_EL1;

// Current Cache Size ID Register
__register 32 { 12:3 Associativity, 2:0 LineSize, 27:13 NumSets } CCSIDR;

// Counter-timer Secure Physical Timer TimerValue Register (EL2)
__register 32 { 31:0 TimerValue } CNTHPS_TVAL;

// AArch32 Debug Feature Register 1
__register 64 { 7:4 HPMN0, 3:0 MTPMU } ID_DFR1_EL1;

// Auxiliary ID Register
__register 32 {  } AIDR;

// IWB Architecture Identification Register
__register 32 { 11:8 Component, 7:4 ArchMajorRev, 3:0 ArchMinorRev } IWB_AIDR;

// Virtual SError Exception Syndrome Register (EL3)
__register 64 { 24:24 IDS, 23:0 ISS } VSESR_EL3;

// Activity Monitors Count Enable Clear Register 0
__register 64 {  } AMCNTENCLR0_EL0;

// Virtual Machine Running Priority Register
__register 32 { 7:0 Priority } GICV_RPR;

// Virtual Deferred Interrupt Status Register
__register 32 { 31:31 A, 15:14 AET, 12:12 ExT, 3:0 FS, 9:9 LPAE, 5:0 STATUS } VDISR;

// Selected Error Record Miscellaneous Register 0
__register 64 { 63:0 ERRnMISC0 } ERXMISC0_EL1;

// Device Configuration Register 2
__register 32 {  } TRBDEVID2;

// Virtual Deferred Interrupt Status Register (EL2)
__register 64 { 31:31 A, 24:24 IDS, 23:0 ISS, 15:14 AET, 12:12 ExT, 3:0 FS, 9:9 LPAE, 5:0 STATUS } VDISR_EL2;

// Selected Error Record Primary Status Register
__register 64 { 63:0 ERRnSTATUS } ERXSTATUS_EL1;

// Permission Indirection Register 0 (EL1)
__register 64 {  } PIRE0_EL1;

// Device Affinity Register
__register 64 { 39:32 Aff3, 31:31 F0V, 30:30 U, 24:24 MT, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } ERRDEVAFF;

// System Performance Monitors Interrupt Enable Clear Register
__register 64 {  } SPMINTENCLR_EL1;

// AArch64 Memory Model Feature Register 3
__register 64 { 63:60 Spec_FPACC, 59:56 ADERR, 55:52 SDERR, 47:44 ANERR, 43:40 SNERR, 39:36 D128_2, 35:32 D128, 31:28 MEC, 27:24 AIE, 23:20 S2POE, 19:16 S1POE, 15:12 S2PIE, 11:8 S1PIE, 7:4 SCTLRX, 3:0 TCRX } ID_AA64MMFR3_EL1;

// MPAM PMG Translation Ingress Identification Register
__register 32 { 31:31 DIRECT, 30:30 BASE_MASK, 15:0 PMGTL_MAX } MPAMF_PMG_IN_TL_IDR;

// System Performance Monitors Select Register
__register 64 { 9:4 SYSPMUSEL, 1:0 BANK } SPMSELR_EL0;

// MPAM Priority Partition Configuration Register
__register 32 { 31:16 DSPRI, 15:0 INTPRI } MPAMCFG_PRI;

// Extended System Control Masking Register (EL1)
__register 64 { 26:26 TLBOSNIS, 25:25 FDIT, 24:24 BTD, 23:23 BTD0, 22:22 EnIA2, 21:21 EnIB2, 20:20 EnDA2, 19:19 EnDB2, 12:12 CPTM0, 11:11 CPTM, 10:10 CPTA0, 9:9 CPTA, 8:8 EnPACM0, 7:7 EnPACM, 6:6 EnIDCP128, 5:5 EASE, 4:4 EnANERR, 3:3 EnADERR, 2:2 NMEA } SCTLR2MASK_EL1;

// Fault Address Register (EL1)
__register 64 { 63:0 VA } FAR_EL1;

// GIC PMU Event Type Select Register
array [0..63] of __register 64 { 31:31 V, 30:30 FS, 29:29 FSPAN, 28:28 RL, 27:27 EL3, 26:26 NS, 25:25 S, 15:12 PMEVTYPE, 11:0 PMEVTID } GIC_PMEVTYPER;

// Performance Monitors Peripheral Identification Register 2
__register 32 { 7:4 REVISION, 3:3 JEDEC, 2:0 DES_1 } PMPIDR2;

// Trace Buffer ID Register
__register 64 { 47:32 MaxBuffSize, 19:16 MPAM2, 15:12 MPAM, 11:8 EA, 7:6 AddrMode, 5:5 F, 4:4 P, 3:0 Align } TRBIDR_EL1;

// Counter-timer Secure Virtual Timer CompareValue Register (EL2)
__register 64 { 63:0 CompareValue } CNTHVS_CVAL_EL2;

// Interrupt Controller EL1 Virtual Control Register
__register 64 { 2:2 LINK_IDLE, 1:1 LINK, 0:0 EN } ICV_CR0_EL1;

// Virtual SError Exception Syndrome Register
__register 32 { 15:14 AET, 12:12 ExT } VDFSR;

// Hypervisor Activity Monitors Fine-Grained Read Trap Register
__register 64 { 49:49 AMEVTYPER115_EL0, 48:48 AMEVCNTR115_EL0, 47:47 AMEVTYPER114_EL0, 46:46 AMEVCNTR114_EL0, 45:45 AMEVTYPER113_EL0, 44:44 AMEVCNTR113_EL0, 43:43 AMEVTYPER112_EL0, 42:42 AMEVCNTR112_EL0, 41:41 AMEVTYPER111_EL0, 40:40 AMEVCNTR111_EL0, 39:39 AMEVTYPER110_EL0, 38:38 AMEVCNTR110_EL0, 37:37 AMEVTYPER19_EL0, 36:36 AMEVCNTR19_EL0, 35:35 AMEVTYPER18_EL0, 34:34 AMEVCNTR18_EL0, 33:33 AMEVTYPER17_EL0, 32:32 AMEVCNTR17_EL0, 31:31 AMEVTYPER16_EL0, 30:30 AMEVCNTR16_EL0, 29:29 AMEVTYPER15_EL0, 28:28 AMEVCNTR15_EL0, 27:27 AMEVTYPER14_EL0, 26:26 AMEVCNTR14_EL0, 25:25 AMEVTYPER13_EL0, 24:24 AMEVCNTR13_EL0, 23:23 AMEVTYPER12_EL0, 22:22 AMEVCNTR12_EL0, 21:21 AMEVTYPER11_EL0, 20:20 AMEVCNTR11_EL0, 19:19 AMEVTYPER10_EL0, 18:18 AMEVCNTR10_EL0, 17:17 AMCNTEN1, 0:0 AMCNTEN0 } HAFGRTR_EL2;

// Exception Link Register (EL2)
__register 64 { 63:0 ADDR } ELR_EL2;

// Interrupt Controller Deactivate Virtual Interrupt Register
__register 32 { 23:0 INTID } ICV_DIR;

// MPAM Error MSI High-part Address Register
__register 32 { 19:0 MSI_ADDR_H } MPAMF_ERR_MSI_ADDR_H;

// ITS Status Register
__register 32 { 0:0 IDLE } ITS_STATUSR;

// Activity Monitors Event Type Registers 1
array [0..15] of __register 64 { 15:0 evtCount } AMEVTYPER1_EL0;

// IRS Identification Register 7
__register 32 { 23:0 SPI_BASE } IRS_IDR7;

// Interrupt Controller Hyp System Register Enable register
__register 32 { 3:3 Enable, 2:2 DIB, 1:1 DFB, 0:0 SRE } ICC_HSRE;

// Interrupt Set-Active Register 0
__register 32 {  } GICR_ISACTIVER0;

// Jazelle ID Register
__register 32 {  } JIDR;

// ITS Synchronize Interrupt Events Status Register
__register 32 { 0:0 IDLE } ITS_SYNC_STATUSR;

// Activity Monitors Control Register
__register 64 { 17:17 CG1RZ, 10:10 HDBG } AMCR_EL0;

// Non-secure Access Control Registers
array [0..63] of __register 32 {  } GICD_NSACR;

// Performance Monitors Machine Identification Register
__register 64 { 28:28 SME, 27:24 EDGE, 23:20 THWIDTH, 19:16 BUS_WIDTH, 15:8 BUS_SLOTS, 7:0 SLOTS } PMMIR_EL1;

// Branch Record Buffer Information Injection Register
__register 64 { 46:46 CCU, 45:32 CC, 13:8 TYPE, 7:6 EL, 5:5 MPRED, 1:0 VALID } BRBINFINJ_EL1;

// Floating-Point Status and Control Register
__register 32 { 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 QC, 26:26 AHP, 25:25 DN, 24:24 FZ, 23:22 RMode, 21:20 Stride, 19:19 FZ16, 18:16 Len, 15:15 IDE, 12:12 IXE, 11:11 UFE, 10:10 OFE, 9:9 DZE, 8:8 IOE, 7:7 IDC, 4:4 IXC, 3:3 UFC, 2:2 OFC, 1:1 DZC, 0:0 IOC } FPSCR;

// Selected Error Record Miscellaneous Register 4
__register 32 { 31:0 ERRnMISC2lo } ERXMISC4;

// EL3 Read/Write Software Context Number
__register 64 { 63:0 SCXTNUM } SCXTNUM_EL3;

// Floating-Point System ID register
__register 32 { 31:24 Implementer, 23:23 SW, 22:16 Subarchitecture, 15:8 PartNum, 7:4 Variant, 3:0 Revision } FPSID;

// External Debug Peripheral Identification Register 2
__register 32 { 7:4 REVISION, 3:3 JEDEC, 2:0 DES_1 } EDPIDR2;

// Interrupt Controller Maintenance Interrupt State Register
__register 32 { 7:7 VGrp1D, 6:6 VGrp1E, 5:5 VGrp0D, 4:4 VGrp0E, 3:3 NP, 2:2 LRENP, 1:1 U, 0:0 EOI } ICH_MISR_EL2;

// Activity Monitors Device Affinity Register 1
__register 32 { 7:0 Aff3 } AMDEVAFF1;

// Trace Configuration Register
__register 64 { 18:18 ITO, 15:15 VMIDOPT, 14:13 QE, 12:12 RS, 11:11 TS, 7:7 VMID, 6:6 CID, 4:4 CCI, 3:3 BB } TRCCONFIGR;

// Trace Stall Control Register
__register 32 { 13:13 NOOVERFLOW, 8:8 ISTALL, 3:0 LEVEL } TRCSTALLCTLR;

// MPAM1 Register (EL1)
__register 64 { 63:48 altPMG, 47:32 PMG, 31:16 altPARTID, 15:0 PARTID, 63:63 MPAMEN, 60:60 FORCED_NS, 54:54 ALTSP_FRCD, 47:40 PMG_D, 39:32 PMG_I, 31:16 PARTID_D, 15:0 PARTID_I } MPAM1_EL1;

// Auxiliary ID Register
__register 32 {  } AIDR_EL1;

// Peripheral Identification Register 7
__register 32 {  } TRBPIDR7;

// Interrupt Controller Active Virtual Priorities Register
__register 64 {  } ICH_APR_EL2;

// Trace ID Register 6
__register 64 { 2:2 EXLEVEL_RL_EL2, 1:1 EXLEVEL_RL_EL1, 0:0 EXLEVEL_RL_EL0 } TRCIDR6;

// Interrupt Controller Virtual CPU interface Control Register
__register 64 { 1:1 V3, 0:0 EN } ICH_VCTLR_EL2;

// Secure Configuration Register
__register 32 { 15:15 TERR, 13:13 TWE, 12:12 TWI, 9:9 SIF, 8:8 HCE, 7:7 SCD, 6:6 nET, 5:5 AW, 4:4 FW, 3:3 EA, 2:2 FIQ, 1:1 IRQ, 0:0 NS } SCR;

// Interrupt Controller Hyp Active Priorities Group 0 Registers
array [0..3] of __register 32 {  } ICH_AP0R;

// IWB Wire Enable Status Register for an Interrupt Domain
__register 32 { 0:0 IDLE } IWB_WENABLE_STATUSR;

// Hyp Debug Control Register
__register 32 { 29:29 HPMFZO, 28:28 MTPME, 27:27 TDCC, 26:26 HLP, 23:23 HCCD, 19:19 TTRF, 17:17 HPMD, 11:11 TDRA, 10:10 TDOSA, 9:9 TDA, 8:8 TDE, 7:7 HPME, 6:6 TPM, 5:5 TPMCR, 4:0 HPMN } HDCR;

// CTI Component Identification Register 1
__register 32 { 7:4 CLASS, 3:0 PRMBL_1 } CTICIDR1;

// Permission Indirection Register 1 (EL1)
__register 64 {  } PIR_EL1;

// Trace Device Affinity Register
__register 64 { 39:32 Aff3, 30:30 U, 24:24 MT, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } TRCDEVAFF;

// Interrupt Set-Active Registers
array [0..31] of __register 32 {  } GICD_ISACTIVER;

// Trace ID Register 12
__register 64 { 31:0 NUMCONDKEY } TRCIDR12;

// IWB Wire Assignment Status Register for an Interrupt Domain
__register 32 { 0:0 IDLE } IWB_WDOMAIN_STATUSR;

// Extended Auxiliary Memory Attribute Indirection Register (EL3)
__register 64 {  } AMAIR2_EL3;

// ITS Control Register
__register 32 { 31:31 Quiescent, 8:8 UMSIirq, 7:4 ITS_Number, 1:1 ImDe, 0:0 Enabled } GITS_CTLR;

// MPAM PE-side Bandwidth Controls ID Register
__register 64 { 63:63 HAS_HW_SCALE, 31:30 MAX_LIM, 5:0 BWA_WD } MPAMBWIDR_EL1;

// IRS VM Status Register
__register 32 { 1:1 V, 0:0 IDLE } IRS_VM_STATUSR;

// MPAM Features Secure Identification Register
__register 32 { 23:16 S_PMG_MAX, 15:0 S_PARTID_MAX } MPAMF_SIDR;

// Streaming Vector Control Register
__register 64 { 1:1 ZA, 0:0 SM } SVCR;

// Counter-timer Virtual Timer TimerValue Register (EL2)
__register 32 { 31:0 TimerValue } CNTHV_TVAL_EL2;

// Interrupt Controller VGIC Type Register
__register 32 { 31:29 PRIbits, 28:26 PREbits, 25:23 IDbits, 22:22 SEIS, 21:21 A3V, 20:20 nV4, 19:19 TDS, 18:18 DVIM, 4:0 ListRegs } ICH_VTR_EL2;

// MPAM Internal PARTID Narrowing Configuration Register
__register 32 { 16:16 INTERNAL, 15:0 INTPARTID } MPAMCFG_INTPARTID;

// Auxiliary Memory Attribute Indirection Register 1
__register 32 {  } AMAIR1;

// Interrupt Controller Interrupt Acknowledge Register 1
__register 32 { 23:0 INTID } ICC_IAR1_EL1;

// Activity Monitors Count Enable Clear Register
__register 64 {  } AMCNTENCLR;

// SGI Set-Pending Registers
array [0..3] of __register 32 {  } GICD_SPENDSGIR;

// Error Recovery Interrupt Configuration Register 2
__register 32 { 7:7 IRQEN, 6:6 NSMSI, 5:4 SH, 3:0 MemAttr } ERRERICR2;

// Debug Data Transfer Register, Transmit
__register 32 { 31:0 DTRTX } DBGDTRTX_EL0;

// CTI Application Trigger Clear register
__register 32 {  } CTIAPPCLEAR;

// Hyp Instruction Fault Address Register
__register 32 { 31:0 VA } HIFAR;

// Counter-timer Virtual Offset Register
__register 64 { 63:0 VOffset } CNTVOFF_EL2;

// AArch64 Processor Feature Register 2
__register 64 { 35:32 FPMR, 31:28 MPAM2, 23:20 MTEEIRG, 19:16 UINJ, 15:12 GCIE, 11:8 MTEFAR, 7:4 MTESTOREONLY, 3:0 MTEPERM } ID_AA64PFR2_EL1;

// Interrupt Set-Active Registers
array [1..2] of __register 32 {  } GICR_ISACTIVERE;

// Virtual Deferred Interrupt Status Register (EL3)
__register 64 { 31:31 A, 24:24 IDS, 23:0 ISS } VDISR_EL3;

// Sampling Inverted Event Filter Register
__register 64 { 63:63, 62:62, 61:61, 60:60, 59:59, 58:58, 57:57, 56:56, 55:55, 54:54, 53:53, 52:52, 51:51, 50:50, 49:49, 48:48, 31:31, 30:30, 29:29, 28:28, 27:27, 26:26, 25:25, 25:25, 24:24, 24:24, 23:23, 22:22, 21:21, 20:20, 19:19, 18:18, 17:17, 15:15, 14:14, 13:13, 12:12, 11:11, 10:10, 9:9, 8:8, 7:7, 6:6, 5:5, 4:4, 3:3, 2:2, 1:1 E } PMSNEVFR_EL1;

// CTI Authentication Status register
__register 32 { 3:2 NSNID, 1:0 NSID } CTIAUTHSTATUS;

// ITS MPAMv2 PMG register.
__register 32 { 15:0 PMG } ITS_MPAM_PMGR;

// Interrupt Controller Virtual PPI Clear Enable Registers
array [0..1] of __register 64 {  } ICV_PPI_ENABLER_EL1;

// IRS IST Base Address Register
__register 64 { 55:6 ADDR, 0:0 VALID } IRS_IST_BASER;

// Redistributor Invalidate LPI Register
__register 64 { 63:63 V, 47:32 vPEID, 31:0 INTID } GICR_INVLPIR;

// Activity Monitors Device Affinity Register
__register 64 { 39:32 Aff3, 30:30 U, 24:24 MT, 23:16 Aff2, 15:8 Aff1, 7:0 Aff0 } AMDEVAFF;

// Translation Control Register (EL3)
__register 32 { 43:43 DisCH0, 42:42 HAFT, 41:41 PTTWI, 38:38 D128, 37:37 AIE, 36:36 POE, 35:35 PIE, 34:34 PnCH, 33:33 MTX, 32:32 DS, 30:30 TCMA, 29:29 TBID, 28:28 HWU62, 27:27 HWU61, 26:26 HWU60, 25:25 HWU59, 24:24 HPD, 22:22 HD, 21:21 HA, 20:20 TBI, 18:16 PS, 15:14 TG0, 13:12 SH0, 11:10 ORGN0, 9:8 IRGN0, 5:0 T0SZ } TCR_EL3;

// Component Identification Register 1
__register 32 { 7:4 CLASS, 3:0 PRMBL_1 } TRBCIDR1;

// Lock Access Register
__register 32 {  } TRBLAR;

// MPAM3 Register (EL3)
__register 64 { 63:48 altPMG, 47:32 PMG, 31:16 altPARTID, 15:0 PARTID, 63:63 MPAMEN, 62:62 TRAPLOWER, 61:61 SDEFLT, 60:60 FORCE_NS, 57:57 ALTSP_HEN, 56:56 ALTSP_HFC, 55:55 ALTSP_EL3, 52:52 RT_ALTSP_NS, 47:40 PMG_D, 39:32 PMG_I, 31:16 PARTID_D, 15:0 PARTID_I } MPAM3_EL3;

// ITS Translation Register
__register 32 { 31:0 EventID } GITS_TRANSLATER;

// System Performance Monitors Event Type Register
array [0..63] of __register 64 {  } SPMEVTYPER_EL0;

// Trace Peripheral Identification Register 5
__register 32 {  } TRCPIDR5;

// Counter-timer Access Control Registers
array [0..7] of __register 32 { 5:5 RWPT, 4:4 RWVT, 3:3 RVOFF, 2:2 RFRQ, 1:1 RVCT, 0:0 RPCT } CNTACR;

// All Interrupt Mask Bit
__register 64 { 13:13 ALLINT } ALLINT;

// Interrupt Group Modifier Register 0
__register 32 {  } GICR_IGRPMODR0;

// Error Record <n> Miscellaneous Register 2
array [0..65534] of __register 64 {  } ERRMISC2;

// Interrupt Controller End Of Interrupt Register 0
__register 32 { 23:0 INTID } ICC_EOIR0_EL1;

// PL0 Read/Write Software Thread ID Register
__register 32 { 31:0 TID } TPIDRURW;

// ITS MEC Identification Register
__register 32 { 3:0 MECIDSIZE } ITS_MEC_IDR;

// Counter-timer Secure Physical Timer Control Register (EL2)
__register 32 { 2:2 ISTATUS, 1:1 IMASK, 0:0 ENABLE } CNTHPS_CTL_EL2;

// Selected Error Record Feature Register 2
__register 32 { 31:0 ERRnFRhi } ERXFR2;

// External Debug Component Identification Register 2
__register 32 { 7:0 PRMBL_2 } EDCIDR2;

// Interrupt Controller List Registers
array [0..15] of __register 32 { 31:0 vINTID } ICH_LR;

// Performance Monitors Count Enable register
__register 64 { 32:32 F0, 31:31 C } PMCNTEN;

// Sampling Profiling ID Register
__register 64 { 32:32 SME, 31:28 ALTCLK, 27:27 FPF, 26:26 EFT, 25:25 CRR, 24:24 PBT, 23:20 Format, 19:16 CountSize, 15:12 MaxSize, 11:8 Interval, 7:7 FDS, 6:6 FnE, 5:5 ERnd, 4:4 LDS, 3:3 ArchInst, 2:2 FL, 1:1 FT, 0:0 FE } PMSIDR_EL1;

// Exception Link Register (Hyp mode)
__register 32 { 31:0 ADDR } ELR_hyp;

// Extended Auxiliary Memory Attribute Indirection Register (EL1)
__register 64 {  } AMAIR2_EL1;

// Hypervisor Fine-Grained Read Trap Register
__register 64 { 63:63 nAMAIR2_EL1, 62:62 nMAIR2_EL1, 61:61 nS2POR_EL1, 60:60 nPOR_EL1, 59:59 nPOR_EL0, 58:58 nPIR_EL1, 57:57 nPIRE0_EL1, 56:56 nRCWMASK_EL1, 55:55 nTPIDR2_EL0, 54:54 nSMPRI_EL1, 53:53 nGCS_EL1, 52:52 nGCS_EL0, 50:50 nACCDATA_EL1, 49:49 ERXADDR_EL1, 48:48 ERXPFGCDN_EL1, 47:47 ERXPFGCTL_EL1, 46:46 ERXPFGF_EL1, 45:45 ERXMISCn_EL1, 44:44 ERXSTATUS_EL1, 43:43 ERXCTLR_EL1, 42:42 ERXFR_EL1, 41:41 ERRSELR_EL1, 40:40 ERRIDR_EL1, 39:39 ICC_IGRPENn_EL1, 38:38 VBAR_EL1, 37:37 TTBR1_EL1, 36:36 TTBR0_EL1, 35:35 TPIDR_EL0, 34:34 TPIDRRO_EL0, 33:33 TPIDR_EL1, 32:32 TCR_EL1, 31:31 SCXTNUM_EL0, 30:30 SCXTNUM_EL1, 29:29 SCTLR_EL1, 28:28 REVIDR_EL1, 27:27 PAR_EL1, 26:26 MPIDR_EL1, 25:25 MIDR_EL1, 24:24 MAIR_EL1, 23:23 LORSA_EL1, 22:22 LORN_EL1, 21:21 LORID_EL1, 20:20 LOREA_EL1, 19:19 LORC_EL1, 18:18 ISR_EL1, 17:17 FAR_EL1, 16:16 ESR_EL1, 15:15 DCZID_EL0, 14:14 CTR_EL0, 13:13 CSSELR_EL1, 12:12 CPACR_EL1, 11:11 CONTEXTIDR_EL1, 10:10 CLIDR_EL1, 9:9 CCSIDR_EL1, 8:8 APIBKey, 7:7 APIAKey, 6:6 APGAKey, 5:5 APDBKey, 4:4 APDAKey, 3:3 AMAIR_EL1, 2:2 AIDR_EL1, 1:1 AFSR1_EL1, 0:0 AFSR0_EL1 } HFGRTR_EL2;

// MPAM Virtual PARTID Mapping Register 5
__register 64 { 63:48 PhyPARTID23, 47:32 PhyPARTID22, 31:16 PhyPARTID21, 15:0 PhyPARTID20 } MPAMVPM5_EL2;

// ITS EventID Register
__register 32 { 31:0 EVENT_ID } ITS_EIDR;

// Translation Table Base Register 1 (EL2)
__register 128 { 47:1, 47:5 BADDR, 63:48 ASID, 2:1 SKL, 0:0 CnP } TTBR1_EL2;

// Activity Monitors User Enable Register
__register 64 { 0:0 EN } AMUSERENR_EL0;

// MPAM Streaming Mode Register
__register 64 { 47:32 PMG, 31:16 PARTID, 47:40 PMG_D, 31:16 PARTID_D } MPAMSM_EL1;

// Trace Device Type Register
__register 32 { 7:4 SUB, 3:0 MAJOR } TRCDEVTYPE;

// External Debug Program Counter Sample Register
__register 64 { 55:32 EDPCSRhi, 31:0 EDPCSRlo, 63:63 NS, 62:61 EL } EDPCSR;

// Primary MECID for EL2 and EL2&0 translation regimes
__register 64 { 15:0 MECID } MECID_P0_EL2;

// Interrupt Processor Targets Registers
array [0..254] of __register 32 { 31:24 CPU_targets_offset_3B, 23:16 CPU_targets_offset_2B, 15:8 CPU_targets_offset_1B, 7:0 CPU_targets_offset_0B } GICD_ITARGETSR;

// Debug Vector Catch Register
__register 32 { 31:31 NSF, 30:30 NSI, 28:28 NSD, 27:27 NSP, 26:26 NSS, 25:25 NSU, 7:7 SF, 6:6 SI, 4:4 SD, 3:3 SP, 2:2 SS, 1:1 SU, 7:7 F, 6:6 I, 4:4 D, 3:3 P, 2:2 S, 1:1 U } DBGVCR32_EL2;

// Context ID Register (EL2)
__register 32 { 31:0 PROCID } CONTEXTIDR_EL2;

// Performance Monitors Interrupt Enable Clear register
__register 32 { 31:31 C } PMINTENCLR;

// Branch Record Buffer Control Register (EL1)
__register 64 { 23:23 EXCEPTION, 22:22 ERTN, 9:9 FZPSS, 8:8 FZP, 6:5 TS, 4:4 MPRED, 3:3 CC, 1:1 E1BRE, 0:0 E0BRE } BRBCR_EL1;

// Activity Monitors Count Enable Clear Register 1
__register 64 {  } AMCNTENCLR1_EL0;

// Performance Monitors Common Event Identification Register 0
__register 64 {  } PMCEID0_EL0;

// Floating-Point Exception Control register
__register 32 { 31:31 EX, 30:30 EN, 29:29 DEX, 28:28 FP2V, 27:27 VV, 26:26 TFV, 10:8 VECITR, 7:7 IDF, 4:4 IXF, 3:3 UFF, 2:2 OFF, 1:1 DZF, 0:0 IOF } FPEXC;

// IRS SPI Configuration Register
__register 32 { 0:0 TM } IRS_SPI_CFGR;

// AArch32 Instruction Set Attribute Register 5
__register 32 { 31:28 VCMA, 27:24 RDM, 19:16 CRC32, 15:12 SHA2, 11:8 SHA1, 7:4 AES, 3:0 SEVL } ID_ISAR5_EL1;

// ITS Generate Incoming Event EventID Register
__register 32 { 31:0 EVENT_ID } ITS_GEN_EVENT_EIDR;

// Extended Memory Attribute Indirection Register (EL2)
__register 64 {  } MAIR2_EL2;

// ITS Generate Incoming Event Register
__register 32 { 31:31 R, 1:0 TARGET_DOMAIN } ITS_GEN_EVENTR;

// IRS Physical IST Management Status Register
__register 32 { 0:0 IDLE } IRS_IST_STATUSR;

// Interrupt Controller System Register Enable Register (EL1)
__register 32 { 2:2 DIB, 1:1 DFB, 0:0 SRE } ICC_SRE_EL1;

// Counter-timer Physical Timer CompareValue Register
__register 64 { 63:0 CompareValue } CNTP_CVAL_EL0;

// Performance Monitors Selected Event Count Register
__register 32 {  } PMXEVCNTR;

// Stack Pointer (EL2)
__register 64 { 63:0 StackPointer } SP_EL2;

// AArch64 Instruction Set Attribute Register 0
__register 64 { 63:60 RNDR, 59:56 TLB, 55:52 TS, 51:48 FHM, 47:44 DP, 43:40 SM4, 39:36 SM3, 35:32 SHA3, 31:28 RDM, 23:20 Atomic, 19:16 CRC32, 15:12 SHA2, 11:8 SHA1, 7:4 AES } ID_AA64ISAR0_EL1;

// Selected Error Record Group Status Register
__register 64 {  } ERXGSR_EL1;

// Interrupt Controller Virtual Interrupt Pending State Registers
array [0..1] of __register 64 {  } ICH_PPI_PENDR_EL2;

// Counter-timer Hypervisor Physical Timer Control Register
__register 32 { 2:2 ISTATUS, 1:1 IMASK, 0:0 ENABLE } CNTHP_CTL_EL2;

// Virtual TLBI Domain Outer Shareable Registers
array [0..3] of __register 64 {  } VTLBIDOS_EL2;

// Interrupt Controller Physical PPI Handling mode Registers
array [0..1] of __register 64 {  } ICC_PPI_HMR_EL1;

// Hyp System Control Register
__register 32 { 31:31 DSSBS, 30:30 TE, 25:25 EE, 19:19 WXN, 12:12 I, 8:8 SED, 7:7 ITD, 5:5 CP15BEN, 4:4 LSMAOE, 3:3 nTLSMD, 2:2 C, 1:1 A, 0:0 M } HSCTLR;

// IRS Map VM Register
__register 64 { 63:63 M, 62:62 U, 15:0 VM_ID } IRS_VMAP_VMR;

// Interrupt Group Registers (extended SPI range)
array [0..31] of __register 32 {  } GICD_IGROUPRE;

// MPAM Virtual PARTID Mapping Register 7
__register 64 { 63:48 PhyPARTID31, 47:32 PhyPARTID30, 31:16 PhyPARTID29, 15:0 PhyPARTID28 } MPAMVPM7_EL2;

// Branch Record Buffer Target Address Register <n>
array [0..31] of __register 64 { 63:0 ADDRESS } BRBTGT_EL1;

// Branch Record Buffer Source Address Injection Register
__register 64 { 63:0 ADDRESS } BRBSRCINJ_EL1;

// Activity Monitors Peripheral Identification Register 4
__register 32 { 7:4 SIZE, 3:0 DES_2 } AMPIDR4;

// Activity Monitors Counter Group 1 Identification Register
__register 64 {  } AMCG1IDR_EL0;

// Virtual Machine Error Reporting Status Register
__register 32 { 3:3 WROD, 2:2 RWOD, 1:1 WRD, 0:0 RRD } GICV_STATUSR;

// Peripheral Identification Register 0
__register 32 { 7:0 PART_0 } TRBPIDR0;

// Virtual Machine Aliased Interrupt Acknowledge Register
__register 32 { 24:0 INTID } GICV_AIAR;

// MPAM Cache Minimum Capacity Partition Configuration Register
__register 32 { 15:0 CMIN } MPAMCFG_CMIN;

// Interrupt Controller Interrupt Acknowledge Register 1
__register 32 { 23:0 INTID } ICC_IAR1;

// MPAM Memory System Monitor Configure Cache Storage Allocation Monitor Filter Register
__register 32 { 23:16 PMG, 15:0 PARTID } MSMON_CFG_CSA_FLT;

// Realm PA space Alternate MECID for EL3 stage 1 translation regime
__register 64 { 15:0 MECID } MECID_RL_A_EL3;

// Branch Record Buffer Control Register (EL2)
__register 64 { 23:23 EXCEPTION, 22:22 ERTN, 9:9 FZPSS, 8:8 FZP, 6:5 TS, 4:4 MPRED, 3:3 CC, 1:1 E2BRE, 0:0 E0HBRE } BRBCR_EL2;

// Interrupt Controller Software Generated Interrupt Group 1 Register
__register 64 { 55:48 Aff3, 47:44 RS, 40:40 IRM, 39:32 Aff2, 27:24 INTID, 23:16 Aff1, 15:0 TargetList } ICC_SGI1R_EL1;

// Performance Monitors Interrupt Enable register
__register 64 { 32:32 F0, 31:31 C } PMINTEN;

// Counter-timer Self-Synchronized Virtual Count register
__register 64 { 63:0 SSVirtualCount } CNTVCTSS;

// Jazelle Main Configuration Register
__register 32 {  } JMCR;

// Clear Secure SPI Pending Register
__register 32 { 12:0 INTID } GICD_CLRSPI_SR;

// ITS Write Register
__register 64 { 19:5 Offset, 0:0 Retry } GITS_CWRITER;

// MPAM PE-side Maximum Bandwidth Control Register (EL1)
__register 64 { 63:63 HW_SCALE_ENABLE, 62:62 ENABLED, 61:61 HARDLIM, 31:0 MAX } MPAMBW1_EL1;

// Debug Breakpoint Extended Value Registers
array [0..15] of __register 32 { 31:0 ContextID2, 15:8, 7:0 VMID } DBGBXVR;

// Reset Management Register (EL3)
__register 32 { 1:1 RR, 0:0 AA64 } RMR_EL3;

// AArch32 Instruction Set Attribute Register 0
__register 32 { 27:24 Divide, 23:20 Debug, 19:16 Coproc, 15:12 CmpBranch, 11:8 BitField, 7:4 BitCount, 3:0 Swap } ID_ISAR0_EL1;

// Interrupt Priority Registers
array [0..254] of __register 32 { 31:24 Priority_offset_3B, 23:16 Priority_offset_2B, 15:8 Priority_offset_1B, 7:0 Priority_offset_0B } GICD_IPRIORITYR;

// Interrupt Controller Hyp Active Priorities Group 1 Registers
array [0..3] of __register 32 {  } ICH_AP1R;

// Normal Memory Remap Register
__register 32 {  } NMRR;

// System Control Register
__register 32 { 31:31 DSSBS, 30:30 TE, 29:29 AFE, 28:28 TRE, 25:25 EE, 23:23 SPAN, 20:20 UWXN, 19:19 WXN, 18:18 nTWE, 16:16 nTWI, 13:13 V, 12:12 I, 10:10 EnRCTX, 8:8 SED, 7:7 ITD, 6:6 UNK, 5:5 CP15BEN, 4:4 LSMAOE, 3:3 nTLSMD, 2:2 C, 1:1 A, 0:0 M } SCTLR;

// Activity Monitors Counter Group Configuration Register
__register 64 { 15:8 CG1NC, 7:0 CG0NC } AMCGCR_EL0;

// Report maximum PARTID and PMG Register
__register 32 { 23:16 PMGmax, 15:0 PARTIDmax } GICR_MPAMIDR;

// AArch32 Secure Debug Enable Register
__register 32 { 1:1 SUNIDEN, 0:0 SUIDEN } SDER32_EL2;

// Performance Monitors User Enable Register
__register 32 { 6:6 TID, 5:5 IR, 4:4 UEN, 3:3 ER, 2:2 CR, 1:1 SW, 0:0 EN } PMUSERENR_EL0;

// MPAM Egress PARTID Translation Mask Configuration Register
__register 32 { 4:0 MASK_WD } MPAMCFG_OUT_TL_MASK;

// Hyp Configuration Register 2
__register 32 { 22:22 TTLBIS, 20:20 TOCU, 18:18 TICAB, 17:17 TID4, 5:5 TEA, 4:4 TERR, 1:1 ID, 0:0 CD } HCR2;

// Interrupt Controller Interrupt Group 1 Enable Register (EL3)
__register 32 { 1:1 EnableGrp1S, 0:0 EnableGrp1NS } ICC_IGRPEN1_EL3;

// Interrupt Group Register 0
__register 32 {  } GICR_IGROUPR0;

// Stage 2 Permission Overlay Register (EL1)
__register 64 {  } S2POR_EL1;

// Physical Address Register
__register 64 { 39:12 PA, 11:11 LPAE, 10:10 NOS, 9:9 NS, 8:7 SH, 1:1 SS, 0:0 F, 63:56 ATTR, 9:9 FSTAGE, 8:8 S2WLK, 6:1 FST, 6:4 Inner, 3:2 Outer, 6:6, 5:1 FS } PAR;

// Trace Peripheral Identification Register 3
__register 32 { 7:4 REVAND, 3:0 CMOD } TRCPIDR3;

// Interrupt Controller End Of Interrupt Register 0
__register 32 { 23:0 INTID } ICC_EOIR0;

// Random Number
__register 64 { 63:0 RNDR } RNDR;

// MPAM Memory System Monitor Configure Cache Storage Allocation Monitor Control Register
__register 32 { 31:31 EN, 30:28 CAPT_EVNT, 27:27 CAPT_RESET, 26:26 OFLOW_STATUS, 25:25 OFLOW_INTR, 24:24 OFLOW_FRZ, 23:23 OFLOW_CAPT, 19:19 SCLEN, 18:18 CEVNT_OFLW, 17:17 MATCH_PMG, 16:16 MATCH_PARTID, 15:15 OFLOW_STATUS_L, 14:14 OFLOW_INTR_L, 13:13 OFLOW_CAPT_L, 10:8 OFLOW_LNKG, 7:0 TYPE } MSMON_CFG_CSA_CTL;

// Selected Error Record Address Register 2
__register 32 { 31:0 ERRnADDRhi } ERXADDR2;

// System PMU Implementation Identification Register
__register 64 { 31:20 ProductID, 19:16 Variant, 15:12 Revision, 11:0 Implementer } SPMIIDR_EL1;

// CTI Application Trigger Set register
__register 32 {  } CTIAPPSET;

// OS Double Lock Register
__register 32 { 0:0 DLK } OSDLR_EL1;

// Performance Monitors Overflow Flag Status Register
__register 32 { 31:31 C } PMOVSR;

// Virtual Machine Interrupt Acknowledge Register
__register 32 { 24:0 INTID } GICV_IAR;

// Performance Monitors Event Filter Registers
array [0..63] of __register 64 {  } PMEVFILT2R;

// Program Counter Sample Register
__register 64 { 63:63 NS, 62:61 EL, 59:59 NSE, 55:32, 31:0 PCSample } PMPCSR;

// Clear LPI Pending Register
__register 64 { 31:0 pINTID } GICR_CLRLPIR;

// Selected Error Record Miscellaneous Register 0
__register 32 { 31:0 ERRnMISC0lo } ERXMISC0;

// Interrupt Controller Deactivate Virtual Interrupt Register
__register 32 { 23:0 INTID } ICV_DIR_EL1;

// External Debug Status and Control Register 2
__register 32 { 3:3 EHBWE, 1:1 TTA } EDSCR2;

// MPAM PE-side Maximum Bandwidth Limit Virtualization Register
__register 64 { 63:63 HW_SCALE_ENABLE, 62:62 ENABLED, 31:0 CAP } MPAMBWCAP_EL2;

// Interrupt Controller Highest Priority Pending Interrupt Register 1
__register 32 { 23:0 INTID } ICC_HPPIR1_EL1;

// Physical Address Register
__register 128 { 51:48, 51:48, 47:12, 47:12 PA, 64:64 D128, 63:56 ATTR, 11:11 NSE, 9:9 NS, 8:7 SH, 0:0 F, 15:15 DirtyBit, 14:14 Overlay, 13:13 TopLevel, 12:12 AssuredOnly, 9:9 S, 8:8 PTW, 6:1 FST } PAR_EL1;

// Reset Management Register (EL1)
__register 32 { 1:1 RR, 0:0 AA64 } RMR_EL1;

// Auxiliary Memory Attribute Indirection Register (EL2)
__register 64 {  } AMAIR_EL2;

// Non-Secure Access Control Register
__register 32 { 20:20 NSTRCDIS, 15:15 NSASEDIS, 11:11 cp11, 10:10 cp10 } NSACR;

// External Debug Peripheral Identification Register 4
__register 32 { 7:4 SIZE, 3:0 DES_2 } EDPIDR4;

// ITS Error Reporting Status Register
__register 32 { 9:6 Syndrome, 5:5 Overflow, 4:4 UMSI, 3:3 WROD, 2:2 RWOD, 1:1 WRD, 0:0 RRD } GITS_STATUSR;

// Interrupt Controller Virtual Interrupt Group 1 Enable register
__register 32 { 0:0 Enable } ICV_IGRPEN1;

// Interrupt Controller Software Generated Interrupt Group 0 Register
__register 64 { 55:48 Aff3, 47:44 RS, 40:40 IRM, 39:32 Aff2, 27:24 INTID, 23:16 Aff1, 15:0 TargetList } ICC_SGI0R;

// Memory Attribute Indirection Register 1
__register 32 {  } MAIR1;

// Distributor Implementer Identification Register
__register 32 { 31:24 ProductID, 19:16 Variant, 15:12 Revision, 11:0 Implementer } GICM_IIDR;

// Empty List Register Status Register
__register 32 {  } GICH_ELRSR;

// Jazelle OS Control Register
__register 32 {  } JOSCR;

// Activity Monitors Peripheral Identification Register 0
__register 32 { 7:0 PART_0 } AMPIDR0;

// Performance Monitors Overflow Flag Status register
__register 64 { 32:32 F0, 31:31 C } PMOVS;

// Interrupt Mask Bits
__register 32 { 9:9 D, 8:8 A, 7:7 I, 6:6 F } DAIF;

// Trace Address Comparator Value Register <n>
array [0..15] of __register 64 { 63:0 ADDRESS } TRCACVR;

// Trace ID Register 2
__register 32 { 31:31 WFXMODE, 30:29 VMIDOPT, 28:25 CCSIZE, 24:20 DVSIZE, 19:15 DASIZE, 14:10 VMIDSIZE, 9:5 CIDSIZE, 4:0 IASIZE } TRCIDR2;

// Auxiliary Fault Status Register 0 (EL1)
__register 32 {  } AFSR0_EL1;

// MPAM Features Memory Bandwidth Usage Monitoring ID register
__register 64 { 32:32 HAS_MON_SEC, 31:31 HAS_CAPTURE, 30:30 HAS_LONG, 29:29 LWD, 28:28 HAS_RWBW, 27:27 HAS_OFLOW_LNKG, 26:26 HAS_OFSR, 25:25 HAS_CEVNT_OFLW, 24:24 HAS_OFLOW_CAPT, 23:23 NO_MATCH_PARTID, 22:22 NO_MATCH_PMG, 20:16 SCALE, 15:0 NUM_MON } MPAMF_MBWUMON_IDR;

// Performance Monitors Event Counter Selection Register
__register 32 { 4:0 SEL } PMSELR;

// Interrupt Controller PPI Direct-inject Virtual Interrupt Registers
array [0..1] of __register 64 {  } ICH_PPI_DVIR_EL2;

// Virtualization Translation Table Base Register
__register 64 { 55:48 VMID, 47:1 BADDR, 0:0 CnP } VTTBR;

// ITS Device Table Base Address Configuration Register
__register 32 { 16:16 STRUCTURE, 7:6 L2SZ, 5:0 DEVICEID_BITS } ITS_DT_CFGR;

// Translation Table Base Register 0
__register 64 { 31:7 TTB0, 0:0 IRGN, 5:5 NOS, 4:3 RGN, 2:2 IMP, 1:1 S, 55:48 ASID, 47:1 BADDR, 0:0 CnP } TTBR0;

// Counter-timer Hypervisor Control Register
__register 32 { 19:19 CNTPMASK, 18:18 CNTVMASK, 17:17 EVNTIS, 16:16 EL1NVVCT, 15:15 EL1NVPCT, 14:14 EL1TVCT, 13:13 EL1TVT, 12:12 ECV, 11:11 EL1PTEN, 0:0 EL1PCTEN, 9:9 EL0PTEN, 8:8 EL0VTEN, 7:4 EVNTI, 3:3 EVNTDIR, 2:2 EVNTEN, 1:1 EL0VCTEN, 0:0 EL0PCTEN, 1:1 EL1PCEN } CNTHCTL_EL2;

// ITS Software Error Syndrome Register 1
__register 64 { 55:3 ADDR } ITS_SWERR_SYNDROMER1;

// Instrumentation Trace Control Register (EL2)
__register 64 { 1:1 E2E, 0:0 E0HE } TRCITECR_EL2;

// MPAM PMG Translation Egress Identification Register
__register 32 { 31:31 DIRECT, 30:30 BASE_MASK, 15:0 PMGTL_MAX } MPAMF_PMG_OUT_TL_IDR;

// MPAM Memory System Monitor Configure Cache Storage Usage Monitor Control Register
__register 32 { 31:31 EN, 30:28 CAPT_EVNT, 27:27 CAPT_RESET, 26:26 OFLOW_STATUS, 25:25 OFLOW_INTR, 24:24 OFLOW_FRZ, 23:23 OFLOW_CAPT, 22:20 SUBTYPE, 18:18 CEVNT_OFLW, 17:17 MATCH_PMG, 16:16 MATCH_PARTID, 10:8 OFLOW_LNKG, 7:0 TYPE } MSMON_CFG_CSU_CTL;

// IRS Synchronize Interrupt Events Status Register
__register 32 { 0:0 IDLE } IRS_SYNC_STATUSR;

// Activity Monitors Count Enable Set Register 0
__register 32 {  } AMCNTENSET0;

// AArch32 Memory Model Feature Register 5
__register 64 { 7:4 nTLBPA, 3:0 ETS } ID_MMFR5_EL1;

// Sampling Data Source Filter Register
__register 64 {  } PMSDSFR_EL1;

// Counter-timer Physical Secure Timer CompareValue Register
__register 64 { 63:0 CompareValue } CNTPS_CVAL_EL1;

// Interrupt Status Register
__register 32 { 8:8 A, 7:7 I, 6:6 F } ISR;

// MPAM Partition Configuration Enable Register
__register 32 { 15:0 PARTID } MPAMCFG_EN;

// Architectural Feature Access Control Masking Register
__register 64 { 31:31 TCPAC, 30:30 TAM, 29:29 E0POE, 28:28 TTA, 24:24 SMEN, 20:20 FPEN, 16:16 ZEN } CPACRMASK_EL1;

// MPAM PE-side Maximum Bandwidth Control Register (EL0)
__register 64 { 63:63 HW_SCALE_ENABLE, 62:62 ENABLED, 61:61 HARDLIM, 31:0 MAX } MPAMBW0_EL1;

// AArch32 Media and VFP Feature Register 0
__register 32 { 31:28 FPRound, 27:24 FPShVec, 23:20 FPSqrt, 19:16 FPDivide, 15:12 FPTrap, 11:8 FPDP, 7:4 FPSP, 3:0 SIMDReg } MVFR0_EL1;

// CONTEXTIDR_EL1 and VMID Sample Register
__register 64 { 47:40 VMID, 31:0 CONTEXTIDR_EL1 } PMVCIDSR;

// Sampling Interval Counter Register
__register 64 { 63:56 ECOUNT, 31:0 COUNT } PMSICR_EL1;

// Hypervisor System Trap Register
__register 32 { 15:15 T15, 13:13 T13, 12:12 T12, 11:11 T11, 10:10 T10, 9:9 T9, 8:8 T8, 7:7 T7, 6:6 T6, 5:5 T5, 3:3 T3, 2:2 T2, 1:1 T1, 0:0 T0 } HSTR_EL2;

// IRS MPAM Identification Register
__register 32 { 24:24 HAS_MPAM_SP, 31:16 PMG_MAX, 15:0 PARTID_MAX } IRS_MPAM_IDR;

// Stack Pointer (EL0)
__register 64 { 63:0 StackPointer } SP_EL0;

// MPAM Partition Configuration Disable Register
__register 32 { 31:31 NFU, 15:0 PARTID } MPAMCFG_DIS;

// Hyp Trace Filter Control Register
__register 32 { 6:5 TS, 3:3 CX, 1:1 E2TRE, 0:0 E0HTRE } HTRFCR;

// Interrupt Controller Virtual Active Priorities Group 1 Registers
array [0..3] of __register 64 { 63:63 NMI } ICV_AP1R_EL1;

// Auxiliary Fault Status Register 1 (EL2)
__register 32 {  } AFSR1_EL2;

// Virtualization Processor ID Register
__register 32 { 31:24 Implementer, 23:20 Variant, 19:16 Architecture, 15:4 PartNum, 3:0 Revision } VPIDR_EL2;

// Maintenance Interrupt Status Register
__register 32 { 7:7 VGrp1D, 6:6 VGrp1E, 5:5 VGrp0D, 4:4 VGrp0E, 3:3 NP, 2:2 LRENP, 1:1 U, 0:0 EOI } GICH_MISR;

// Selected Error Record Miscellaneous Register 5
__register 32 { 31:0 ERRnMISC2hi } ERXMISC5;

// Interrupt Controller Highest Priority Pending Interrupt Register 0
__register 32 { 23:0 INTID } ICC_HPPIR0_EL1;

// IRS VPE Control Register 0
__register 32 { 0:0 DPS } IRS_VPE_CR0;

// CTI Component Identification Register 0
__register 32 { 7:0 PRMBL_0 } CTICIDR0;

// Non-maskable Interrupt Registers for Extended PPIs, x = 1 to 2.
array [1..2] of __register 32 {  } GICR_INMIRE;

// Hypervisor Fine-Grained Read Trap Register 2
__register 64 { 39:39 ACTLR_EL1, 30:30 nTLBIDIDR_EL1, 14:14 nACTLRALIAS_EL1, 13:13 nACTLRMASK_EL1, 12:12 nTCR2ALIAS_EL1, 11:11 nTCRALIAS_EL1, 10:10 nSCTLR2ALIAS_EL1, 9:9 nSCTLRALIAS_EL1, 8:8 nCPACRALIAS_EL1, 7:7 nTCR2MASK_EL1, 6:6 nTCRMASK_EL1, 5:5 nSCTLR2MASK_EL1, 4:4 nSCTLRMASK_EL1, 3:3 nCPACRMASK_EL1, 2:2 nRCWSMASK_EL1, 1:1 nERXGSR_EL1, 0:0 nPFAR_EL1 } HFGRTR2_EL2;

// Error Reporting Status Register
__register 32 { 3:3 WROD, 2:2 RWOD, 1:1 WRD, 0:0 RRD } GICR_STATUSR;

// AArch32 Processor Feature Register 2
__register 32 { 11:8 RAS_frac, 7:4 SSBS, 3:0 CSV3 } ID_PFR2_EL1;

// Data Cache Zero ID Register
__register 32 { 8:5 TBS, 4:4 DZP, 3:0 BS } DCZID_EL0;

// Main ID Register
__register 32 { 31:24 Implementer, 23:20 Variant, 19:16 Architecture, 15:4 PartNum, 3:0 Revision } MIDR;

// Hypervisor GIC Fine-Grained Instruction Trap Register
__register 64 { 10:10 GICRCDNMIA, 9:9 GICRCDIA, 8:8 GICCDDI, 7:7 GICCDEOI, 6:6 GICCDHM, 5:5 GICCDRCFG, 4:4 GICCDPEND, 3:3 GICCDAFF, 2:2 GICCDPRI, 1:1 GICCDDIS, 0:0 GICCDEN } ICH_HFGITR_EL2;

// CPU Interface Aliased End Of Interrupt Register
__register 32 { 23:0 INTID } GICC_AEOIR;

// CPU Interface End Of Interrupt Register
__register 32 { 23:0 INTID } GICC_EOIR;

// Debug Self Address Register
__register 64 {  } DBGDSAR;

// Interrupt Controller Virtual Running Priority Register
__register 32 { 63:63 NMI, 7:0 Priority } ICV_RPR_EL1;

// Pointer Authentication Key A for Code (bits[127:64]) 
__register 64 { 63:0 APGAKeyHi } APGAKeyHi_EL1;

// CTI Device Architecture register
__register 32 { 31:21 ARCHITECT, 20:20 PRESENT, 19:16 REVISION, 15:0 ARCHID } CTIDEVARCH;

// Debug OS Lock Data Transfer Register, Receive, External View
__register 32 { 31:0 DTRRX } DBGDTRRXext;

// Interrupt Controller Hyp Control Register
__register 32 { 31:27 EOIcount, 15:15 DVIM, 14:14 TDIR, 13:13 TSEI, 12:12 TALL1, 11:11 TALL0, 10:10 TC, 8:8 vSGIEOICount, 7:7 VGrp1DIE, 6:6 VGrp1EIE, 5:5 VGrp0DIE, 4:4 VGrp0EIE, 3:3 NPIE, 2:2 LRENPIE, 1:1 UIE, 0:0 En } ICH_HCR_EL2;

// External Debug Peripheral Identification Register 1
__register 32 { 7:4 DES_0, 3:0 PART_1 } EDPIDR1;

// ITS Read Event Data Register
__register 64 { 63:63 VIRT, 47:32 VM_ID, 31:31 VALID, 23:0 LPI_ID } ITS_READ_EVENT_DATAR;

// GIC PMU Identification Register 0
__register 32 { 6:6 DOM_RL, 5:5 DOM_EL3, 4:4 DOM_NS, 3:3 DOM_S, 2:2 OACE, 1:1 ITS_PMU, 0:0 IRS_PMU } GIC_PMIDR0;

// Instruction Fault Status Register (EL2)
__register 32 { 16:16 FnV, 12:12 ExT, 3:0 FS, 9:9 LPAE, 5:0 STATUS } IFSR32_EL2;

// CTI Trigger Out Status register
__register 32 {  } CTITRIGOUTSTATUS;

// MEC Identification Register
__register 64 { 3:0 MECIDWidthm1 } MECIDR_EL2;

// IRS VPE Doorbell Settings Register
__register 64 { 63:63 DBV, 62:62 REQ_DB, 36:32 DBPM, 23:0 INTID } IRS_VPE_DBR;

// Redistributor Type Register
__register 64 { 63:56 Aff3, 55:48 Aff2, 47:40 Aff1, 39:32 Aff0, 31:27 PPInum, 26:26 VSGI, 25:24 CommonLPIAff, 23:8 Processor_Number, 7:7 RVPEID, 6:6 MPAM, 5:5 DPGS, 4:4 Last, 3:3 DirectLPI, 2:2 Dirty, 1:1 VLPIS, 0:0 PLPIS } GICR_TYPER;

// Debug Data Transfer Register, Receive
__register 32 { 31:0 DTRRX } DBGDTRRXint;

// Debug Link Register
__register 64 { 63:0 ADDR } DLR_EL0;

// IRS SPI Resample Register
__register 32 { 23:0 SPI_ID } IRS_SPI_RESAMPLER;

// IRS Map Physical Level 2 IST Register
__register 32 { 23:0 ID } IRS_MAP_L2_ISTR;

// Redistributor Properties Base Address Register
__register 64 { 58:56 OuterCache, 51:12 Physical_Address, 11:10 Shareability, 9:7 InnerCache, 4:0 IDbits } GICR_PROPBASER;

// Interrupt Controller Monitor System Register Enable register
__register 32 { 3:3 Enable, 2:2 DIB, 1:1 DFB, 0:0 SRE } ICC_MSRE;

// Translation Control Register (EL1)
__register 64 { 61:61 MTX1, 60:60 MTX0, 59:59 DS, 58:58 TCMA1, 57:57 TCMA0, 56:56 E0PD1, 55:55 E0PD0, 54:54 NFD1, 53:53 NFD0, 52:52 TBID1, 51:51 TBID0, 50:50 HWU162, 49:49 HWU161, 48:48 HWU160, 47:47 HWU159, 46:46 HWU062, 45:45 HWU061, 44:44 HWU060, 43:43 HWU059, 42:42 HPD1, 41:41 HPD0, 40:40 HD, 39:39 HA, 38:38 TBI1, 37:37 TBI0, 36:36 AS, 34:32 IPS, 31:30 TG1, 29:28 SH1, 27:26 ORGN1, 25:24 IRGN1, 23:23 EPD1, 22:22 A1, 21:16 T1SZ, 15:14 TG0, 13:12 SH0, 11:10 ORGN0, 9:8 IRGN0, 7:7 EPD0, 5:0 T0SZ } TCR_EL1;

// Debug Device ID register 2
__register 32 {  } DBGDEVID2;

// MPAM Control Register (EL1)
__register 64 { 63:63 MPAMEN, 52:52 EN_ALT_IPMG, 51:51 EN_ALT_IPARTID, 50:50 EN_ALT_IPMG_EL0, 49:49 EN_ALT_IPARTID_EL0 } MPAMCTL_EL1;

// MPAM Memory Bandwidth Minimum Partition Configuration Register
__register 32 { 15:0 MIN } MPAMCFG_MBW_MIN;

// IRS PE Selection Register
__register 32 { 15:0 IAFFID } IRS_PE_SELR;

// MPAM PE-side Maximum Bandwidth Control Register (EL2)
__register 64 { 63:63 HW_SCALE_ENABLE, 62:62 ENABLED, 61:61 HARDLIM, 52:52 nTRAP_MPAMBWIDR_EL1, 51:51 nTRAP_MPAMBW0_EL1, 50:50 nTRAP_MPAMBW1_EL1, 49:49 nTRAP_MPAMBWSM_EL1, 31:0 MAX } MPAMBW2_EL2;

// Interrupt Controller Physical Active Priorities Register (EL1)
__register 64 {  } ICC_APR_EL1;

// Error Interrupt Status Register
__register 64 { 5:5 CRIERR, 4:4 CRI, 3:3 ERIERR, 2:2 ERI, 1:1 FHIERR, 0:0 FHI } ERRIRQSR;

// Hyp Auxiliary Memory Attribute Indirection Register 1
__register 32 {  } HAMAIR1;

// IRS Identification Register 0
__register 32 { 31:16 IRSID, 13:13 MPAM2, 12:12 SWE, 11:11 MPAM, 10:10 MEC, 9:9 SETLPI, 8:8 VIRT_ONE_N, 7:7 ONE_N, 6:6 VIRT, 5:2 PA_RANGE, 1:0 INT_DOM } IRS_IDR0;

// External Debug Integration mode Control register
__register 32 { 0:0 IME } EDITCTRL;

// Streaming Mode Identification Register
__register 64 { 59:56 NSMC, 55:52 HIP, 51:32 Affinity2, 31:24 Implementer, 23:16 Revision, 15:15 SMPS, 14:13 SH, 11:0 Affinity } SMIDR_EL1;

// MPAM Capture Event Generation Register
__register 32 { 1:1 ALL, 0:0 NOW } MSMON_CAPT_EVNT;

// Vector Base Address Register (EL3)
__register 64 { 63:11 VBA } VBAR_EL3;

// Virtual Machine CPU Interface Identification Register
__register 32 { 31:20 ProductID, 19:16 Architecture_version, 15:12 Revision, 11:0 Implementer } GICV_IIDR;

// Virtual Machine Highest Priority Pending Interrupt Register
__register 32 { 24:0 INTID } GICV_HPPIR;

// AArch64 Instruction Set Attribute Register 1
__register 64 { 63:60 LS64, 59:56 XS, 55:52 I8MM, 51:48 DGH, 47:44 BF16, 43:40 SPECRES, 39:36 SB, 35:32 FRINTTS, 31:28 GPI, 27:24 GPA, 23:20 LRCPC, 19:16 FCMA, 15:12 JSCVT, 11:8 API, 7:4 APA, 3:0 DPB } ID_AA64ISAR1_EL1;

// Interrupt Controller Empty List Register Status Register
__register 32 {  } ICH_ELRSR;

// MPAM Memory Bandwidth Partitioning Identification Register
__register 32 { 28:16 BWPBM_WD, 14:14 WINDWR, 13:13 HAS_PROP, 12:12 HAS_PBM, 11:11 HAS_MAX, 10:10 HAS_MIN, 9:8 MAX_LIM, 5:0 BWA_WD } MPAMF_MBW_IDR;

// Performance Monitors Control Register
__register 32 { 31:24 IMP, 23:16 IDCODE, 15:11 N, 9:9 FZO, 7:7 LP, 6:6 LC, 5:5 DP, 4:4 X, 3:3 D, 2:2 C, 1:1 P, 0:0 E } PMCR;

// Interrupt Controller PPI Hide Virtual Interrupt Registers
array [0..1] of __register 64 {  } ICH_PPI_HVIR_EL2;

// Saved Program Status Register (EL1)
__register 32 { 36:36 UINJ, 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 15:10 IT, 24:24 DIT, 12:12 SSBS, 22:22 PAN, 21:21 SS, 20:20 IL, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 5:5 T, 35:35 PACM, 34:34 EXLOCK, 32:32 PM, 25:25 TCO, 23:23 UAO, 13:13 ALLINT, 11:10 BTYPE, 9:9 D, 4:4, 4:4, 3:0, 3:0 M } SPSR_EL1;

// Memory Model Feature Register 1
__register 32 { 31:28 BPred, 27:24 L1TstCln, 23:20 L1Uni, 19:16 L1Hvd, 15:12 L1UniSW, 11:8 L1HvdSW, 7:4 L1UniVA, 3:0 L1HvdVA } ID_MMFR1;

// Interrupt Controller Physical Active Priorities Register for EL3
__register 64 {  } ICC_APR_EL3;

// Implementation Identification Register
__register 32 { 31:20 ProductID, 19:16 Variant, 15:12 Revision, 11:0 Implementer } ERRIIDR;

// IRS Software Error Syndrome Register 1
__register 64 { 55:3 ADDR } IRS_SWERR_SYNDROMER1;

// MPAM Monitor Overflow MSI Write Data Register
__register 32 { 31:0 MSI_DATA } MSMON_OFLOW_MSI_DATA;

// IRS Map Level 2 VM Table Register
__register 64 { 63:63 M, 15:0 VM_ID } IRS_VMAP_L2_VMTR;

// CTI Component Identification Register 3
__register 32 { 7:0 PRMBL_3 } CTICIDR3;

// Activity Monitors Peripheral Identification Register 2
__register 32 { 7:4 REVISION, 3:3 JEDEC, 2:0 DES_1 } AMPIDR2;

// MPAM2 Register (EL2)
__register 64 { 63:48 altPMG, 47:32 PMG, 31:16 altPARTID, 15:0 PARTID, 63:63 MPAMEN, 58:58 TIDR, 56:56 ALTSP_HFC, 55:55 ALTSP_EL2, 54:54 ALTSP_FRCD, 50:50 EnMPAMSM, 49:49 TRAPMPAM0EL1, 48:48 TRAPMPAM1EL1, 47:40 PMG_D, 39:32 PMG_I, 31:16 PARTID_D, 15:0 PARTID_I } MPAM2_EL2;

// Branch Record Buffer ID0 Register
__register 64 { 15:12 CC, 11:8 FORMAT, 7:0 NUMREC } BRBIDR0_EL1;

// System Performance Monitors Overflow Flag Status Set Register
__register 64 {  } SPMOVSSET_EL0;

// Performance Monitors Interrupt Enable Set register
__register 32 { 31:31 C } PMINTENSET;

// Current Program Status Register
__register 32 { 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 23:23 SSBS, 22:22 PAN, 21:21 DIT, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 3:0 M } CPSR;

// Activity Monitors Count Set and Clear Register
__register 64 {  } AMCNTEN;

// Hyp Reset Management Register
__register 32 { 1:1 RR, 0:0 AA64 } HRMR;

// EL2 Software Thread ID Register
__register 64 { 63:0 ThreadID } TPIDR_EL2;

// External Debug Processor Status Register
__register 32 { 16:16 EPMADE, 15:15 ETADE, 14:14 EDADE, 13:13 STAD, 12:12 ETAD, 11:11 SDR, 10:10 SPMAD, 9:9 EPMAD, 8:8 SDAD, 7:7 EDAD, 6:6 DLK, 5:5 OSLK, 4:4 HALTED, 3:3 SR, 2:2 R, 1:1 SPD, 0:0 PU } EDPRSR;

// Trace PowerDown Control Register
__register 32 { 3:3 PU } TRCPDCR;

// Interrupt Controller Running Priority Register
__register 32 { 63:63 NMI, 62:62 NMI_NS, 7:0 Priority } ICC_RPR_EL1;

// IRS Synchronize Interrupt Events Register
__register 32 { 31:31 SYNC } IRS_SYNCR;

// Interrupt Controller End of Interrupt Status Register
__register 32 {  } ICH_EISR_EL2;

// Performance Monitors Common Event Identification Register 1
__register 64 {  } PMCEID1_EL0;

// Pointer Authentication Key A for Code (bits[63:0]) 
__register 64 { 63:0 APGAKeyLo } APGAKeyLo_EL1;

// Extended Translation Control Register (EL1)
__register 64 { 21:21 FNGNA1, 20:20 FNGNA0, 18:18 FNG1, 17:17 FNG0, 16:16 A2, 15:15 DisCH1, 14:14 DisCH0, 11:11 HAFT, 10:10 PTTWI, 5:5 D128, 4:4 AIE, 3:3 POE, 2:2 E0POE, 1:1 PIE, 0:0 PnCH } TCR2_EL1;

// Non-maskable Interrupt Register 0
__register 32 {  } GICR_INMIR0;

// Interrupt Set-Pending Register 0
__register 32 {  } GICR_ISPENDR0;

// Virtual Machine Aliased End Of Interrupt Register
__register 32 { 24:0 INTID } GICV_AEOIR;

// Trace ID Register 0
__register 64 { 30:30 COMMTRANS, 29:29 COMMOPT, 28:24 TSSIZE, 23:23 TSMARK, 22:22 ITE, 17:17 TRCEXDATA, 16:15 QSUPP, 14:14 QFILT, 13:12 CONDTYPE, 11:10 NUMEVENT, 9:9 RETSTACK, 7:7 TRCCCI, 6:6 TRCCOND, 5:5 TRCBB, 4:3 TRCDATA, 2:1 INSTP0 } TRCIDR0;

// CPU Interface Running Priority Register
__register 32 { 7:0 Priority } GICC_RPR;

// Fault Address Register (EL3)
__register 64 { 63:0 VA } FAR_EL3;

// Memory Attribute Indirection Register (EL2)
__register 64 {  } MAIR_EL2;

// Hyp Architectural Feature Trap Register
__register 32 { 31:31 TCPAC, 30:30 TAM, 20:20 TTA, 15:15 TASE, 11:11 TCP11, 10:10 TCP10 } HCPTR;

// Selected Error Record Miscellaneous Register 3
__register 32 { 31:0 ERRnMISC1hi } ERXMISC3;

// Granule Protection Table Base Register
__register 64 { 43:40 BADDR } GPTBR_EL3;

// Activity Monitors Component Identification Register 0
__register 32 { 7:0 PRMBL_0 } AMCIDR0;

// Set Non-secure SPI Pending Register
__register 32 { 12:0 INTID } GICD_SETSPI_NSR;

// MPAM Egress PARTID Translation Base Configuration Register
__register 32 { 15:0 BASE } MPAMCFG_OUT_TL_BASE;

// Counter-timer Hyp Physical Timer TimerValue register
__register 32 { 31:0 TimerValue } CNTHP_TVAL;

// Hyp Software Thread ID Register
__register 32 { 31:0 TID } HTPIDR;

// Virtual Machine Aliased Highest Priority Pending Interrupt Register
__register 32 { 24:0 INTID } GICV_AHPPIR;

// CTI Device Type register
__register 32 { 7:4 SUB, 3:0 MAJOR } CTIDEVTYPE;

// Interrupt Controller Monitor Interrupt Group 1 Enable register
__register 32 { 1:1 EnableGrp1S, 0:0 EnableGrp1NS } ICC_MGRPEN1;

// Vector Base Address Register (EL2)
__register 64 { 63:11 VBA } VBAR_EL2;

// Auxiliary Control Register (EL2)
__register 64 {  } ACTLR_EL2;

// Debug Feature Register 0
__register 32 { 31:28 TraceFilt, 27:24 PerfMon, 23:20 MProfDbg, 19:16 MMapTrc, 15:12 CopTrc, 11:8 MMapDbg, 7:4 CopSDbg, 3:0 CopDbg } ID_DFR0;

// Interrupt Controller Alias Software Generated Interrupt Group 1 Register
__register 64 { 55:48 Aff3, 47:44 RS, 40:40 IRM, 39:32 Aff2, 27:24 INTID, 23:16 Aff1, 15:0 TargetList } ICC_ASGI1R;

// Hypervisor Fine-Grained Write Trap Register
__register 64 { 63:63 nAMAIR2_EL1, 62:62 nMAIR2_EL1, 61:61 nS2POR_EL1, 60:60 nPOR_EL1, 59:59 nPOR_EL0, 58:58 nPIR_EL1, 57:57 nPIRE0_EL1, 56:56 nRCWMASK_EL1, 55:55 nTPIDR2_EL0, 54:54 nSMPRI_EL1, 53:53 nGCS_EL1, 52:52 nGCS_EL0, 50:50 nACCDATA_EL1, 49:49 ERXADDR_EL1, 48:48 ERXPFGCDN_EL1, 47:47 ERXPFGCTL_EL1, 45:45 ERXMISCn_EL1, 44:44 ERXSTATUS_EL1, 43:43 ERXCTLR_EL1, 41:41 ERRSELR_EL1, 39:39 ICC_IGRPENn_EL1, 38:38 VBAR_EL1, 37:37 TTBR1_EL1, 36:36 TTBR0_EL1, 35:35 TPIDR_EL0, 34:34 TPIDRRO_EL0, 33:33 TPIDR_EL1, 32:32 TCR_EL1, 31:31 SCXTNUM_EL0, 30:30 SCXTNUM_EL1, 29:29 SCTLR_EL1, 27:27 PAR_EL1, 24:24 MAIR_EL1, 23:23 LORSA_EL1, 22:22 LORN_EL1, 20:20 LOREA_EL1, 19:19 LORC_EL1, 17:17 FAR_EL1, 16:16 ESR_EL1, 13:13 CSSELR_EL1, 12:12 CPACR_EL1, 11:11 CONTEXTIDR_EL1, 8:8 APIBKey, 7:7 APIAKey, 6:6 APGAKey, 5:5 APDBKey, 4:4 APDAKey, 3:3 AMAIR_EL1, 1:1 AFSR1_EL1, 0:0 AFSR0_EL1 } HFGWTR_EL2;

// Interrupt Clear-Pending Registers (extended SPI range)
array [0..31] of __register 32 {  } GICD_ICPENDRE;

// Trace Buffer Control Register
__register 64 { 0:0 ManStop } TRBCR;

// Virtual Machine Priority Mask Register
__register 32 { 7:0 Priority } GICV_PMR;

// Debug Breakpoint Value Registers
array [0..15] of __register 32 { 31:0 ContextID, 31:2 VA } DBGBVR;

// Monitor Debug Configuration Register (EL2)
__register 32 { 50:50 EnSTEPOP, 43:43 EBWE, 41:40 PMEE, 36:36 HPMFZS, 31:30 PMSSE, 29:29 HPMFZO, 28:28 MTPME, 27:27 TDCC, 26:26 HLP, 25:24 E2TB, 23:23 HCCD, 19:19 TTRF, 17:17 HPMD, 15:15 EnSPM, 14:14 TPMS, 13:12 E2PB, 11:11 TDRA, 10:10 TDOSA, 9:9 TDA, 8:8 TDE, 7:7 HPME, 6:6 TPM, 5:5 TPMCR, 4:0 HPMN } MDCR_EL2;

// Saved Program Status Register (Supervisor mode)
__register 32 { 31:31 N, 30:30 Z, 29:29 C, 28:28 V, 27:27 Q, 15:10 IT, 24:24 J, 23:23 SSBS, 22:22 PAN, 21:21 DIT, 20:20 IL, 19:16 GE, 9:9 E, 8:8 A, 7:7 I, 6:6 F, 5:5 T, 4:0 M } SPSR_svc;

// AArch64 Memory Model Feature Register 0
__register 64 { 63:60 ECV, 59:56 FGT, 47:44 ExS, 43:40 TGran4_2, 39:36 TGran64_2, 35:32 TGran16_2, 31:28 TGran4, 27:24 TGran64, 23:20 TGran16, 19:16 BigEndEL0, 15:12 SNSMem, 11:8 BigEnd, 7:4 ASIDBits, 3:0 PARange } ID_AA64MMFR0_EL1;

// Activity Monitors Event Type Registers 1
array [0..15] of __register 64 { 15:0 evtCount } AMEVTYPER1;

// IRS Control Register 0
__register 32 { 1:1 IDLE, 0:0 IRSEN } IRS_CR0;

// Interrupt Status Register
__register 32 { 10:10 IS, 9:9 FS, 8:8 A, 7:7 I, 6:6 F } ISR_EL1;

// MPAM Memory System Monitor Configure Memory Bandwidth Usage Monitor Control Register
__register 32 { 31:31 EN, 30:28 CAPT_EVNT, 27:27 CAPT_RESET, 26:26 OFLOW_STATUS, 25:25 OFLOW_INTR, 24:24 OFLOW_FRZ, 23:23 OFLOW_CAPT, 22:20 SUBTYPE, 19:19 SCLEN, 18:18 CEVNT_OFLW, 17:17 MATCH_PMG, 16:16 MATCH_PARTID, 15:15 OFLOW_STATUS_L, 14:14 OFLOW_INTR_L, 13:13 OFLOW_CAPT_L, 10:8 OFLOW_LNKG, 7:0 TYPE } MSMON_CFG_MBWU_CTL;

// Cache Level ID Register
__register 32 { 31:30 ICB, 29:27 LoUU, 26:24 LoC, 23:21 LoUIS } CLIDR;

// Memory Model Feature Register 3
__register 32 { 31:28 Supersec, 27:24 CMemSz, 23:20 CohWalk, 19:16 PAN, 15:12 MaintBcst, 11:8 BPMaint, 7:4 CMaintSW, 3:0 CMaintVA } ID_MMFR3;

// Trace Lock Status Register
__register 32 { 2:2 nTT, 1:1 SLK, 0:0 SLI } TRCLSR;

// AArch32 Media and VFP Feature Register 1
__register 32 { 31:28 SIMDFMAC, 27:24 FPHP, 23:20 SIMDHP, 19:16 SIMDSP, 15:12 SIMDInt, 11:8 SIMDLS, 7:4 FPDNaN, 3:0 FPFtZ } MVFR1_EL1;

// Secure Debug Enable Register
__register 32 { 1:1 SUNIDEN, 0:0 SUIDEN } SDER;

// SME Control Register (EL1)
__register 64 { 31:31 FA64, 30:30 EZT0, 3:0 LEN } SMCR_EL1;

// MPAM PMG Translation Ingress Mask Control Register
__register 32 { 4:0 MASK_WD } MSMON_IN_TL_MASK;

// Interrupt Controller Virtual Control Register
__register 32 { 19:19 ExtRange, 18:18 RSS, 15:15 A3V, 14:14 SEIS, 13:11 IDbits, 10:8 PRIbits, 1:1 EOImode, 0:0 CBPR } ICV_CTLR;

// Streaming Mode Priority Mapping Register
__register 64 { 63:60 P15, 59:56 P14, 55:52 P13, 51:48 P12, 47:44 P11, 43:40 P10, 39:36 P9, 35:32 P8, 31:28 P7, 27:24 P6, 23:20 P5, 19:16 P4, 15:12 P3, 11:8 P2, 7:4 P1, 3:0 P0 } SMPRIMAP_EL2;

// Translation Table Base Control Register
__register 32 { 31:31 EAE, 5:5 PD1, 4:4 PD0, 2:0 N, 29:28 SH1, 27:26 ORGN1, 25:24 IRGN1, 23:23 EPD1, 22:22 A1, 18:16 T1SZ, 13:12 SH0, 11:10 ORGN0, 9:8 IRGN0, 7:7 EPD0, 6:6 T2E, 2:0 T0SZ } TTBCR;

// Counter-timer Physical Secure Timer TimerValue Register
__register 32 { 31:0 TimerValue } CNTPS_TVAL_EL1;

// Permission Indirection Register 0 (EL2)
__register 64 {  } PIRE0_EL2;

// Hyp Data Fault Address Register
__register 32 { 31:0 VA } HDFAR;

// Debug OS Double Lock Register
__register 32 { 0:0 DLK } DBGOSDLR;

// Interrupt Group Registers
array [1..2] of __register 32 {  } GICR_IGROUPRE;

// System Performance Monitors Overflow Flag Status Clear Register
__register 64 {  } SPMOVSCLR_EL0;

// SME Feature ID Register 0
__register 64 { 63:63 FA64, 61:61 LUT6, 60:60 LUTv2, 59:56 SMEver, 55:52 I16I64, 48:48 F64F64, 47:44 I16I32, 43:43 B16B16, 42:42 F16F16, 41:41 F8F16, 40:40 F8F32, 39:36 I8I32, 35:35 F16F32, 34:34 B16F32, 33:33 BI32I32, 32:32 F32F32, 30:30 SF8FMA, 29:29 SF8DP4, 28:28 SF8DP2, 25:25 SBitPerm, 24:24 AES, 23:23 SFEXPA, 16:16 STMOP, 0:0 SMOP4 } ID_AA64SMFR0_EL1;

// AArch32 Instruction Set Attribute Register 2
__register 32 { 31:28 Reversal, 27:24 PSR_AR, 23:20 MultU, 19:16 MultS, 15:12 Mult, 11:8 MultiAccessInt, 7:4 MemHint, 3:0 LoadStore } ID_ISAR2_EL1;

// Auxiliary Control Masking Register (EL1)
__register 64 {  } ACTLRMASK_EL1;

// LORegion Control (EL1)
__register 64 { 9:2 DS, 0:0 EN } LORC_EL1;

// System Control Register (EL3)
__register 64 { 24:24 BTD, 11:11 CPTM, 9:9 CPTA, 7:7 EnPACM, 4:4 EnANERR, 3:3 EnADERR, 1:1 EMEC } SCTLR2_EL3;

// Interrupt Controller Virtual PPI Set Active Registers
array [0..1] of __register 64 {  } ICV_PPI_SACTIVER_EL1;

// Auxiliary Data Fault Status Register
__register 32 {  } ADFSR;

// Activity Monitors Component Identification Register 1
__register 32 { 7:4 CLASS, 3:0 PRMBL_1 } AMCIDR1;

// System Performance Monitors Root and Realm Control Register
__register 64 { 3:3 NAO, 1:1 RLO, 0:0 RTO } SPMROOTCR_EL3;

// Extended Hypervisor Configuration Masking Register
__register 64 { 36:36 FNB, 35:35 VTLBIDOSEn, 34:34 NVnTTLBOS, 33:33 NVnTTLBIS, 32:32 NVnTTLB, 31:31 FDIT, 27:27 NVTGE, 26:26 SRMASKEn, 25:25 VTLBIDEn, 24:24 PACMEn, 23:23 EnFPM, 22:22 GCSEn, 21:21 EnIDCP128, 20:20 EnSDERR, 19:19 TMEA, 18:18 EnSNERR, 17:17 D128En, 16:16 PTTWI, 15:15 SCTLR2En, 14:14 TCR2En, 11:11 MSCEn, 10:10 MCE2, 9:9 CMOW, 8:8 VFNMI, 7:7 VINMI, 6:6 TALLINT, 5:5 SMPME, 4:4 FGTnXS, 3:3 FnXS, 2:2 EnASR, 1:1 EnALS, 0:0 EnAS0 } HCRXMASK_EL2;

// MPAM Virtual PARTID Mapping Register 6
__register 64 { 63:48 PhyPARTID27, 47:32 PhyPARTID26, 31:16 PhyPARTID25, 15:0 PhyPARTID24 } MPAMVPM6_EL2;

// ITS Identification Register 2
__register 32 { 6:5 XDMN_EVENTS, 4:0 EVENTID_BITS } ITS_IDR2;

// IRS Identification Register 5
__register 32 { 24:0 SPI_RANGE } IRS_IDR5;

// User Access Override
__register 32 { 23:23 UAO } UAO;

// System Control Register (EL2)
__register 64 { 63:63 TIDCP, 62:62 SPINTMASK, 61:61 NMI, 60:60 EnTP2, 59:59 TCSO, 58:58 TCSO0, 57:57 EPAN, 56:56 EnALS, 55:55 EnAS0, 54:54 EnASR, 49:46 TWEDEL, 45:45 TWEDEn, 44:44 DSSBS, 43:43 ATA, 42:42 ATA0, 41:40 TCF, 39:38 TCF0, 37:37 ITFSB, 36:36 BT, 35:35 BT0, 34:34 EnFPM, 33:33 MSCEn, 32:32 CMOW, 31:31 EnIA, 30:30 EnIB, 29:29 LSMAOE, 28:28 nTLSMD, 27:27 EnDA, 26:26 UCI, 25:25 EE, 24:24 E0E, 23:23 SPAN, 22:22 EIS, 21:21 IESB, 20:20 TSCXT, 19:19 WXN, 18:18 nTWE, 16:16 nTWI, 15:15 UCT, 14:14 DZE, 13:13 EnDB, 12:12 I, 11:11 EOS, 10:10 EnRCTX, 8:8 SED, 7:7 ITD, 6:6 nAA, 5:5 CP15BEN, 4:4 SA0, 3:3 SA, 2:2 C, 1:1 A, 0:0 M } SCTLR_EL2;

// System PMU Counter Group Configuration Registers
array [0..1] of __register 64 {  } SPMCGCR_EL1;

// Interrupt Controller Empty List Register Status Register
__register 32 {  } ICH_ELRSR_EL2;

// Counter-timer Self-Synchronized Physical Count register
__register 64 { 63:0 SSPhysicalCount } CNTPCTSS;

// CTI Device ID register 0
__register 32 { 25:24 INOUT, 21:16 NUMCHAN, 13:8 NUMTRIG, 4:0 EXTMUXNUM } CTIDEVID;

// Interrupt Group Registers
array [0..31] of __register 32 {  } GICD_IGROUPR;

// IRS Save VM Status Register
__register 32 { 1:1 Q, 0:0 IDLE } IRS_SAVE_VM_STATUSR;

// Debug CLAIM Tag Set register
__register 32 {  } DBGCLAIMSET;

// External Debug Watchpoint Address Register
__register 64 { 63:0 ADDR } EDWAR;

// Profiling Buffer Syndrome Register (EL2)
__register 64 { 55:32 MSS2, 31:26 EC, 19:19 DL, 18:18 EA, 17:17 S, 16:16 COLL, 15:0 MSS } PMBSR_EL2;

// CTI Peripheral Identification Register 4
__register 32 { 7:4 SIZE, 3:0 DES_2 } CTIPIDR4;

// AArch64 Auxiliary Feature Register 1
__register 64 {  } ID_AA64AFR1_EL1;

// CONTEXTIDR_EL2 Sample Register
__register 32 { 31:0 CONTEXTIDR_EL2 } PMCID2SR;

// CPU Interface Status Register
__register 32 { 4:4 ASV, 3:3 WROD, 2:2 RWOD, 1:1 WRD, 0:0 RRD } GICC_STATUSR;

// Interrupt Controller Physical PPI Clear Pending State Registers
array [0..1] of __register 64 {  } ICC_PPI_CPENDR_EL1;

// External Debug Peripheral Identification Register 3
__register 32 { 7:4 REVAND, 3:0 CMOD } EDPIDR3;

// ITS Software Error Status Register
__register 64 { 31:24 IMP_EC, 23:16 EC, 3:3 OF, 2:2 S1V, 1:1 S0V, 0:0 V } ITS_SWERR_STATUSR;

// Monitor Debug System Control Register
__register 32 { 50:50 EnSTEPOP, 35:35 EHBWE, 34:34 EnSPM, 33:33 TTA, 32:32 EMBWE, 31:31 TFO, 30:30 RXfull, 29:29 TXfull, 27:27 RXO, 26:26 TXU, 23:22 INTdis, 21:21 TDA, 19:19 SC2, 15:15 MDE, 14:14 HDE, 13:13 KDE, 12:12 TDCC, 6:6 ERR, 0:0 SS } MDSCR_EL1;

// IWB Control Register 0
__register 32 { 1:1 IDLE, 0:0 IWBEN } IWB_CR0;

// Peripheral Identification Register 4
__register 32 { 7:4 SIZE, 3:0 DES_2 } TRBPIDR4;

// Peripheral Identification Register 3
__register 32 { 7:4 REVAND, 3:0 CMOD } ERRPIDR3;

// LORegion Number (EL1)
__register 64 { 7:0 Num } LORN_EL1;

// Data Fault Address Register
__register 32 { 31:0 VA } DFAR;

// Activity Monitors Count Enable Set Register 1
__register 64 {  } AMCNTENSET1_EL0;

// Peripheral Identification Register 2
__register 32 { 7:4 REVISION, 3:3 JEDEC, 2:0 DES_1 } ERRPIDR2;

// Counter Status Register
__register 32 { 17:8 FCACK, 1:1 DBGH } CNTSR;

// Performance Monitors Peripheral Identification Register 4
__register 32 { 7:4 SIZE, 3:0 DES_2 } PMPIDR4;

// Cache Type Register
__register 32 { 29:29 DIC, 28:28 IDC, 27:24 CWG, 23:20 ERG, 19:16 DminLine, 15:14 L1Ip, 3:0 IminLine } CTR;

// Selected Error Record Miscellaneous Register 2
__register 32 { 31:0 ERRnMISC1lo } ERXMISC2;

// Hyp IPA Fault Address Register
__register 32 { 31:4 FIPA } HPFAR;

// Error Record ID Register
__register 64 { 15:0 NUM } ERRIDR_EL1;

// Counter-timer Self-Synchronized Physical Count Register
__register 64 { 63:0 SSPhysicalCount } CNTPCTSS_EL0;

// MPAM Partition Configuration Enable Flags Register
__register 32 {  } MPAMCFG_EN_FLAGS;

// Permission Overlay Register 3 (EL3)
__register 64 {  } POR_EL3;

// IRS VPE HPPI Register
__register 64 { 32:32 HPPIV, 31:29 TYPE, 23:0 ID } IRS_VPE_HPPIR;

// Interrupt Controller Non-maskable Interrupt Acknowledge Register 1
__register 64 { 23:0 INTID } ICC_NMIAR1_EL1;

// Device Architecture Register
__register 32 { 31:21 ARCHITECT, 20:20 PRESENT, 19:16 REVISION, 15:12 ARCHVER, 11:0 ARCHPART } ERRDEVARCH;

// Interrupt Configuration Registers (Extended SPI Range)
array [0..63] of __register 32 {  } GICD_ICFGRE;

// FCSE Process ID register
__register 32 {  } FCSEIDR;

// Debug Watchpoint Fault Address Register
__register 32 {  } DBGWFAR;

// Error Recovery Interrupt Configuration Register 1
__register 32 { 31:0 DATA } ERRERICR1;

// PL1 Software Thread ID Register
__register 32 { 31:0 TID } TPIDRPRW;

// Trace Peripheral Identification Register 6
__register 32 {  } TRCPIDR6;

// GIC PMU Event Filter Register
array [0..63] of __register 64 { 47:32 EVENT_ID, 31:0 DEVICE_ID, 47:32 VM_ID, 31:29 TYPE, 23:0 ID } GIC_PMEVFILTR;

// Performance Monitors Selected Event Count Register
__register 32 {  } PMXEVCNTR_EL0;

