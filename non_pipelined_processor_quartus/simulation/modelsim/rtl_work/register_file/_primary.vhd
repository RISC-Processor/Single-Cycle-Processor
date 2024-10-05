library verilog;
use verilog.vl_types.all;
entity register_file is
    generic(
        ADDR_BUS_WIDTH  : integer := 5;
        DATA_BUS_WIDTH  : integer := 32
    );
    port(
        clk             : in     vl_logic;
        addr1           : in     vl_logic_vector;
        addr2           : in     vl_logic_vector;
        addr3           : in     vl_logic_vector;
        write_data      : in     vl_logic_vector;
        write_en        : in     vl_logic;
        read_data1      : out    vl_logic_vector;
        read_data2      : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDR_BUS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DATA_BUS_WIDTH : constant is 1;
end register_file;
