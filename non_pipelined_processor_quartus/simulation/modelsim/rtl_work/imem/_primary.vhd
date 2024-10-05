library verilog;
use verilog.vl_types.all;
entity imem is
    generic(
        ADDR_BUS_WIDTH  : integer := 5;
        DATA_BUS_WIDTH  : integer := 32
    );
    port(
        a               : in     vl_logic_vector;
        rd              : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDR_BUS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DATA_BUS_WIDTH : constant is 1;
end imem;
