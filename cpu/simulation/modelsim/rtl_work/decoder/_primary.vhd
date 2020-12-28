library verilog;
use verilog.vl_types.all;
entity decoder is
    port(
        instr           : in     vl_logic_vector(15 downto 0);
        unary           : out    vl_logic;
        sgned           : out    vl_logic;
        imode           : out    vl_logic;
        aluop           : out    vl_logic_vector(3 downto 0);
        setcc           : out    vl_logic;
        rD              : out    vl_logic_vector(2 downto 0);
        rA              : out    vl_logic_vector(2 downto 0);
        rB              : out    vl_logic_vector(2 downto 0);
        imm             : out    vl_logic_vector(3 downto 0);
        wben            : out    vl_logic
    );
end decoder;
