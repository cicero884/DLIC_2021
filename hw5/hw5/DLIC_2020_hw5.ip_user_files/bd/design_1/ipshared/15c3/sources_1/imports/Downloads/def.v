// This is generated automatically on 2021/09/27-16:48:30
`ifndef __FLAG_DEF__
`define __FLAG_DEF__

// There're 6 states in this design
`define S_WAIT                 	 0  
`define S_READ_W               	 1  
`define S_READ                 	 2  
`define S_OPT                  	 3  
`define S_WRITE                	 4  
`define S_END                  	 5  
`define S_ZVEC                 	 6'b0
`define STATE_W                	 6  

// Macro from template
`define BUF_SIZE               	 9  
`define DATA_WIDTH             	 32 
`define ADDR_WIDTH             	 32 
`define EMPTY_WORD             	 32'b0
`define EMPTY_ADDR             	 32'b0

// Self-defined macro
`define CNT_W                  	 4  
`define GLB_CNT_W              	 5  
`define IMG_SIZE               	 28 

`endif
