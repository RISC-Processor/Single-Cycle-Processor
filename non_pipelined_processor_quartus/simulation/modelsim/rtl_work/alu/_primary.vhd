library verilog;
use verilog.vl_types.all;
entity alu is
    generic(
        BUS_WIDTH       : integer := 32
    );
    port(
        src_a           : in     vl_logic_vector;
        src_b           : in     vl_logic_vector;
        alu_op          : in     vl_logic_vector(2 downto 0);
        alu_result      : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BUS_WIDTH : constant is 1;
end alu;
