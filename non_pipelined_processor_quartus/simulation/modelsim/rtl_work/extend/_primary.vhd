library verilog;
use verilog.vl_types.all;
entity extend is
    generic(
        DATA_BUS_WIDTH  : integer := 32
    );
    port(
        imm             : in     vl_logic_vector(11 downto 0);
        extended_imm    : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_BUS_WIDTH : constant is 1;
end extend;
