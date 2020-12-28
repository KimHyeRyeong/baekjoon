library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        valA            : in     vl_logic_vector(15 downto 0);
        valB            : in     vl_logic_vector(15 downto 0);
        aluop           : in     vl_logic_vector(3 downto 0);
        cc              : out    vl_logic_vector(3 downto 0);
        result          : out    vl_logic_vector(15 downto 0)
    );
end ALU;
