library verilog;
use verilog.vl_types.all;
entity cpu is
    port(
        clk             : in     vl_logic;
        nRESET          : in     vl_logic
    );
end cpu;
