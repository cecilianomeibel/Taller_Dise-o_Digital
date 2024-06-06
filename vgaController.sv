module vgaController(
	
	input logic vgaclk,
	output logic hsync,
	output logic vsync,
	output logic vga_sync,
	output logic vga_blank,
	output logic [9:0] counterH, 
	output logic [9:0] counterV	
);
	// horizontal
	parameter HACTIVE = 10'd640;
	parameter HFP = 10'd16;
	parameter HSYN = 10'd96;
	parameter HBP = 10'd48;
	parameter HMAX = HACTIVE + HFP + HSYN + HBP;
	// vertical
	parameter VBP = 10'd32;
	parameter VACTIVE = 10'd480;
	parameter VFP = 10'd11;
	parameter VSYN = 10'd2;
	parameter VMAX = VACTIVE + VFP + VSYN + VBP;
	
	
	always @(posedge vgaclk) begin
	
		counteH++;
		if (counteH == HMAX) begin
		
			counteH = 0;
			counterV++;
			if (counterV == VMAX) 
				counterVQ = 0;
		end
		
	end
	
	// Compute sync signals (active low)
	assign hsync = ~(counteH >= HACTIVE + HFP & counteH < HACTIVE + HFP + HSYN);
	assign vsync = ~(counterV >= VACTIVE + VFP & counterV < VACTIVE + VFP + VSYN);
	assign vga_sync = hsync & vsync;
	
	// Force outputs to blacounteHck when outside the legal display area
	assign vga_blank = (counteH < HACTIVE) & (counterV < VACTIVE);
		
endmodule