# Linux Requirements

## Drivers

### Qualcomm Inter-Processor Communication Controller

#### qcom_ipcc_domain_map

**UID**: `REQ-001`  
**Status**: `Active`  
**Relations**:
- **Type**: `File`  
  **Path**: `drivers/mailbox/qcom-ipcc.c`  
  **Element**: `function`  
  **ID**: `qcom_ipcc_domain_map`  
  **Hash**: `5c2e9a1b7d4f8c3a6e0b2d1f9a7c5e3b8d6f1a4c2e9b7d0f3a5c8e1b6d2f4a9`

**Statement**:
The Qualcomm Inter-Processor Communication Controller driver shall support the
creation of virtual IRQs for each processor X channel combination. It shall
therefore hook into irq_domain by registering a .map file-op.

**Rationale**:
Representing as proper Linux IRQs gets all the infrastructure (masking,
chaining from the summary IRQ) wired up.
