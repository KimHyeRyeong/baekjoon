library verilog;
use verilog.vl_types.all;
entity memory is
    port(
        clk             : in     vl_logic;
        op              : in     vl_logic;
        addr            : in     vl_logic_vector(15 downto 0);
        data            : out    vl_logic_vector(15 downto 0)
    );
end memory;
