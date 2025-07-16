module collision_sprite_analyzer(

input  wire        clk,
  input  wire        rst_n,
  input  wire        new_pixel,
  input wire new_frame,
  input wire [7:0] address,
  input wire read,
  output reg [31:0] readdata,
  
  input  wire [22:0] h0_in,
  input  wire [22:0] h1_in,
  input  wire [22:0] h2_in,
  input  wire [22:0] h3_in,

  output wire        collision // ainda não implementado


);

  // Agrupamento de entradas
  wire [22:0] h_ins [0:3];	
  assign h_ins[0] = h0_in;
  assign h_ins[1] = h1_in;
  assign h_ins[2] = h2_in;
  assign h_ins[3] = h3_in; 

  // Extração dos campos
  wire [8:0]  id         [0:3];
  wire [4:0]  level      [0:3];
  wire [3:0]  offset_x   [0:3];
  wire [3:0]  offset_y   [0:3];  
  wire [31:0] aux_reg;
  
  reg [31:0] registers_collision_sprites[0:31]; // 1100000000000000000000000000000 <- Exemplo: sprite no level 10 "colidiu" com sprites no level 32 e 31
  reg [31:0] temp_registers [0:3];  // temporário para acumular no loop

  genvar idx;
  generate
    for (idx = 0; idx < 4; idx = idx + 1) begin : EXTRACT_H_INS
      assign level[idx]     = h_ins[idx][22:18];
      assign id[idx]        = h_ins[idx][17:9];
      assign offset_x[idx]  = h_ins[idx][8:5];
      assign offset_y[idx]  = h_ins[idx][4:1];
		
    end
  endgenerate
  
  
  integer i;
  integer j;
  
  reg reset_after_read;

always @(posedge clk ) begin
  if (!rst_n) begin
    reset_after_read <= 0;
  end else begin
    reset_after_read <= read; // captura o estado do read a cada ciclo
  end
end
  always @(posedge clk) begin
  
    if (!rst_n || reset_after_read) begin
	 
		
		 for (i=0; i<32; i=i+1) begin
		 
			registers_collision_sprites[i] <= 32'd0;
			
       end
		  
		  for (i=0; i<3; i=i+1) begin
		 
			temp_registers[i] <= 32'd0;
			
       end


    end else if (new_pixel) begin 
		
	    // registers_collision_sprites[28] <= 32'b11111111111111111111111111111111;
		 // registers_collision_sprites[29] <= 32'b11111111111111111111111111111111;
	 	 // registers_collision_sprites[30] <= 32'b11111111111111111111111111111111;
		//  registers_collision_sprites[31] <= 32'b11111111111111111111111111111111;
		 // temp_registers[30] = 32'b11111111111111111111111111111111;
		 // temp_registers[i][31] = 32'b11111111111111111111111111111111;
	 
		for (i = 0; i < 4; i = i + 1) begin
			for (j = 0; j < 4; j = j + 1) begin
		// Marca o bit do level correspondente no registrador do level atual
			if(id[i] != 0 && i != j) begin
			
				//registers_collision_sprites[level[i]] <= registers_collision_sprites[level[i]] | (32'b1 << level[j]);
				 temp_registers[i] = temp_registers[i] | (32'b1 << level[j]);
				end
			end
		end
		
      for (i = 0; i < 4; i = i + 1) begin
			registers_collision_sprites[level[i]] <= temp_registers[i];
		end
    end
  end
  
  
  /////NIOS READ
 	 

// Lógica de transição de estados (registrada no clock)
	always @(posedge clk) begin
    if (!rst_n) begin
        readdata <= 32'd0;
    end else begin 
		if (read) begin
        if (address >= 8'd37 && address <= 8'd68) begin
            readdata <= registers_collision_sprites[address - 36];
        end
		end
	  end
	end

  endmodule