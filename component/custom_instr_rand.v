// ===================================================================
// TITLE : Xorshift128 random instruction for NiosII
//
//   DEGISN : S.OSAFUNE (J-7SYSTEM Works)
//   DATE   : 2015/05/14 -> 2015/05/14
//   UPDATE : 
//
// ===================================================================
// *******************************************************************
//   Copyright (C) 2015, J-7SYSTEM Works.  All rights Reserved.
//
// * This module is a free sourcecode and there is NO WARRANTY.
// * No restriction on use. You can use, modify and redistribute it
//   for personal, non-profit or commercial products UNDER YOUR
//   RESPONSIBILITY.
// * Redistributions of source code must retain the above copyright
//   notice.
// *******************************************************************

module custom_instr_rand(
	// Multicycle
	input			clk,
	input			clk_en,
	input			reset,
	output [31:0]	result
);


/* ===== �O���ύX�\�p�����[�^ ========== */



/* ----- �����p�����[�^ ------------------ */



/* ���ȍ~�̃p�����[�^�錾�͋֎~�� */

/* ===== �m�[�h�錾 ====================== */
				/* �����͑S�Đ��_�����Z�b�g�Ƃ���B�����Œ�`���Ă��Ȃ��m�[�h�̎g�p�͋֎~ */
	wire			reset_sig = reset;					// ���W���[�������쓮�񓯊����Z�b�g 

				/* �����͑S�Đ��G�b�W�쓮�Ƃ���B�����Œ�`���Ă��Ȃ��N���b�N�m�[�h�̎g�p�͋֎~ */
	wire			clock_sig = clk;					// ���W���[�������쓮�N���b�N 

	reg  [31:0]		x_reg, y_reg, z_reg, w_reg;
	wire [31:0]		t_sig, r_sig;


/* ���ȍ~��wire�Areg�錾�͋֎~�� */

/* ===== �e�X�g�L�q ============== */



/* ===== ���W���[���\���L�q ============== */

	assign result = w_reg;

	assign t_sig = x_reg ^ {x_reg[20:0], {11{1'b0}}};
	assign r_sig = (w_reg ^ {{19{1'b0}}, w_reg[31:19]}) ^ (t_sig ^ {{8{1'b0}}, t_sig[31:8]});

	always @(posedge clock_sig or posedge reset_sig) begin
		if (reset_sig) begin
			x_reg <= 32'd123456789;
			y_reg <= 32'd362436069;
			z_reg <= 32'd521288629;
			w_reg <= 32'd88675123;
		end
		else begin
			if (clk_en) begin
				x_reg <= y_reg;
				y_reg <= z_reg;
				z_reg <= w_reg;
				w_reg <= r_sig;
			end
		end
	end



endmodule
