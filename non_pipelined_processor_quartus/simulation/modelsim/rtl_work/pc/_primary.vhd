library verilog;
use verilog.vl_types.all;
entity pc is
    generic(
        BUS_WIDTH       : integer := 16
    );
    port(
        clk             : in     vl_logic;
        pc_next         : in     vl_logic_vector;
        pc              : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BUS_WIDTH : constant is 1;
end pc;
