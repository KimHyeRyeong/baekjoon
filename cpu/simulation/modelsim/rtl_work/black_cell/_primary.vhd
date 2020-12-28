library verilog;
use verilog.vl_types.all;
entity black_cell is
    port(
        Pim             : in     vl_logic;
        Gim             : in     vl_logic;
        Pmj             : in     vl_logic;
        Gmj             : in     vl_logic;
        P               : out    vl_logic;
        G               : out    vl_logic
    );
end black_cell;
