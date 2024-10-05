library verilog;
use verilog.vl_types.all;
entity processor is
    generic(
        BUS_WIDTH       : integer := 32
    );
    port(
        clk             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BUS_WIDTH : constant is 1;
end processor;
