// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
// Date        : Thu Aug 23 15:30:01 2018
// Host        : DESKTOP-OR6PTN3 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/PSUProj/ece361f18/pep9Verilog/sim/pep9Verilog/pep9Verilog.sim/sim_1/impl/func/xsim/Top_Pep9CPU_func_impl.v
// Design      : Top_Pep9CPU
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ALU
   (CCk,
    C_OBUF,
    VCk,
    V_OBUF,
    Z_OBUF,
    N_OBUF,
    \AluOpt_C_reg[3]_0 ,
    CO,
    O,
    \AluOpt_C_reg[3]_1 ,
    Cout_reg_0,
    \AluOpt_C_reg[7]_0 ,
    C_reg_0,
    V_reg_0,
    Q,
    \AluOpt_C_reg[6]_0 ,
    \AluOpt_C_reg[3]_2 ,
    Ex_reg,
    Sysclk_IBUF_BUFG,
    C3_out,
    V1_out,
    \AluOpt_C_reg[7]_1 ,
    AluInp1_A,
    \Bbus_reg[7] ,
    \Bbus_reg[7]_0 ,
    p_0_in,
    \Bbus_reg[7]_1 ,
    S,
    Ex_reg_0,
    Ex_reg_1,
    \alu_ctrl_reg[1] ,
    \Abus_reg[7] ,
    Cin_IBUF,
    \Abus_reg[7]_0 ,
    D,
    lopt,
    lopt_1,
    lopt_2,
    lopt_3,
    lopt_4,
    lopt_5,
    lopt_6,
    lopt_7);
  output CCk;
  output C_OBUF;
  output VCk;
  output V_OBUF;
  output Z_OBUF;
  output N_OBUF;
  output [3:0]\AluOpt_C_reg[3]_0 ;
  output [0:0]CO;
  output [3:0]O;
  output [3:0]\AluOpt_C_reg[3]_1 ;
  output [0:0]Cout_reg_0;
  output [3:0]\AluOpt_C_reg[7]_0 ;
  output C_reg_0;
  output V_reg_0;
  output [7:0]Q;
  output \AluOpt_C_reg[6]_0 ;
  output \AluOpt_C_reg[3]_2 ;
  input Ex_reg;
  input Sysclk_IBUF_BUFG;
  input C3_out;
  input V1_out;
  input \AluOpt_C_reg[7]_1 ;
  input [0:0]AluInp1_A;
  input [3:0]\Bbus_reg[7] ;
  input [3:0]\Bbus_reg[7]_0 ;
  input [3:0]p_0_in;
  input [3:0]\Bbus_reg[7]_1 ;
  input [0:0]S;
  input Ex_reg_0;
  input Ex_reg_1;
  input \alu_ctrl_reg[1] ;
  input [3:0]\Abus_reg[7] ;
  input Cin_IBUF;
  input [0:0]\Abus_reg[7]_0 ;
  input [7:0]D;
  output lopt;
  output lopt_1;
  output lopt_2;
  output lopt_3;
  output lopt_4;
  output lopt_5;
  output lopt_6;
  output lopt_7;

  wire [3:0]\Abus_reg[7] ;
  wire [0:0]\Abus_reg[7]_0 ;
  wire [0:0]AluInp1_A;
  wire \AluOpt_C0_inferred__1/i__carry_n_0 ;
  wire \AluOpt_C0_inferred__2/i__carry_n_0 ;
  wire \AluOpt_C_reg[0]_lopt_replica_1 ;
  wire \AluOpt_C_reg[1]_lopt_replica_1 ;
  wire \AluOpt_C_reg[2]_lopt_replica_1 ;
  wire [3:0]\AluOpt_C_reg[3]_0 ;
  wire [3:0]\AluOpt_C_reg[3]_1 ;
  wire \AluOpt_C_reg[3]_2 ;
  wire \AluOpt_C_reg[3]_lopt_replica_1 ;
  wire \AluOpt_C_reg[4]_lopt_replica_1 ;
  wire \AluOpt_C_reg[5]_lopt_replica_1 ;
  wire \AluOpt_C_reg[6]_0 ;
  wire \AluOpt_C_reg[6]_lopt_replica_1 ;
  wire [3:0]\AluOpt_C_reg[7]_0 ;
  wire \AluOpt_C_reg[7]_1 ;
  wire \AluOpt_C_reg[7]_lopt_replica_1 ;
  wire [3:0]\Bbus_reg[7] ;
  wire [3:0]\Bbus_reg[7]_0 ;
  wire [3:0]\Bbus_reg[7]_1 ;
  wire C3_out;
  wire CCk;
  wire CCk_i_1_n_0;
  wire [0:0]CO;
  wire C_OBUF;
  wire C_i_2_n_0;
  wire C_reg_0;
  wire Cin_IBUF;
  wire [0:0]Cout_reg_0;
  wire [7:0]D;
  wire Ex_reg;
  wire Ex_reg_0;
  wire Ex_reg_1;
  wire NCk;
  wire NCk_i_1_n_0;
  wire N_OBUF;
  wire N_i_1_n_0;
  wire Nout;
  wire [3:0]O;
  wire [7:0]\^Q ;
  wire [0:0]S;
  wire Sysclk_IBUF_BUFG;
  wire V1_out;
  wire VCk;
  wire VCk_i_1_n_0;
  wire V_OBUF;
  wire V_i_2_n_0;
  wire V_reg_0;
  wire ZCk;
  wire ZCk_i_1_n_0;
  wire Z_OBUF;
  wire Z_i_1_n_0;
  wire Zout_i_1_n_0;
  wire Zout_i_2_n_0;
  wire Zout_reg_n_0;
  wire \alu_ctrl_reg[1] ;
  wire [3:0]p_0_in;
  wire [2:0]\NLW_AluOpt_C0_inferred__1/i__carry_CO_UNCONNECTED ;
  wire [2:0]\NLW_AluOpt_C0_inferred__1/i__carry__0_CO_UNCONNECTED ;
  wire [2:0]\NLW_AluOpt_C0_inferred__2/i__carry_CO_UNCONNECTED ;
  wire [2:0]\NLW_AluOpt_C0_inferred__2/i__carry__0_CO_UNCONNECTED ;

  assign Q[7] = \^Q [7];
  assign lopt = \AluOpt_C_reg[0]_lopt_replica_1 ;
  assign lopt_1 = \AluOpt_C_reg[1]_lopt_replica_1 ;
  assign lopt_2 = \AluOpt_C_reg[2]_lopt_replica_1 ;
  assign lopt_3 = \AluOpt_C_reg[3]_lopt_replica_1 ;
  assign lopt_4 = \AluOpt_C_reg[4]_lopt_replica_1 ;
  assign lopt_5 = \AluOpt_C_reg[5]_lopt_replica_1 ;
  assign lopt_6 = \AluOpt_C_reg[6]_lopt_replica_1 ;
  assign lopt_7 = \AluOpt_C_reg[7]_lopt_replica_1 ;
  CARRY4 \AluOpt_C0_inferred__1/i__carry 
       (.CI(1'b0),
        .CO({\AluOpt_C0_inferred__1/i__carry_n_0 ,\NLW_AluOpt_C0_inferred__1/i__carry_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({AluInp1_A,AluInp1_A,AluInp1_A,AluInp1_A}),
        .O(\AluOpt_C_reg[3]_0 ),
        .S(\Bbus_reg[7] ));
  CARRY4 \AluOpt_C0_inferred__1/i__carry__0 
       (.CI(\AluOpt_C0_inferred__1/i__carry_n_0 ),
        .CO({CO,\NLW_AluOpt_C0_inferred__1/i__carry__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({AluInp1_A,1'b0,1'b0,1'b0}),
        .O(O),
        .S(\Bbus_reg[7]_0 ));
  CARRY4 \AluOpt_C0_inferred__2/i__carry 
       (.CI(1'b0),
        .CO({\AluOpt_C0_inferred__2/i__carry_n_0 ,\NLW_AluOpt_C0_inferred__2/i__carry_CO_UNCONNECTED [2:0]}),
        .CYINIT(p_0_in[0]),
        .DI({AluInp1_A,AluInp1_A,AluInp1_A,AluInp1_A}),
        .O(\AluOpt_C_reg[3]_1 ),
        .S(\Bbus_reg[7]_1 ));
  CARRY4 \AluOpt_C0_inferred__2/i__carry__0 
       (.CI(\AluOpt_C0_inferred__2/i__carry_n_0 ),
        .CO({Cout_reg_0,\NLW_AluOpt_C0_inferred__2/i__carry__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({AluInp1_A,1'b0,1'b0,1'b0}),
        .O(\AluOpt_C_reg[7]_0 ),
        .S({S,p_0_in[3:1]}));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \AluOpt_C[3]_i_5 
       (.I0(\Abus_reg[7] [1]),
        .I1(Cin_IBUF),
        .I2(\Abus_reg[7] [0]),
        .I3(\Abus_reg[7] [2]),
        .O(\AluOpt_C_reg[3]_2 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \AluOpt_C[6]_i_5 
       (.I0(\Abus_reg[7] [3]),
        .I1(\Abus_reg[7] [1]),
        .I2(Cin_IBUF),
        .I3(\Abus_reg[7] [0]),
        .I4(\Abus_reg[7] [2]),
        .I5(\Abus_reg[7]_0 ),
        .O(\AluOpt_C_reg[6]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[0] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[0]),
        .Q(\^Q [0]),
        .R(1'b0));
  (* OPT_INSERTED_REPDRIVER *) 
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[0]_lopt_replica 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[0]),
        .Q(\AluOpt_C_reg[0]_lopt_replica_1 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[1] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[1]),
        .Q(\^Q [1]),
        .R(1'b0));
  (* OPT_INSERTED_REPDRIVER *) 
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[1]_lopt_replica 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[1]),
        .Q(\AluOpt_C_reg[1]_lopt_replica_1 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[2] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[2]),
        .Q(\^Q [2]),
        .R(1'b0));
  (* OPT_INSERTED_REPDRIVER *) 
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[2]_lopt_replica 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[2]),
        .Q(\AluOpt_C_reg[2]_lopt_replica_1 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[3] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[3]),
        .Q(\^Q [3]),
        .R(1'b0));
  (* OPT_INSERTED_REPDRIVER *) 
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[3]_lopt_replica 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[3]),
        .Q(\AluOpt_C_reg[3]_lopt_replica_1 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[4] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[4]),
        .Q(\^Q [4]),
        .R(1'b0));
  (* OPT_INSERTED_REPDRIVER *) 
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[4]_lopt_replica 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[4]),
        .Q(\AluOpt_C_reg[4]_lopt_replica_1 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[5] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[5]),
        .Q(\^Q [5]),
        .R(1'b0));
  (* OPT_INSERTED_REPDRIVER *) 
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[5]_lopt_replica 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[5]),
        .Q(\AluOpt_C_reg[5]_lopt_replica_1 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[6] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[6]),
        .Q(\^Q [6]),
        .R(1'b0));
  (* OPT_INSERTED_REPDRIVER *) 
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[6]_lopt_replica 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[6]),
        .Q(\AluOpt_C_reg[6]_lopt_replica_1 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[7] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[7]),
        .Q(\^Q [7]),
        .R(1'b0));
  (* OPT_INSERTED_REPDRIVER *) 
  FDRE #(
    .INIT(1'b0)) 
    \AluOpt_C_reg[7]_lopt_replica 
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(D[7]),
        .Q(\AluOpt_C_reg[7]_lopt_replica_1 ),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    CCk_i_1
       (.I0(CCk),
        .O(CCk_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    CCk_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(CCk_i_1_n_0),
        .Q(CCk),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    C_i_2
       (.I0(CCk),
        .I1(C_reg_0),
        .O(C_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    C_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(C3_out),
        .D(C_i_2_n_0),
        .Q(C_OBUF),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    Cout_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(Ex_reg_0),
        .Q(C_reg_0),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    NCk_i_1
       (.I0(NCk),
        .O(NCk_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    NCk_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(NCk_i_1_n_0),
        .Q(NCk),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    N_i_1
       (.I0(Ex_reg),
        .I1(NCk),
        .O(N_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    N_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(N_i_1_n_0),
        .D(Nout),
        .Q(N_OBUF),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    Nout_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(\AluOpt_C_reg[7]_1 ),
        .Q(Nout),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    VCk_i_1
       (.I0(VCk),
        .O(VCk_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    VCk_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(VCk_i_1_n_0),
        .Q(VCk),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    V_i_2
       (.I0(VCk),
        .I1(V_reg_0),
        .O(V_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    V_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(V1_out),
        .D(V_i_2_n_0),
        .Q(V_OBUF),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    Vout_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(Ex_reg_1),
        .Q(V_reg_0),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    ZCk_i_1
       (.I0(ZCk),
        .O(ZCk_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ZCk_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(ZCk_i_1_n_0),
        .Q(ZCk),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    Z_i_1
       (.I0(Ex_reg),
        .I1(ZCk),
        .O(Z_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Z_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(Z_i_1_n_0),
        .D(Zout_reg_n_0),
        .Q(Z_OBUF),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    Zout_i_1
       (.I0(Zout_i_2_n_0),
        .I1(\^Q [5]),
        .I2(\^Q [2]),
        .I3(\^Q [4]),
        .I4(\^Q [3]),
        .I5(\alu_ctrl_reg[1] ),
        .O(Zout_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    Zout_i_2
       (.I0(\^Q [1]),
        .I1(\^Q [0]),
        .I2(\^Q [6]),
        .I3(\^Q [7]),
        .O(Zout_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Zout_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(Ex_reg),
        .D(Zout_i_1_n_0),
        .Q(Zout_reg_n_0),
        .R(1'b0));
endmodule

module Decode
   (\FSM_sequential_state_reg[1] ,
    \FSM_sequential_state_reg[0] ,
    D,
    AluInp1_A,
    V1_out,
    C3_out,
    \AluOpt_C_reg[4] ,
    Zout_reg,
    Nout_reg,
    S,
    p_0_in,
    \AluOpt_C_reg[3] ,
    \AluOpt_C_reg[6] ,
    \AluOpt_C_reg[3]_0 ,
    \Bbus_reg[7]_i_7 ,
    Vout_reg,
    Cout_reg,
    \AluOpt_C_reg[3]_1 ,
    InstructionSpecifier_IBUF,
    Sysclk_IBUF_BUFG,
    out,
    Ex_reg,
    in0,
    Dec_reg,
    resetbar_IBUF,
    St_reg,
    VCk,
    CCk,
    O,
    \Abus_reg[7] ,
    \Abus_reg[7]_0 ,
    \Abus_reg[7]_1 ,
    Q,
    \Abus_reg[7]_2 ,
    Cin_IBUF,
    \Abus_reg[7]_3 ,
    CO,
    \Abus_reg[7]_4 ,
    \InstructionSpecifier[1] ,
    \Bbus_reg[7]_i_7_0 ,
    Vout_reg_0,
    Cout_reg_0);
  output \FSM_sequential_state_reg[1] ;
  output \FSM_sequential_state_reg[0] ;
  output [7:0]D;
  output [0:0]AluInp1_A;
  output V1_out;
  output C3_out;
  output [0:0]\AluOpt_C_reg[4] ;
  output Zout_reg;
  output Nout_reg;
  output [3:0]S;
  output [0:0]p_0_in;
  output [3:0]\AluOpt_C_reg[3] ;
  output [3:0]\AluOpt_C_reg[6] ;
  output [3:0]\AluOpt_C_reg[3]_0 ;
  output \Bbus_reg[7]_i_7 ;
  output Vout_reg;
  output Cout_reg;
  output [3:0]\AluOpt_C_reg[3]_1 ;
  input [7:0]InstructionSpecifier_IBUF;
  input Sysclk_IBUF_BUFG;
  input [1:0]out;
  input Ex_reg;
  input [1:0]in0;
  input Dec_reg;
  input resetbar_IBUF;
  input St_reg;
  input VCk;
  input CCk;
  input [3:0]O;
  input [3:0]\Abus_reg[7] ;
  input [3:0]\Abus_reg[7]_0 ;
  input \Abus_reg[7]_1 ;
  input [0:0]Q;
  input [3:0]\Abus_reg[7]_2 ;
  input Cin_IBUF;
  input \Abus_reg[7]_3 ;
  input [0:0]CO;
  input [0:0]\Abus_reg[7]_4 ;
  input \InstructionSpecifier[1] ;
  input \Bbus_reg[7]_i_7_0 ;
  input Vout_reg_0;
  input Cout_reg_0;

  wire \A[1]_i_1_n_0 ;
  wire \A[1]_i_2_n_0 ;
  wire \A[2]_i_1_n_0 ;
  wire \A[2]_i_2_n_0 ;
  wire \A_reg_n_0_[1] ;
  wire \A_reg_n_0_[2] ;
  wire [3:0]\Abus_reg[7] ;
  wire [3:0]\Abus_reg[7]_0 ;
  wire \Abus_reg[7]_1 ;
  wire [3:0]\Abus_reg[7]_2 ;
  wire \Abus_reg[7]_3 ;
  wire [0:0]\Abus_reg[7]_4 ;
  wire [0:0]AluInp1_A;
  wire \AluOpt_C[7]_i_3_n_0 ;
  wire [3:0]\AluOpt_C_reg[3] ;
  wire [3:0]\AluOpt_C_reg[3]_0 ;
  wire [3:0]\AluOpt_C_reg[3]_1 ;
  wire [0:0]\AluOpt_C_reg[4] ;
  wire [3:0]\AluOpt_C_reg[6] ;
  wire C3_out;
  wire CCk;
  wire [0:0]CO;
  wire Cin_IBUF;
  wire Cout_i_3_n_0;
  wire Cout_i_5_n_0;
  wire Cout_reg;
  wire Cout_reg_0;
  wire [7:0]D;
  wire DecInputs_n_23;
  wire Dec_reg;
  wire DoneDec;
  wire DoneDec_i_1_n_0;
  wire Ex_reg;
  wire \FSM_onehot_DecodeState[3]_i_1_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_DecodeState_reg_n_0_[0] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_DecodeState_reg_n_0_[1] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_DecodeState_reg_n_0_[2] ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_3_n_0 ;
  wire \FSM_sequential_state_reg[0] ;
  wire \FSM_sequential_state_reg[1] ;
  wire [7:0]InstructionSpecifier_IBUF;
  (* RTL_KEEP = "yes" *) wire LoadCk;
  wire LoadCk_i_1_n_0;
  wire LoadCk_reg_n_0;
  wire Nout_reg;
  wire [3:0]O;
  wire [0:0]Q;
  wire [3:0]S;
  wire St_reg;
  wire Sysclk_IBUF_BUFG;
  wire V1_out;
  wire VCk;
  wire Vout_i_3_n_0;
  wire Vout_reg;
  wire Vout_reg_0;
  wire Zout_reg;
  wire [3:0]alu_control;
  wire \alu_ctrl[0]_i_1_n_0 ;
  wire \alu_ctrl[1]_i_1_n_0 ;
  wire \alu_ctrl[2]_i_1_n_0 ;
  wire \alu_ctrl[3]_i_1_n_0 ;
  wire \alu_ctrl[3]_i_2_n_0 ;
  wire \alu_ctrl[3]_i_3_n_0 ;
  wire \alu_ctrl[3]_i_4_n_0 ;
  wire \alu_ctrl[3]_i_5_n_0 ;
  wire [1:0]out;
  wire [0:0]p_0_in;
  wire r;
  wire r_i_1_n_0;
  wire resetbar_IBUF;
  wire \NLW_DecInputs_Bbus_reg[7]_i_7_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h88B8FFFF88B80000)) 
    \A[1]_i_1 
       (.I0(r),
        .I1(r_i_1_n_0),
        .I2(InstructionSpecifier_IBUF[3]),
        .I3(\A[1]_i_2_n_0 ),
        .I4(\A[2]_i_2_n_0 ),
        .I5(\A_reg_n_0_[1] ),
        .O(\A[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \A[1]_i_2 
       (.I0(InstructionSpecifier_IBUF[6]),
        .I1(InstructionSpecifier_IBUF[5]),
        .O(\A[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0111FFFF01110000)) 
    \A[2]_i_1 
       (.I0(InstructionSpecifier_IBUF[7]),
        .I1(InstructionSpecifier_IBUF[5]),
        .I2(Dec_reg),
        .I3(\alu_ctrl[3]_i_2_n_0 ),
        .I4(\A[2]_i_2_n_0 ),
        .I5(\A_reg_n_0_[2] ),
        .O(\A[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA0AAA80200000002)) 
    \A[2]_i_2 
       (.I0(Dec_reg),
        .I1(InstructionSpecifier_IBUF[4]),
        .I2(InstructionSpecifier_IBUF[5]),
        .I3(InstructionSpecifier_IBUF[6]),
        .I4(InstructionSpecifier_IBUF[7]),
        .I5(\FSM_onehot_DecodeState_reg_n_0_[2] ),
        .O(\A[2]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[1] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\A[1]_i_1_n_0 ),
        .Q(\A_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[2] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\A[2]_i_1_n_0 ),
        .Q(\A_reg_n_0_[2] ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \AluOpt_C[7]_i_3 
       (.I0(alu_control[3]),
        .I1(alu_control[2]),
        .O(\AluOpt_C[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA00200000)) 
    C_i_1
       (.I0(Ex_reg),
        .I1(alu_control[0]),
        .I2(alu_control[1]),
        .I3(alu_control[2]),
        .I4(alu_control[3]),
        .I5(CCk),
        .O(C3_out));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hAAAAAABA)) 
    Cout_i_3
       (.I0(alu_control[3]),
        .I1(DecInputs_n_23),
        .I2(alu_control[2]),
        .I3(alu_control[0]),
        .I4(alu_control[1]),
        .O(Cout_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    Cout_i_5
       (.I0(alu_control[0]),
        .I1(alu_control[1]),
        .I2(alu_control[2]),
        .I3(alu_control[3]),
        .O(Cout_i_5_n_0));
  RegSet DecInputs
       (.\A_reg[1] (\A_reg_n_0_[1] ),
        .\A_reg[2] (\A_reg_n_0_[2] ),
        .\Abus_reg[7]_0 (\Abus_reg[7] ),
        .\Abus_reg[7]_1 (\Abus_reg[7]_0 ),
        .\Abus_reg[7]_2 (\Abus_reg[7]_1 ),
        .\Abus_reg[7]_3 (\Abus_reg[7]_2 ),
        .\Abus_reg[7]_4 (\Abus_reg[7]_3 ),
        .\Abus_reg[7]_5 (\Abus_reg[7]_4 ),
        .\AluOpt_C_reg[3] (\AluOpt_C_reg[3] ),
        .\AluOpt_C_reg[3]_0 (\AluOpt_C_reg[3]_0 ),
        .\AluOpt_C_reg[3]_1 (\AluOpt_C_reg[3]_1 ),
        .\AluOpt_C_reg[4] (\AluOpt_C_reg[4] ),
        .\AluOpt_C_reg[6] (\AluOpt_C_reg[6] ),
        .\AluOpt_C_reg[7] (Q),
        .\Bbus_reg[7]_i_7 (\NLW_DecInputs_Bbus_reg[7]_i_7_UNCONNECTED ),
        .CO(CO),
        .Cin_IBUF(Cin_IBUF),
        .Cout_reg(DecInputs_n_23),
        .Cout_reg_0(Cout_reg),
        .Cout_reg_1(Cout_reg_0),
        .D(D),
        .DI(AluInp1_A),
        .Ex_reg(Ex_reg),
        .LoadCk_reg(LoadCk_reg_n_0),
        .O(O),
        .Q(alu_control),
        .S(S),
        .Sysclk_IBUF_BUFG(Sysclk_IBUF_BUFG),
        .Vout_reg(Vout_reg),
        .Vout_reg_0(Vout_reg_0),
        .\alu_ctrl_reg[0] (Cout_i_5_n_0),
        .\alu_ctrl_reg[1] (Vout_i_3_n_0),
        .\alu_ctrl_reg[3] (\AluOpt_C[7]_i_3_n_0 ),
        .\alu_ctrl_reg[3]_0 (Cout_i_3_n_0),
        .p_0_in(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'hE)) 
    DoneDec_i_1
       (.I0(DoneDec),
        .I1(Dec_reg),
        .O(DoneDec_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    DoneDec_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(DoneDec_i_1_n_0),
        .Q(DoneDec),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h0000FE00)) 
    \FSM_onehot_DecodeState[3]_i_1 
       (.I0(\FSM_onehot_DecodeState_reg_n_0_[2] ),
        .I1(\FSM_onehot_DecodeState_reg_n_0_[0] ),
        .I2(\FSM_onehot_DecodeState_reg_n_0_[1] ),
        .I3(Dec_reg),
        .I4(\alu_ctrl[3]_i_2_n_0 ),
        .O(\FSM_onehot_DecodeState[3]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    \FSM_onehot_DecodeState_reg[0] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(\FSM_onehot_DecodeState[3]_i_1_n_0 ),
        .D(1'b0),
        .Q(\FSM_onehot_DecodeState_reg_n_0_[0] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_DecodeState_reg[1] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(\FSM_onehot_DecodeState[3]_i_1_n_0 ),
        .D(\FSM_onehot_DecodeState_reg_n_0_[0] ),
        .Q(\FSM_onehot_DecodeState_reg_n_0_[1] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_DecodeState_reg[2] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(\FSM_onehot_DecodeState[3]_i_1_n_0 ),
        .D(\FSM_onehot_DecodeState_reg_n_0_[1] ),
        .Q(\FSM_onehot_DecodeState_reg_n_0_[2] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "iSTATE:0001,iSTATE0:0010,iSTATE1:0100,iSTATE2:1000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_DecodeState_reg[3] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(\FSM_onehot_DecodeState[3]_i_1_n_0 ),
        .D(\FSM_onehot_DecodeState_reg_n_0_[2] ),
        .Q(LoadCk),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFF7FCCCC)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(DoneDec),
        .I1(out[0]),
        .I2(Dec_reg),
        .I3(out[1]),
        .I4(\FSM_sequential_state[1]_i_3_n_0 ),
        .O(\FSM_sequential_state_reg[0] ));
  LUT5 #(
    .INIT(32'h3044FF00)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(out[0]),
        .I2(Ex_reg),
        .I3(out[1]),
        .I4(\FSM_sequential_state[1]_i_3_n_0 ),
        .O(\FSM_sequential_state_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(Dec_reg),
        .I1(DoneDec),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDDFFF3FF11FFF3FF)) 
    \FSM_sequential_state[1]_i_3 
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(out[1]),
        .I2(Ex_reg),
        .I3(resetbar_IBUF),
        .I4(out[0]),
        .I5(St_reg),
        .O(\FSM_sequential_state[1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFAEA)) 
    LoadCk_i_1
       (.I0(LoadCk_reg_n_0),
        .I1(LoadCk),
        .I2(Dec_reg),
        .I3(\alu_ctrl[3]_i_2_n_0 ),
        .O(LoadCk_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    LoadCk_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(LoadCk_i_1_n_0),
        .Q(LoadCk_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h2AAA)) 
    Nout_i_1
       (.I0(Q),
        .I1(alu_control[1]),
        .I2(alu_control[2]),
        .I3(alu_control[3]),
        .O(Nout_reg));
  LUT6 #(
    .INIT(64'hAAAAAAAA00200000)) 
    V_i_1
       (.I0(Ex_reg),
        .I1(alu_control[0]),
        .I2(alu_control[1]),
        .I3(alu_control[2]),
        .I4(alu_control[3]),
        .I5(VCk),
        .O(V1_out));
  LUT2 #(
    .INIT(4'h2)) 
    Vout_i_3
       (.I0(alu_control[1]),
        .I1(alu_control[0]),
        .O(Vout_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    Zout_i_3
       (.I0(alu_control[1]),
        .I1(alu_control[0]),
        .I2(alu_control[3]),
        .I3(alu_control[2]),
        .O(Zout_reg));
  LUT6 #(
    .INIT(64'h0000FFFFFFFFFFF6)) 
    \alu_ctrl[0]_i_1 
       (.I0(InstructionSpecifier_IBUF[2]),
        .I1(InstructionSpecifier_IBUF[1]),
        .I2(InstructionSpecifier_IBUF[4]),
        .I3(InstructionSpecifier_IBUF[5]),
        .I4(InstructionSpecifier_IBUF[6]),
        .I5(InstructionSpecifier_IBUF[7]),
        .O(\alu_ctrl[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFF0F0C0FFF7)) 
    \alu_ctrl[1]_i_1 
       (.I0(InstructionSpecifier_IBUF[2]),
        .I1(InstructionSpecifier_IBUF[3]),
        .I2(InstructionSpecifier_IBUF[4]),
        .I3(InstructionSpecifier_IBUF[5]),
        .I4(InstructionSpecifier_IBUF[6]),
        .I5(InstructionSpecifier_IBUF[7]),
        .O(\alu_ctrl[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000FF000000F8)) 
    \alu_ctrl[2]_i_1 
       (.I0(InstructionSpecifier_IBUF[2]),
        .I1(InstructionSpecifier_IBUF[3]),
        .I2(InstructionSpecifier_IBUF[4]),
        .I3(InstructionSpecifier_IBUF[5]),
        .I4(InstructionSpecifier_IBUF[6]),
        .I5(InstructionSpecifier_IBUF[7]),
        .O(\alu_ctrl[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA0A3AAA000000000)) 
    \alu_ctrl[3]_i_1 
       (.I0(\FSM_onehot_DecodeState_reg_n_0_[2] ),
        .I1(\alu_ctrl[3]_i_3_n_0 ),
        .I2(InstructionSpecifier_IBUF[7]),
        .I3(InstructionSpecifier_IBUF[6]),
        .I4(\alu_ctrl[3]_i_4_n_0 ),
        .I5(Dec_reg),
        .O(\alu_ctrl[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \alu_ctrl[3]_i_2 
       (.I0(InstructionSpecifier_IBUF[4]),
        .I1(InstructionSpecifier_IBUF[5]),
        .I2(InstructionSpecifier_IBUF[6]),
        .I3(InstructionSpecifier_IBUF[7]),
        .O(\alu_ctrl[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000FFFFBF)) 
    \alu_ctrl[3]_i_3 
       (.I0(InstructionSpecifier_IBUF[5]),
        .I1(InstructionSpecifier_IBUF[4]),
        .I2(\alu_ctrl[3]_i_5_n_0 ),
        .I3(InstructionSpecifier_IBUF[2]),
        .I4(InstructionSpecifier_IBUF[1]),
        .I5(InstructionSpecifier_IBUF[3]),
        .O(\alu_ctrl[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \alu_ctrl[3]_i_4 
       (.I0(InstructionSpecifier_IBUF[5]),
        .I1(InstructionSpecifier_IBUF[4]),
        .O(\alu_ctrl[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \alu_ctrl[3]_i_5 
       (.I0(InstructionSpecifier_IBUF[7]),
        .I1(InstructionSpecifier_IBUF[6]),
        .O(\alu_ctrl[3]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \alu_ctrl_reg[0] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(\alu_ctrl[3]_i_1_n_0 ),
        .D(\alu_ctrl[0]_i_1_n_0 ),
        .Q(alu_control[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \alu_ctrl_reg[1] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(\alu_ctrl[3]_i_1_n_0 ),
        .D(\alu_ctrl[1]_i_1_n_0 ),
        .Q(alu_control[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \alu_ctrl_reg[2] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(\alu_ctrl[3]_i_1_n_0 ),
        .D(\alu_ctrl[2]_i_1_n_0 ),
        .Q(alu_control[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \alu_ctrl_reg[3] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(\alu_ctrl[3]_i_1_n_0 ),
        .D(\alu_ctrl[3]_i_2_n_0 ),
        .Q(alu_control[3]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00010000)) 
    r_i_1
       (.I0(InstructionSpecifier_IBUF[7]),
        .I1(InstructionSpecifier_IBUF[6]),
        .I2(InstructionSpecifier_IBUF[5]),
        .I3(InstructionSpecifier_IBUF[4]),
        .I4(Dec_reg),
        .O(r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    r_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(r_i_1_n_0),
        .D(InstructionSpecifier_IBUF[0]),
        .Q(r),
        .R(1'b0));
endmodule

module Execute
   (CCk,
    C_OBUF,
    VCk,
    V_OBUF,
    Z_OBUF,
    N_OBUF,
    \AluOpt_C_reg[3] ,
    CO,
    O,
    \AluOpt_C_reg[3]_0 ,
    Cout_reg,
    \AluOpt_C_reg[7] ,
    C_reg,
    V_reg,
    Q,
    \AluOpt_C_reg[6] ,
    \AluOpt_C_reg[3]_1 ,
    Ex_reg,
    Sysclk_IBUF_BUFG,
    C3_out,
    V1_out,
    \AluOpt_C_reg[7]_0 ,
    AluInp1_A,
    \Bbus_reg[7] ,
    \Bbus_reg[7]_0 ,
    p_0_in,
    \Bbus_reg[7]_1 ,
    S,
    Ex_reg_0,
    Ex_reg_1,
    \alu_ctrl_reg[1] ,
    \Abus_reg[7] ,
    Cin_IBUF,
    \Abus_reg[7]_0 ,
    D,
    lopt,
    lopt_1,
    lopt_2,
    lopt_3,
    lopt_4,
    lopt_5,
    lopt_6,
    lopt_7);
  output CCk;
  output C_OBUF;
  output VCk;
  output V_OBUF;
  output Z_OBUF;
  output N_OBUF;
  output [3:0]\AluOpt_C_reg[3] ;
  output [0:0]CO;
  output [3:0]O;
  output [3:0]\AluOpt_C_reg[3]_0 ;
  output [0:0]Cout_reg;
  output [3:0]\AluOpt_C_reg[7] ;
  output C_reg;
  output V_reg;
  output [7:0]Q;
  output \AluOpt_C_reg[6] ;
  output \AluOpt_C_reg[3]_1 ;
  input Ex_reg;
  input Sysclk_IBUF_BUFG;
  input C3_out;
  input V1_out;
  input \AluOpt_C_reg[7]_0 ;
  input [0:0]AluInp1_A;
  input [3:0]\Bbus_reg[7] ;
  input [3:0]\Bbus_reg[7]_0 ;
  input [3:0]p_0_in;
  input [3:0]\Bbus_reg[7]_1 ;
  input [0:0]S;
  input Ex_reg_0;
  input Ex_reg_1;
  input \alu_ctrl_reg[1] ;
  input [3:0]\Abus_reg[7] ;
  input Cin_IBUF;
  input [0:0]\Abus_reg[7]_0 ;
  input [7:0]D;
  output lopt;
  output lopt_1;
  output lopt_2;
  output lopt_3;
  output lopt_4;
  output lopt_5;
  output lopt_6;
  output lopt_7;

  wire [3:0]\Abus_reg[7] ;
  wire [0:0]\Abus_reg[7]_0 ;
  wire [0:0]AluInp1_A;
  wire [3:0]\AluOpt_C_reg[3] ;
  wire [3:0]\AluOpt_C_reg[3]_0 ;
  wire \AluOpt_C_reg[3]_1 ;
  wire \AluOpt_C_reg[6] ;
  wire [3:0]\AluOpt_C_reg[7] ;
  wire \AluOpt_C_reg[7]_0 ;
  wire [3:0]\Bbus_reg[7] ;
  wire [3:0]\Bbus_reg[7]_0 ;
  wire [3:0]\Bbus_reg[7]_1 ;
  wire C3_out;
  wire CCk;
  wire [0:0]CO;
  wire C_OBUF;
  wire C_reg;
  wire Cin_IBUF;
  wire [0:0]Cout_reg;
  wire [7:0]D;
  wire Ex_reg;
  wire Ex_reg_0;
  wire Ex_reg_1;
  wire N_OBUF;
  wire [3:0]O;
  wire [7:0]Q;
  wire [0:0]S;
  wire Sysclk_IBUF_BUFG;
  wire V1_out;
  wire VCk;
  wire V_OBUF;
  wire V_reg;
  wire Z_OBUF;
  wire \alu_ctrl_reg[1] ;
  wire lopt;
  wire lopt_1;
  wire lopt_2;
  wire lopt_3;
  wire lopt_4;
  wire lopt_5;
  wire lopt_6;
  wire lopt_7;
  wire [3:0]p_0_in;
  wire [6:0]NLW_alu_exe1_Q_UNCONNECTED;

  ALU alu_exe1
       (.\Abus_reg[7] (\Abus_reg[7] ),
        .\Abus_reg[7]_0 (\Abus_reg[7]_0 ),
        .AluInp1_A(AluInp1_A),
        .\AluOpt_C_reg[3]_0 (\AluOpt_C_reg[3] ),
        .\AluOpt_C_reg[3]_1 (\AluOpt_C_reg[3]_0 ),
        .\AluOpt_C_reg[3]_2 (\AluOpt_C_reg[3]_1 ),
        .\AluOpt_C_reg[6]_0 (\AluOpt_C_reg[6] ),
        .\AluOpt_C_reg[7]_0 (\AluOpt_C_reg[7] ),
        .\AluOpt_C_reg[7]_1 (\AluOpt_C_reg[7]_0 ),
        .\Bbus_reg[7] (\Bbus_reg[7] ),
        .\Bbus_reg[7]_0 (\Bbus_reg[7]_0 ),
        .\Bbus_reg[7]_1 (\Bbus_reg[7]_1 ),
        .C3_out(C3_out),
        .CCk(CCk),
        .CO(CO),
        .C_OBUF(C_OBUF),
        .C_reg_0(C_reg),
        .Cin_IBUF(Cin_IBUF),
        .Cout_reg_0(Cout_reg),
        .D(D),
        .Ex_reg(Ex_reg),
        .Ex_reg_0(Ex_reg_0),
        .Ex_reg_1(Ex_reg_1),
        .N_OBUF(N_OBUF),
        .O(O),
        .Q({Q[7],NLW_alu_exe1_Q_UNCONNECTED[6:0]}),
        .S(S),
        .Sysclk_IBUF_BUFG(Sysclk_IBUF_BUFG),
        .V1_out(V1_out),
        .VCk(VCk),
        .V_OBUF(V_OBUF),
        .V_reg_0(V_reg),
        .Z_OBUF(Z_OBUF),
        .\alu_ctrl_reg[1] (\alu_ctrl_reg[1] ),
        .lopt(lopt),
        .lopt_1(lopt_1),
        .lopt_2(lopt_2),
        .lopt_3(lopt_3),
        .lopt_4(lopt_4),
        .lopt_5(lopt_5),
        .lopt_6(lopt_6),
        .lopt_7(lopt_7),
        .p_0_in(p_0_in));
endmodule

module RegSet
   (D,
    DI,
    \AluOpt_C_reg[4] ,
    S,
    p_0_in,
    \AluOpt_C_reg[3] ,
    \AluOpt_C_reg[6] ,
    Cout_reg,
    \AluOpt_C_reg[3]_0 ,
    Vout_reg,
    Cout_reg_0,
    \AluOpt_C_reg[3]_1 ,
    Q,
    \alu_ctrl_reg[3] ,
    \alu_ctrl_reg[1] ,
    O,
    \Abus_reg[7]_0 ,
    \Abus_reg[7]_1 ,
    \Abus_reg[7]_2 ,
    \AluOpt_C_reg[7] ,
    \Abus_reg[7]_3 ,
    Cin_IBUF,
    \Abus_reg[7]_4 ,
    CO,
    \Abus_reg[7]_5 ,
    LoadCk_reg,
    Ex_reg,
    Vout_reg_0,
    \alu_ctrl_reg[3]_0 ,
    \alu_ctrl_reg[0] ,
    Cout_reg_1,
    \Bbus_reg[7]_i_7 ,
    Sysclk_IBUF_BUFG,
    \A_reg[2] ,
    \A_reg[1] );
  output [7:0]D;
  output [0:0]DI;
  output [0:0]\AluOpt_C_reg[4] ;
  output [3:0]S;
  output [0:0]p_0_in;
  output [3:0]\AluOpt_C_reg[3] ;
  output [3:0]\AluOpt_C_reg[6] ;
  output [0:0]Cout_reg;
  output [3:0]\AluOpt_C_reg[3]_0 ;
  output Vout_reg;
  output Cout_reg_0;
  output [3:0]\AluOpt_C_reg[3]_1 ;
  input [3:0]Q;
  input \alu_ctrl_reg[3] ;
  input \alu_ctrl_reg[1] ;
  input [3:0]O;
  input [3:0]\Abus_reg[7]_0 ;
  input [3:0]\Abus_reg[7]_1 ;
  input \Abus_reg[7]_2 ;
  input [0:0]\AluOpt_C_reg[7] ;
  input [3:0]\Abus_reg[7]_3 ;
  input Cin_IBUF;
  input \Abus_reg[7]_4 ;
  input [0:0]CO;
  input [0:0]\Abus_reg[7]_5 ;
  input LoadCk_reg;
  input Ex_reg;
  input Vout_reg_0;
  input \alu_ctrl_reg[3]_0 ;
  input \alu_ctrl_reg[0] ;
  input Cout_reg_1;
  input \Bbus_reg[7]_i_7 ;
  input Sysclk_IBUF_BUFG;
  input \A_reg[2] ;
  input \A_reg[1] ;

  wire \A_reg[1] ;
  wire \A_reg[2] ;
  wire \Abus[7]_i_1_n_0 ;
  wire [3:0]\Abus_reg[7]_0 ;
  wire [3:0]\Abus_reg[7]_1 ;
  wire \Abus_reg[7]_2 ;
  wire [3:0]\Abus_reg[7]_3 ;
  wire \Abus_reg[7]_4 ;
  wire [0:0]\Abus_reg[7]_5 ;
  wire [7:2]AluInp2_B;
  wire \AluOpt_C[0]_i_2_n_0 ;
  wire \AluOpt_C[0]_i_3_n_0 ;
  wire \AluOpt_C[0]_i_4_n_0 ;
  wire \AluOpt_C[1]_i_2_n_0 ;
  wire \AluOpt_C[1]_i_3_n_0 ;
  wire \AluOpt_C[1]_i_4_n_0 ;
  wire \AluOpt_C[1]_i_5_n_0 ;
  wire \AluOpt_C[2]_i_2_n_0 ;
  wire \AluOpt_C[2]_i_3_n_0 ;
  wire \AluOpt_C[2]_i_4_n_0 ;
  wire \AluOpt_C[2]_i_5_n_0 ;
  wire \AluOpt_C[3]_i_2_n_0 ;
  wire \AluOpt_C[3]_i_3_n_0 ;
  wire \AluOpt_C[3]_i_4_n_0 ;
  wire \AluOpt_C[4]_i_2_n_0 ;
  wire \AluOpt_C[4]_i_3_n_0 ;
  wire \AluOpt_C[4]_i_4_n_0 ;
  wire \AluOpt_C[4]_i_5_n_0 ;
  wire \AluOpt_C[5]_i_2_n_0 ;
  wire \AluOpt_C[5]_i_3_n_0 ;
  wire \AluOpt_C[5]_i_4_n_0 ;
  wire \AluOpt_C[6]_i_2_n_0 ;
  wire \AluOpt_C[6]_i_3_n_0 ;
  wire \AluOpt_C[6]_i_4_n_0 ;
  wire \AluOpt_C[7]_i_2_n_0 ;
  wire \AluOpt_C[7]_i_4_n_0 ;
  wire \AluOpt_C[7]_i_6_n_0 ;
  wire \AluOpt_C[7]_i_7_n_0 ;
  wire [3:0]\AluOpt_C_reg[3] ;
  wire [3:0]\AluOpt_C_reg[3]_0 ;
  wire [3:0]\AluOpt_C_reg[3]_1 ;
  wire \AluOpt_C_reg[3]_i_6_n_0 ;
  wire [0:0]\AluOpt_C_reg[4] ;
  wire [3:0]\AluOpt_C_reg[6] ;
  wire [0:0]\AluOpt_C_reg[7] ;
  wire \AluOpt_C_reg[7]_i_5_n_0 ;
  wire \AluOpt_C_reg[7]_i_5_n_4 ;
  wire \AluOpt_C_reg[7]_i_5_n_5 ;
  wire \AluOpt_C_reg[7]_i_5_n_6 ;
  wire \Bbus[4]_i_1_n_0 ;
  wire \Bbus[5]_i_1_n_0 ;
  wire \Bbus[6]_i_1_n_0 ;
  wire [0:0]CO;
  wire Cin_IBUF;
  wire Cout_i_2_n_0;
  wire Cout_i_4_n_0;
  wire Cout_i_9_n_0;
  wire [0:0]Cout_reg;
  wire Cout_reg_0;
  wire Cout_reg_1;
  wire Cout_reg_i_8_n_3;
  wire [7:0]D;
  wire [0:0]DI;
  wire Ex_reg;
  wire LoadCk_reg;
  wire [3:0]O;
  wire ONE;
  wire \Pep9exe/alu_exe1/Vout ;
  wire \Pep9exe/data0 ;
  wire [3:0]Q;
  wire [3:0]S;
  wire Sysclk_IBUF_BUFG;
  wire Vout_i_4_n_0;
  wire Vout_i_5_n_0;
  wire Vout_reg;
  wire Vout_reg_0;
  wire \alu_ctrl_reg[0] ;
  wire \alu_ctrl_reg[1] ;
  wire \alu_ctrl_reg[3] ;
  wire \alu_ctrl_reg[3]_0 ;
  wire [2:0]\NLW_AluOpt_C_reg[3]_i_6_CO_UNCONNECTED ;
  wire [2:0]\NLW_AluOpt_C_reg[7]_i_5_CO_UNCONNECTED ;
  wire [3:1]NLW_Cout_reg_i_6_CO_UNCONNECTED;
  wire [3:0]NLW_Cout_reg_i_6_O_UNCONNECTED;
  wire [3:1]NLW_Cout_reg_i_7_CO_UNCONNECTED;
  wire [3:0]NLW_Cout_reg_i_7_O_UNCONNECTED;
  wire [3:1]NLW_Cout_reg_i_8_CO_UNCONNECTED;
  wire [3:0]NLW_Cout_reg_i_8_O_UNCONNECTED;

  assign p_0_in[0] = ONE;
  LUT3 #(
    .INIT(8'hD0)) 
    \Abus[7]_i_1 
       (.I0(\A_reg[2] ),
        .I1(\A_reg[1] ),
        .I2(LoadCk_reg),
        .O(\Abus[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Abus_reg[7] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(LoadCk_reg),
        .D(1'b1),
        .Q(DI),
        .R(\Abus[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \AluOpt_C[0]_i_1 
       (.I0(\AluOpt_C[0]_i_2_n_0 ),
        .I1(Q[3]),
        .I2(\AluOpt_C[0]_i_3_n_0 ),
        .I3(Q[2]),
        .I4(\AluOpt_C[0]_i_4_n_0 ),
        .O(D[0]));
  LUT4 #(
    .INIT(16'h30A5)) 
    \AluOpt_C[0]_i_2 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(DI),
        .I3(Q[0]),
        .O(\AluOpt_C[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h8F8A)) 
    \AluOpt_C[0]_i_3 
       (.I0(Q[1]),
        .I1(DI),
        .I2(Q[0]),
        .I3(\Abus_reg[7]_0 [0]),
        .O(\AluOpt_C[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA03FCFAFA030C0)) 
    \AluOpt_C[0]_i_4 
       (.I0(\Abus_reg[7]_3 [0]),
        .I1(Cin_IBUF),
        .I2(Q[1]),
        .I3(\AluOpt_C_reg[3] [0]),
        .I4(Q[0]),
        .I5(DI),
        .O(\AluOpt_C[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \AluOpt_C[1]_i_1 
       (.I0(\AluOpt_C[1]_i_2_n_0 ),
        .I1(Q[3]),
        .I2(\AluOpt_C[1]_i_3_n_0 ),
        .I3(Q[2]),
        .I4(\AluOpt_C[1]_i_4_n_0 ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7805)) 
    \AluOpt_C[1]_i_2 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(DI),
        .O(\AluOpt_C[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h8F8A)) 
    \AluOpt_C[1]_i_3 
       (.I0(Q[1]),
        .I1(DI),
        .I2(Q[0]),
        .I3(\Abus_reg[7]_0 [1]),
        .O(\AluOpt_C[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CF3FAFA0C030)) 
    \AluOpt_C[1]_i_4 
       (.I0(\Abus_reg[7]_3 [1]),
        .I1(\AluOpt_C[1]_i_5_n_0 ),
        .I2(Q[1]),
        .I3(\AluOpt_C_reg[3] [1]),
        .I4(Q[0]),
        .I5(DI),
        .O(\AluOpt_C[1]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \AluOpt_C[1]_i_5 
       (.I0(Cin_IBUF),
        .I1(\AluOpt_C_reg[3] [0]),
        .O(\AluOpt_C[1]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \AluOpt_C[2]_i_1 
       (.I0(\AluOpt_C[2]_i_2_n_0 ),
        .I1(Q[3]),
        .I2(\AluOpt_C[2]_i_3_n_0 ),
        .I3(Q[2]),
        .I4(\AluOpt_C[2]_i_4_n_0 ),
        .O(D[2]));
  LUT4 #(
    .INIT(16'h7A05)) 
    \AluOpt_C[2]_i_2 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(DI),
        .O(\AluOpt_C[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hCE0E)) 
    \AluOpt_C[2]_i_3 
       (.I0(\Abus_reg[7]_0 [2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(DI),
        .O(\AluOpt_C[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CF3FAFA0C030)) 
    \AluOpt_C[2]_i_4 
       (.I0(\Abus_reg[7]_3 [2]),
        .I1(\AluOpt_C[2]_i_5_n_0 ),
        .I2(Q[1]),
        .I3(\AluOpt_C_reg[3] [2]),
        .I4(Q[0]),
        .I5(DI),
        .O(\AluOpt_C[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \AluOpt_C[2]_i_5 
       (.I0(\AluOpt_C_reg[3] [0]),
        .I1(Cin_IBUF),
        .I2(\AluOpt_C_reg[3] [1]),
        .O(\AluOpt_C[2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \AluOpt_C[3]_i_1 
       (.I0(\AluOpt_C[3]_i_2_n_0 ),
        .I1(Q[3]),
        .I2(\AluOpt_C[3]_i_3_n_0 ),
        .I3(Q[2]),
        .I4(\AluOpt_C[3]_i_4_n_0 ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h5205)) 
    \AluOpt_C[3]_i_2 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(DI),
        .O(\AluOpt_C[3]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h8F8A)) 
    \AluOpt_C[3]_i_3 
       (.I0(Q[1]),
        .I1(DI),
        .I2(Q[0]),
        .I3(\Abus_reg[7]_0 [3]),
        .O(\AluOpt_C[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CF3FAFA0C030)) 
    \AluOpt_C[3]_i_4 
       (.I0(\Abus_reg[7]_3 [3]),
        .I1(\Abus_reg[7]_4 ),
        .I2(Q[1]),
        .I3(\AluOpt_C_reg[3] [3]),
        .I4(Q[0]),
        .I5(DI),
        .O(\AluOpt_C[3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0047)) 
    \AluOpt_C[4]_i_1 
       (.I0(\AluOpt_C[4]_i_2_n_0 ),
        .I1(Q[2]),
        .I2(\AluOpt_C[4]_i_3_n_0 ),
        .I3(Q[3]),
        .I4(\AluOpt_C[4]_i_4_n_0 ),
        .O(D[4]));
  LUT4 #(
    .INIT(16'h7073)) 
    \AluOpt_C[4]_i_2 
       (.I0(AluInp2_B[4]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\Abus_reg[7]_1 [0]),
        .O(\AluOpt_C[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h305F3FAF)) 
    \AluOpt_C[4]_i_3 
       (.I0(\AluOpt_C[4]_i_5_n_0 ),
        .I1(O[0]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\AluOpt_C_reg[4] ),
        .O(\AluOpt_C[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h02020000BC8F0000)) 
    \AluOpt_C[4]_i_4 
       (.I0(DI),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(AluInp2_B[4]),
        .I4(Q[3]),
        .I5(Q[2]),
        .O(\AluOpt_C[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \AluOpt_C[4]_i_5 
       (.I0(\AluOpt_C_reg[3] [2]),
        .I1(\AluOpt_C_reg[3] [0]),
        .I2(Cin_IBUF),
        .I3(\AluOpt_C_reg[3] [1]),
        .I4(\AluOpt_C_reg[3] [3]),
        .O(\AluOpt_C[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF322FFFFF3220000)) 
    \AluOpt_C[5]_i_2 
       (.I0(\Abus_reg[7]_1 [1]),
        .I1(Q[0]),
        .I2(AluInp2_B[5]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(\AluOpt_C[5]_i_4_n_0 ),
        .O(\AluOpt_C[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0300383B)) 
    \AluOpt_C[5]_i_3 
       (.I0(DI),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(AluInp2_B[5]),
        .I4(Q[0]),
        .O(\AluOpt_C[5]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAACCC300)) 
    \AluOpt_C[5]_i_4 
       (.I0(O[1]),
        .I1(\AluOpt_C_reg[7]_i_5_n_6 ),
        .I2(\Abus_reg[7]_2 ),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(\AluOpt_C[5]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h00AB)) 
    \AluOpt_C[6]_i_1 
       (.I0(\AluOpt_C[6]_i_2_n_0 ),
        .I1(Q[2]),
        .I2(\AluOpt_C[6]_i_3_n_0 ),
        .I3(\AluOpt_C[6]_i_4_n_0 ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hFFBAAAAABBBAAAAA)) 
    \AluOpt_C[6]_i_2 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(\Abus_reg[7]_1 [2]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(AluInp2_B[6]),
        .O(\AluOpt_C[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h55000CFF55FFF3FF)) 
    \AluOpt_C[6]_i_3 
       (.I0(O[2]),
        .I1(\AluOpt_C_reg[7]_i_5_n_6 ),
        .I2(\Abus_reg[7]_2 ),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\AluOpt_C_reg[7]_i_5_n_5 ),
        .O(\AluOpt_C[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hC3C6FFC600000000)) 
    \AluOpt_C[6]_i_4 
       (.I0(AluInp2_B[6]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(DI),
        .I5(Q[3]),
        .O(\AluOpt_C[6]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hAEAAAAEE)) 
    \AluOpt_C[7]_i_1 
       (.I0(\AluOpt_C[7]_i_2_n_0 ),
        .I1(\alu_ctrl_reg[3] ),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(DI),
        .O(D[7]));
  LUT6 #(
    .INIT(64'h000000000000EAAE)) 
    \AluOpt_C[7]_i_2 
       (.I0(\AluOpt_C[7]_i_4_n_0 ),
        .I1(\alu_ctrl_reg[1] ),
        .I2(\AluOpt_C_reg[7]_i_5_n_4 ),
        .I3(\AluOpt_C[7]_i_6_n_0 ),
        .I4(\AluOpt_C[7]_i_7_n_0 ),
        .I5(Q[3]),
        .O(\AluOpt_C[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFCEECCFFFCEECCCC)) 
    \AluOpt_C[7]_i_4 
       (.I0(\AluOpt_C_reg[7]_i_5_n_4 ),
        .I1(Q[2]),
        .I2(O[3]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DI),
        .O(\AluOpt_C[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \AluOpt_C[7]_i_6 
       (.I0(\AluOpt_C_reg[7]_i_5_n_6 ),
        .I1(\Abus_reg[7]_2 ),
        .I2(\AluOpt_C_reg[7]_i_5_n_5 ),
        .O(\AluOpt_C[7]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h20A020AA)) 
    \AluOpt_C[7]_i_7 
       (.I0(Q[2]),
        .I1(DI),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\Abus_reg[7]_1 [3]),
        .O(\AluOpt_C[7]_i_7_n_0 ));
  CARRY4 \AluOpt_C_reg[3]_i_6 
       (.CI(1'b0),
        .CO({\AluOpt_C_reg[3]_i_6_n_0 ,\NLW_AluOpt_C_reg[3]_i_6_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({DI,DI,DI,DI}),
        .O(\AluOpt_C_reg[3] ),
        .S({DI,DI,DI,DI}));
  MUXF7 \AluOpt_C_reg[5]_i_1 
       (.I0(\AluOpt_C[5]_i_2_n_0 ),
        .I1(\AluOpt_C[5]_i_3_n_0 ),
        .O(D[5]),
        .S(Q[3]));
  CARRY4 \AluOpt_C_reg[7]_i_5 
       (.CI(\AluOpt_C_reg[3]_i_6_n_0 ),
        .CO({\AluOpt_C_reg[7]_i_5_n_0 ,\NLW_AluOpt_C_reg[7]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({DI,1'b0,1'b0,1'b0}),
        .O({\AluOpt_C_reg[7]_i_5_n_4 ,\AluOpt_C_reg[7]_i_5_n_5 ,\AluOpt_C_reg[7]_i_5_n_6 ,\AluOpt_C_reg[4] }),
        .S({DI,AluInp2_B[6:4]}));
  LUT2 #(
    .INIT(4'h4)) 
    \Bbus[4]_i_1 
       (.I0(LoadCk_reg),
        .I1(AluInp2_B[4]),
        .O(\Bbus[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \Bbus[5]_i_1 
       (.I0(LoadCk_reg),
        .I1(AluInp2_B[5]),
        .O(\Bbus[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \Bbus[6]_i_1 
       (.I0(LoadCk_reg),
        .I1(AluInp2_B[6]),
        .O(\Bbus[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Bbus_reg[4] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\Bbus[4]_i_1_n_0 ),
        .Q(AluInp2_B[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Bbus_reg[5] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\Bbus[5]_i_1_n_0 ),
        .Q(AluInp2_B[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Bbus_reg[6] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\Bbus[6]_i_1_n_0 ),
        .Q(AluInp2_B[6]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFF8AFF00008A00)) 
    Cout_i_1
       (.I0(Cout_i_2_n_0),
        .I1(\alu_ctrl_reg[3]_0 ),
        .I2(Cout_i_4_n_0),
        .I3(Ex_reg),
        .I4(\alu_ctrl_reg[0] ),
        .I5(Cout_reg_1),
        .O(Cout_reg_0));
  LUT4 #(
    .INIT(16'hC8FF)) 
    Cout_i_2
       (.I0(Q[1]),
        .I1(DI),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(Cout_i_2_n_0));
  LUT6 #(
    .INIT(64'hFAEEBBFFFABBBBFF)) 
    Cout_i_4
       (.I0(Q[2]),
        .I1(\Pep9exe/data0 ),
        .I2(Cout_reg_i_8_n_3),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(Cout_i_9_n_0),
        .O(Cout_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    Cout_i_9
       (.I0(\AluOpt_C_reg[7]_i_5_n_4 ),
        .I1(\AluOpt_C_reg[7]_i_5_n_5 ),
        .I2(\Abus_reg[7]_2 ),
        .I3(\AluOpt_C_reg[7]_i_5_n_6 ),
        .O(Cout_i_9_n_0));
  CARRY4 Cout_reg_i_6
       (.CI(\Abus_reg[7]_5 ),
        .CO({NLW_Cout_reg_i_6_CO_UNCONNECTED[3:1],Cout_reg}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_Cout_reg_i_6_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  CARRY4 Cout_reg_i_7
       (.CI(\AluOpt_C_reg[7]_i_5_n_0 ),
        .CO({NLW_Cout_reg_i_7_CO_UNCONNECTED[3:1],\Pep9exe/data0 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_Cout_reg_i_7_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  CARRY4 Cout_reg_i_8
       (.CI(CO),
        .CO({NLW_Cout_reg_i_8_CO_UNCONNECTED[3:1],Cout_reg_i_8_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_Cout_reg_i_8_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  VCC VCC_1
       (.P(ONE));
  LUT6 #(
    .INIT(64'hBBFBBBBB88088888)) 
    Vout_i_1
       (.I0(\Pep9exe/alu_exe1/Vout ),
        .I1(Ex_reg),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(\alu_ctrl_reg[1] ),
        .I5(Vout_reg_0),
        .O(Vout_reg));
  LUT6 #(
    .INIT(64'h2222202200222022)) 
    Vout_i_2
       (.I0(Vout_i_4_n_0),
        .I1(Vout_i_5_n_0),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(\Pep9exe/alu_exe1/Vout ));
  LUT4 #(
    .INIT(16'hEFFE)) 
    Vout_i_4
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .O(Vout_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFC7C7C7)) 
    Vout_i_5
       (.I0(Q[3]),
        .I1(DI),
        .I2(\AluOpt_C_reg[7] ),
        .I3(Q[0]),
        .I4(Q[2]),
        .O(Vout_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1
       (.I0(DI),
        .O(S[3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1__0
       (.I0(DI),
        .O(\AluOpt_C_reg[6] [3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_2
       (.I0(AluInp2_B[6]),
        .O(S[2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_2__0
       (.I0(AluInp2_B[6]),
        .O(\AluOpt_C_reg[6] [2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_3
       (.I0(AluInp2_B[5]),
        .O(S[1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_3__0
       (.I0(AluInp2_B[5]),
        .O(\AluOpt_C_reg[6] [1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_4
       (.I0(AluInp2_B[4]),
        .O(S[0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_4__0
       (.I0(AluInp2_B[4]),
        .O(\AluOpt_C_reg[6] [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1__0
       (.I0(DI),
        .O(\AluOpt_C_reg[3]_1 [3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_2
       (.I0(DI),
        .O(\AluOpt_C_reg[3]_1 [2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_2__0
       (.I0(DI),
        .O(\AluOpt_C_reg[3]_0 [3]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_3
       (.I0(DI),
        .O(\AluOpt_C_reg[3]_0 [2]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_3__0
       (.I0(DI),
        .O(\AluOpt_C_reg[3]_1 [1]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_4
       (.I0(DI),
        .O(\AluOpt_C_reg[3]_1 [0]));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_4__0
       (.I0(DI),
        .O(\AluOpt_C_reg[3]_0 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_5
       (.I0(DI),
        .I1(Cin_IBUF),
        .O(\AluOpt_C_reg[3]_0 [0]));
endmodule

(* ECO_CHECKSUM = "ad52740" *) (* s0 = "3'b000" *) (* s1 = "3'b001" *) 
(* s2 = "3'b010" *) (* s3 = "3'b011" *) (* s4 = "3'b100" *) 
(* NotValidForBitStream *)
module Top_Pep9CPU
   (AluOpt_C,
    S,
    C,
    V,
    Z,
    N,
    Sysclk,
    resetbar,
    InstructionSpecifier,
    Cin);
  output [7:0]AluOpt_C;
  output S;
  output C;
  output V;
  output Z;
  output N;
  input Sysclk;
  input resetbar;
  input [7:0]InstructionSpecifier;
  input Cin;

  wire [7:7]AluInp1_A;
  wire [7:0]AluOpt_C;
  wire [7:0]AluOpt_C_OBUF;
  wire C;
  wire C_OBUF;
  wire Cin;
  wire Cin_IBUF;
  wire Dec_i_1_n_0;
  wire Dec_reg_n_0;
  wire Ex_i_1_n_0;
  wire Ex_reg_n_0;
  wire [7:0]InstructionSpecifier;
  wire [7:0]InstructionSpecifier_IBUF;
  wire N;
  wire N_OBUF;
  wire Pep9dec_n_0;
  wire Pep9dec_n_1;
  wire Pep9dec_n_13;
  wire Pep9dec_n_14;
  wire Pep9dec_n_15;
  wire Pep9dec_n_16;
  wire Pep9dec_n_21;
  wire Pep9dec_n_22;
  wire Pep9dec_n_23;
  wire Pep9dec_n_24;
  wire Pep9dec_n_25;
  wire Pep9dec_n_26;
  wire Pep9dec_n_27;
  wire Pep9dec_n_28;
  wire Pep9dec_n_29;
  wire Pep9dec_n_30;
  wire Pep9dec_n_31;
  wire Pep9dec_n_32;
  wire Pep9dec_n_34;
  wire Pep9dec_n_35;
  wire Pep9dec_n_36;
  wire Pep9dec_n_37;
  wire Pep9dec_n_38;
  wire Pep9dec_n_39;
  wire Pep9exe_n_10;
  wire Pep9exe_n_11;
  wire Pep9exe_n_12;
  wire Pep9exe_n_13;
  wire Pep9exe_n_14;
  wire Pep9exe_n_15;
  wire Pep9exe_n_16;
  wire Pep9exe_n_17;
  wire Pep9exe_n_18;
  wire Pep9exe_n_19;
  wire Pep9exe_n_20;
  wire Pep9exe_n_21;
  wire Pep9exe_n_22;
  wire Pep9exe_n_23;
  wire Pep9exe_n_24;
  wire Pep9exe_n_25;
  wire Pep9exe_n_34;
  wire Pep9exe_n_35;
  wire Pep9exe_n_6;
  wire Pep9exe_n_7;
  wire Pep9exe_n_8;
  wire Pep9exe_n_9;
  wire S;
  wire St_i_1_n_0;
  wire St_reg_n_0;
  wire Sysclk;
  wire Sysclk_IBUF;
  wire Sysclk_IBUF_BUFG;
  wire V;
  wire V_OBUF;
  wire Z;
  wire Z_OBUF;
  wire [7:0]\alu_exe1/AluOpt_C ;
  wire \alu_exe1/C3_out ;
  wire \alu_exe1/CCk ;
  wire \alu_exe1/V1_out ;
  wire \alu_exe1/VCk ;
  wire lopt;
  wire lopt_1;
  wire lopt_2;
  wire lopt_3;
  wire lopt_4;
  wire lopt_5;
  wire lopt_6;
  wire lopt_7;
  wire [6:0]p_0_in;
  wire resetbar;
  wire resetbar_IBUF;
  (* RTL_KEEP = "yes" *) wire [1:0]state;
  wire \NLW_Pep9dec_Bbus_reg[7]_i_7_UNCONNECTED ;
  wire \NLW_Pep9dec_Bbus_reg[7]_i_7_0_UNCONNECTED ;
  wire \NLW_Pep9dec_InstructionSpecifier[1]_UNCONNECTED ;
  wire [1:0]NLW_Pep9dec_in0_UNCONNECTED;
  wire [6:0]NLW_Pep9exe_Q_UNCONNECTED;

  OBUF \AluOpt_C_OBUF[0]_inst 
       (.I(lopt),
        .O(AluOpt_C[0]));
  OBUF \AluOpt_C_OBUF[1]_inst 
       (.I(lopt_1),
        .O(AluOpt_C[1]));
  OBUF \AluOpt_C_OBUF[2]_inst 
       (.I(lopt_2),
        .O(AluOpt_C[2]));
  OBUF \AluOpt_C_OBUF[3]_inst 
       (.I(lopt_3),
        .O(AluOpt_C[3]));
  OBUF \AluOpt_C_OBUF[4]_inst 
       (.I(lopt_4),
        .O(AluOpt_C[4]));
  OBUF \AluOpt_C_OBUF[5]_inst 
       (.I(lopt_5),
        .O(AluOpt_C[5]));
  OBUF \AluOpt_C_OBUF[6]_inst 
       (.I(lopt_6),
        .O(AluOpt_C[6]));
  OBUF \AluOpt_C_OBUF[7]_inst 
       (.I(lopt_7),
        .O(AluOpt_C[7]));
  OBUF C_OBUF_inst
       (.I(C_OBUF),
        .O(C));
  IBUF Cin_IBUF_inst
       (.I(Cin),
        .O(Cin_IBUF));
  LUT5 #(
    .INIT(32'h8CFC80FC)) 
    Dec_i_1
       (.I0(St_reg_n_0),
        .I1(Dec_reg_n_0),
        .I2(state[0]),
        .I3(state[1]),
        .I4(Ex_reg_n_0),
        .O(Dec_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Dec_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(Dec_i_1_n_0),
        .Q(Dec_reg_n_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hAFCF0F00)) 
    Ex_i_1
       (.I0(St_reg_n_0),
        .I1(Dec_reg_n_0),
        .I2(state[0]),
        .I3(state[1]),
        .I4(Ex_reg_n_0),
        .O(Ex_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Ex_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(Ex_i_1_n_0),
        .Q(Ex_reg_n_0),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "s0:00,s1:01,s2:10,s3:11" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(Pep9dec_n_1),
        .Q(state[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "s0:00,s1:01,s2:10,s3:11" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(Sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(Pep9dec_n_0),
        .Q(state[1]),
        .R(1'b0));
  IBUF \InstructionSpecifier_IBUF[0]_inst 
       (.I(InstructionSpecifier[0]),
        .O(InstructionSpecifier_IBUF[0]));
  IBUF \InstructionSpecifier_IBUF[1]_inst 
       (.I(InstructionSpecifier[1]),
        .O(InstructionSpecifier_IBUF[1]));
  IBUF \InstructionSpecifier_IBUF[2]_inst 
       (.I(InstructionSpecifier[2]),
        .O(InstructionSpecifier_IBUF[2]));
  IBUF \InstructionSpecifier_IBUF[3]_inst 
       (.I(InstructionSpecifier[3]),
        .O(InstructionSpecifier_IBUF[3]));
  IBUF \InstructionSpecifier_IBUF[4]_inst 
       (.I(InstructionSpecifier[4]),
        .O(InstructionSpecifier_IBUF[4]));
  IBUF \InstructionSpecifier_IBUF[5]_inst 
       (.I(InstructionSpecifier[5]),
        .O(InstructionSpecifier_IBUF[5]));
  IBUF \InstructionSpecifier_IBUF[6]_inst 
       (.I(InstructionSpecifier[6]),
        .O(InstructionSpecifier_IBUF[6]));
  IBUF \InstructionSpecifier_IBUF[7]_inst 
       (.I(InstructionSpecifier[7]),
        .O(InstructionSpecifier_IBUF[7]));
  OBUF N_OBUF_inst
       (.I(N_OBUF),
        .O(N));
  Decode Pep9dec
       (.\Abus_reg[7] ({Pep9exe_n_15,Pep9exe_n_16,Pep9exe_n_17,Pep9exe_n_18}),
        .\Abus_reg[7]_0 ({Pep9exe_n_20,Pep9exe_n_21,Pep9exe_n_22,Pep9exe_n_23}),
        .\Abus_reg[7]_1 (Pep9exe_n_34),
        .\Abus_reg[7]_2 ({Pep9exe_n_6,Pep9exe_n_7,Pep9exe_n_8,Pep9exe_n_9}),
        .\Abus_reg[7]_3 (Pep9exe_n_35),
        .\Abus_reg[7]_4 (Pep9exe_n_19),
        .AluInp1_A(AluInp1_A),
        .\AluOpt_C_reg[3] ({Pep9dec_n_21,Pep9dec_n_22,Pep9dec_n_23,Pep9dec_n_24}),
        .\AluOpt_C_reg[3]_0 ({Pep9dec_n_29,Pep9dec_n_30,Pep9dec_n_31,Pep9dec_n_32}),
        .\AluOpt_C_reg[3]_1 ({Pep9dec_n_36,Pep9dec_n_37,Pep9dec_n_38,Pep9dec_n_39}),
        .\AluOpt_C_reg[4] (Pep9dec_n_13),
        .\AluOpt_C_reg[6] ({Pep9dec_n_25,Pep9dec_n_26,Pep9dec_n_27,Pep9dec_n_28}),
        .\Bbus_reg[7]_i_7 (\NLW_Pep9dec_Bbus_reg[7]_i_7_UNCONNECTED ),
        .\Bbus_reg[7]_i_7_0 (\NLW_Pep9dec_Bbus_reg[7]_i_7_0_UNCONNECTED ),
        .C3_out(\alu_exe1/C3_out ),
        .CCk(\alu_exe1/CCk ),
        .CO(Pep9exe_n_10),
        .Cin_IBUF(Cin_IBUF),
        .Cout_reg(Pep9dec_n_35),
        .Cout_reg_0(Pep9exe_n_24),
        .D(\alu_exe1/AluOpt_C ),
        .Dec_reg(Dec_reg_n_0),
        .Ex_reg(Ex_reg_n_0),
        .\FSM_sequential_state_reg[0] (Pep9dec_n_1),
        .\FSM_sequential_state_reg[1] (Pep9dec_n_0),
        .\InstructionSpecifier[1] (\NLW_Pep9dec_InstructionSpecifier[1]_UNCONNECTED ),
        .InstructionSpecifier_IBUF(InstructionSpecifier_IBUF),
        .Nout_reg(Pep9dec_n_15),
        .O({Pep9exe_n_11,Pep9exe_n_12,Pep9exe_n_13,Pep9exe_n_14}),
        .Q(AluOpt_C_OBUF[7]),
        .S({Pep9dec_n_16,p_0_in[6:4]}),
        .St_reg(St_reg_n_0),
        .Sysclk_IBUF_BUFG(Sysclk_IBUF_BUFG),
        .V1_out(\alu_exe1/V1_out ),
        .VCk(\alu_exe1/VCk ),
        .Vout_reg(Pep9dec_n_34),
        .Vout_reg_0(Pep9exe_n_25),
        .Zout_reg(Pep9dec_n_14),
        .in0(NLW_Pep9dec_in0_UNCONNECTED[1:0]),
        .out(state),
        .p_0_in(p_0_in[0]),
        .resetbar_IBUF(resetbar_IBUF));
  Execute Pep9exe
       (.\Abus_reg[7] ({Pep9dec_n_21,Pep9dec_n_22,Pep9dec_n_23,Pep9dec_n_24}),
        .\Abus_reg[7]_0 (Pep9dec_n_13),
        .AluInp1_A(AluInp1_A),
        .\AluOpt_C_reg[3] ({Pep9exe_n_6,Pep9exe_n_7,Pep9exe_n_8,Pep9exe_n_9}),
        .\AluOpt_C_reg[3]_0 ({Pep9exe_n_15,Pep9exe_n_16,Pep9exe_n_17,Pep9exe_n_18}),
        .\AluOpt_C_reg[3]_1 (Pep9exe_n_35),
        .\AluOpt_C_reg[6] (Pep9exe_n_34),
        .\AluOpt_C_reg[7] ({Pep9exe_n_20,Pep9exe_n_21,Pep9exe_n_22,Pep9exe_n_23}),
        .\AluOpt_C_reg[7]_0 (Pep9dec_n_15),
        .\Bbus_reg[7] ({Pep9dec_n_36,Pep9dec_n_37,Pep9dec_n_38,Pep9dec_n_39}),
        .\Bbus_reg[7]_0 ({Pep9dec_n_25,Pep9dec_n_26,Pep9dec_n_27,Pep9dec_n_28}),
        .\Bbus_reg[7]_1 ({Pep9dec_n_29,Pep9dec_n_30,Pep9dec_n_31,Pep9dec_n_32}),
        .C3_out(\alu_exe1/C3_out ),
        .CCk(\alu_exe1/CCk ),
        .CO(Pep9exe_n_10),
        .C_OBUF(C_OBUF),
        .C_reg(Pep9exe_n_24),
        .Cin_IBUF(Cin_IBUF),
        .Cout_reg(Pep9exe_n_19),
        .D(\alu_exe1/AluOpt_C ),
        .Ex_reg(Ex_reg_n_0),
        .Ex_reg_0(Pep9dec_n_35),
        .Ex_reg_1(Pep9dec_n_34),
        .N_OBUF(N_OBUF),
        .O({Pep9exe_n_11,Pep9exe_n_12,Pep9exe_n_13,Pep9exe_n_14}),
        .Q({AluOpt_C_OBUF[7],NLW_Pep9exe_Q_UNCONNECTED[6:0]}),
        .S(Pep9dec_n_16),
        .Sysclk_IBUF_BUFG(Sysclk_IBUF_BUFG),
        .V1_out(\alu_exe1/V1_out ),
        .VCk(\alu_exe1/VCk ),
        .V_OBUF(V_OBUF),
        .V_reg(Pep9exe_n_25),
        .Z_OBUF(Z_OBUF),
        .\alu_ctrl_reg[1] (Pep9dec_n_14),
        .lopt(lopt),
        .lopt_1(lopt_1),
        .lopt_2(lopt_2),
        .lopt_3(lopt_3),
        .lopt_4(lopt_4),
        .lopt_5(lopt_5),
        .lopt_6(lopt_6),
        .lopt_7(lopt_7),
        .p_0_in({p_0_in[6:4],p_0_in[0]}));
  OBUF S_OBUF_inst
       (.I(1'b0),
        .O(S));
  LUT5 #(
    .INIT(32'hFA8AF08A)) 
    St_i_1
       (.I0(St_reg_n_0),
        .I1(Dec_reg_n_0),
        .I2(state[0]),
        .I3(state[1]),
        .I4(Ex_reg_n_0),
        .O(St_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    St_reg
       (.C(Sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(St_i_1_n_0),
        .Q(St_reg_n_0),
        .R(1'b0));
  BUFG Sysclk_IBUF_BUFG_inst
       (.I(Sysclk_IBUF),
        .O(Sysclk_IBUF_BUFG));
  IBUF Sysclk_IBUF_inst
       (.I(Sysclk),
        .O(Sysclk_IBUF));
  OBUF V_OBUF_inst
       (.I(V_OBUF),
        .O(V));
  OBUF Z_OBUF_inst
       (.I(Z_OBUF),
        .O(Z));
  IBUF resetbar_IBUF_inst
       (.I(resetbar),
        .O(resetbar_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
