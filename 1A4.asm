	ORG 10
SET_P,
	LDA A
	STA P
/ for(a=3;a<=N;a++)
FOR_A,
	CLE
	LDA A
	INC
	SZE
	BUN STOP
	STA A		/ A++
	CMA
	INC
	ADD N		/ N - A
	SZE		/ (A <= N)?
	BUN CLA_B
	BUN STOP
CLA_B,	CLA
	INC
	STA B		/ B = 1
/ for(b=2;b<a;b++)
FOR_B,
	LDA B
	INC
	STA B		/ B++
	STA Y		/ Y = B
	LDA A
	STA X		/ X = A
	CMA
	INC
	ADD B		/ B - A
	SZE		/ (B < A)?
	BUN SET_P
	CLA
	STA C		/ C = 0
Y_SHL,
	CLE
	LDA Y
	CIL
	SZE
	BUN DIV
	STA Y
	LDA C
	INC
	STA C		/ C++
	BUN Y_SHL
DIV,
	CLE
	LDA Y
	CMA
	INC
	ADD X		/ X - Y
	SZE		/ (X >= Y)?
	BUN STA_X
	BUN Y_SHR
STA_X,	STA X
	SZA		/ (X - Y == 0)?
	BUN Y_SHR
	BUN FOR_A
Y_SHR,
	LDA C
	SZA		/ (C == 0)?
	BUN DEC_C
	BUN FOR_B
DEC_C,	CLA
	INC
	CMA
	INC
	ADD C		/ C -= 1
	STA C
	CLE
	LDA Y
	CIR
	STA Y
	BUN DIV
STOP,
	HLT
/ data
N,	DEC 255		/ 任意の正の整数
A,	DEC 2		/ 素数かどうか調べる数
B,	DEC 0		/ Aを割る数
X,	DEC 0		/ 被除数および部分剰余
Y,	DEC 0		/ 除数
C,	DEC 0		/ シフトカウンタ
P,	DEC 0		/ 素数
END
