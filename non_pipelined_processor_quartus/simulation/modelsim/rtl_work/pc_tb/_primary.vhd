library verilog;
use verilog.vl_types.all;
entity pc_tb is
    generic(
        BUS_WIDTH       : integer := 16
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BUS_WIDTH : constant is 1;
end pc_tb;
