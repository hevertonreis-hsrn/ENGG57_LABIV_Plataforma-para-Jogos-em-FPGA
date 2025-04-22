`define LOG_LEVEL_NONE   0
`define LOG_LEVEL_ERROR  1
`define LOG_LEVEL_WARN   2
`define LOG_LEVEL_INFO   3
`define LOG_LEVEL_DEBUG  4
`define CURRENT_LOG_LEVEL `LOG_LEVEL_DEBUG

`define LOG_ERROR(msg) \
    if (`CURRENT_LOG_LEVEL >= `LOG_LEVEL_ERROR) \
        $display("[ERROR] %s:%0d: %s", `__FILE__, `__LINE__, msg);

`define LOG_WARN(msg) \
    if (`CURRENT_LOG_LEVEL >= `LOG_LEVEL_WARN) \
        $display("[WARN] %s:%0d: %s", `__FILE__, `__LINE__, msg);

`define LOG_INFO(msg) \
    if (`CURRENT_LOG_LEVEL >= `LOG_LEVEL_INFO) \
        $display("[INFO] %s:%0d: %s", `__FILE__, `__LINE__, msg);

`define LOG_DEBUG(msg) \
    if (`CURRENT_LOG_LEVEL >= `LOG_LEVEL_DEBUG) \
        $display("[DEBUG] %s:%0d: %s", `__FILE__, `__LINE__, msg);