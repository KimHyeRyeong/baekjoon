library verilog;
use verilog.vl_types.all;
entity barrel_rotator is
    port(
        \in\            : in     vl_logic_vector(15 downto 0);
        shift           : in     vl_logic_vector(15 downto 0);
        lr              : in     vl_logic;
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end barrel_rotator;
