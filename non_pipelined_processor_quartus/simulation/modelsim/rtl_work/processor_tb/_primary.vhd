library verilog;
use verilog.vl_types.all;
entity processor_tb is
    generic(
        BUS_WIDTH       : integer := 32
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BUS_WIDTH : constant is 1;
end processor_tb;
