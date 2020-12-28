library verilog;
use verilog.vl_types.all;
entity carry_eval_cell is
    port(
        Pi0             : in     vl_logic;
        Gi0             : in     vl_logic;
        c0              : in     vl_logic;
        ci              : out    vl_logic
    );
end carry_eval_cell;
