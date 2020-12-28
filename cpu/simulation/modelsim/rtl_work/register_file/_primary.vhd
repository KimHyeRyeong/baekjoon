library verilog;
use verilog.vl_types.all;
entity register_file is
    port(
        clk             : in     vl_logic;
        nRESET          : in     vl_logic;
        write_enable    : in     vl_logic;
        write_addr      : in     vl_logic_vector(2 downto 0);
        write_data      : in     vl_logic_vector(15 downto 0);
        read_addr_A     : in     vl_logic_vector(2 downto 0);
        read_addr_B     : in     vl_logic_vector(2 downto 0);
        read_data_A     : out    vl_logic_vector(15 downto 0);
        read_data_B     : out    vl_logic_vector(15 downto 0)
    );
end register_file;
