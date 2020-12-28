library verilog;
use verilog.vl_types.all;
entity input_cell is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        p               : out    vl_logic;
        g               : out    vl_logic
    );
end input_cell;
