`timescale 1ns/10ps
`define CYCLE 20.0 // Cycle time
`define MAX 300000 // Max cycle number

`timescale 1ns/10ps
`define FSDB_ALL
`ifdef SDF
`define SDFFILE "./conv_syn.sdf"  // Modify your sdf file name
`endif


module top_tb;

  reg clk;
  reg rst;
  wire fin;
  reg start;
  wire qst;
  reg [31:0] GOLDEN[4096:0];
  reg  [31:0] in_data[4096:0];

  wire  M0_R_req;
  wire  [31:0]M0_addr;
  wire  [31:0]M0_R_data;
  wire  [3:0]M0_W_req;
  wire  [31:0]M0_W_data;
  
  wire  M1_R_req;
  wire  [31:0]M1_addr;
  wire  [31:0]M1_R_data;
  wire  [3:0]M1_W_req;
  wire  [31:0]M1_W_data;
  
  
  integer gf, i, num;
  integer img;
  wire [31:0] temp;
  integer err;
  always #(`CYCLE/2) clk = ~clk;

  conv TOP(
    .rst(rst),
    .clk(clk),
    .M0_R_req(M0_R_req), 
    .M0_addr(M0_addr), 
    .M0_R_data(M0_R_data), 
    .M0_W_req(M0_W_req), 
    .M0_W_data(M0_W_data),
    .M1_R_req(M1_R_req), 
    .M1_addr(M1_addr), 
    .M1_R_data(M1_R_data), 
    .M1_W_req(M1_W_req), 
    .M1_W_data(M1_W_data),
    .start(start),
    .finish(fin)
  );
  
  bram_sim M0(
    .rst(rst),
    .clk(clk),
    
    .R_req(M0_R_req), 
    .addr(M0_addr), 
    .R_data(M0_R_data), 
    .W_req(M0_W_req), 
    .W_data(M0_W_data)

  );
  
  bram_sim M1(
    .rst(rst),
    .clk(clk),
    
    .R_req(M1_R_req), 
    .addr(M1_addr), 
    .R_data(M1_R_data), 
    .W_req(M1_W_req), 
    .W_data(M1_W_data)

  );
  
//`ifdef SDF
//  initial $sdf_annotate(`SDFFILE, TOP);
//`endif
  

  initial
  begin
    clk = 0; rst = 1;
    start =0;
    #1 rst = 0;
    #(`CYCLE) rst = 1;
    
    
    $readmemh("./input.hex", in_data);
    for (i = 0; i < 800; i=i+1)
    begin
      M0.bram[i] = in_data[i];
    end
    num = 0;
    gf = $fopen( "./golden.hex", "r");
    while (!$feof(gf))
    begin
      $fscanf(gf, "%h \n", GOLDEN[num]);
      num = num + 1;
    end
    $fclose(gf);
    #20
    start =1;
    #(`CYCLE)
    start =0;
    wait(fin);
    #(`CYCLE*2)
    #20 
    $display("\nDone\n");
    err = 0;
    //num=6;
    for (i = 0; i < num; i=i+1)
    begin
      if(M1.bram[i] !== GOLDEN[i])begin
        $display("DM[%4d] = %h, expect = %h", i, M1.bram[i], GOLDEN[i]);
        err = err + 1;
      end
      
      
      else
      begin
        $display("DM[%4d] = %h, pass",  i, M1.bram[i]);
      end
      
    end
    result(err, num);
    $finish;
  end

  `ifdef SYN
  initial $sdf_annotate("../syn/conv_test_syn.sdf", TOP);
  `endif


	
	
  initial
  begin
//    $shm_open(`SHM_FILE);
//    $shm_probe("ASM");
//    $fsdbDumpfile(`FSDB_FILE);
//    $fsdbDumpvars;
//    $fsdbDumpMDA;
    #(`CYCLE*`MAX)
    for (i = 0; i < num; i=i+1)
    begin
      if(M1.bram[i] !== GOLDEN[i])begin
        $display("DM[%4d] = %h, expect = %h", i, M1.bram[i], GOLDEN[i]);
        err = err + 1;
      end
      
      
      else
      begin
        $display("DM[%4d] = %h, pass",  i, M1.bram[i]);
      end
      
    end
    $display("SIM_END no finish!!!");
    result(num, num);
    $finish;
  end
  
  task result;
    input integer err;
    input integer num;
    integer rf;
    begin     
			rf = $fopen({"./result_rtl.txt"}, "w");
      $fdisplay(rf, "%d,%d", num - err, num);
      if (err === 0)
      begin
        $display("\n");
        $display("\n");
        $display("        ****************************               ");
        $display("        **                        **       |\__||  ");
        $display("        **  Congratulations !!    **      / ^.^  | ");
        $display("        **                        **    /_____   | ");
        $display("        **  Simulation PASS!!     **   /^ ^ ^ \\  |");
        $display("        **                        **  |^ ^ ^ ^ |w| ");
        $display("        ****************************   \\m___m__|_|");
        $display("\n");
      end
      else
      begin
        $display("\n");
        $display("\n");
        $display("        ****************************               ");
        $display("        **                        **       |\__||  ");
        $display("        **  OOPS!!                **      / X,X  | ");
        $display("        **                        **    /_____   | ");
        $display("        **  Simulation Failed!!   **   /^ ^ ^ \\  |");
        $display("        **                        **  |^ ^ ^ ^ |w| ");
        $display("        ****************************   \\m___m__|_|");
        $display("         Totally has %d errors                     ", err); 
        $display("\n");
      end
    end
  endtask

endmodule
