# Linux Tests

## Drivers

### Qualcomm Inter-Processor Communication Controller

#### Test for qcom_ipcc_domain_map

**UID**: `TEST-001`  
**Relations**:
- **Type**: Parent  
  **ID**: `REQ-001`
- **Type**: `File`  
  **Path**: `kernel/irq/irq_test.c`  
  **Element**: `function`  
  **ID**: `irq_disable_depth_test`

**Statement**:
TBD: There's no related test. But if it was we could write the test
expectations here:
- something
- something else

and link to the kunit test function by file relation.
