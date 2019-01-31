TITLE Tic Tac Toe     (TicTacToe.asm)

; Author: Ethan Duong
; Course / Project ID: CS 271 EC Program           Date: 1/26/19
; Description: This program simulates the game, Tic Tac Toe.

INCLUDE Irvine32.inc

; (insert constant definitions here)
MAX_LENGTH_NAME = 101	; max length of user's name

.data
; Messages
welcomeMsg		BYTE	"My name is Ethan Duong and welcome to Tic Tac Toe.", 0dh, 0ah, 0
getName			BYTE	"Please enter your name: ", 0
greetMsg1		BYTE	"Hello, ", 0
greetMsg2		BYTE	", welcome to my program.", 0dh, 0ah, 0
instrcMsg		BYTE	"Please enter an integer from 1 to 9 to make a move. (Think of a numpad)", 0dh, 0ah, 0
checkMsg		BYTE	"You entered: ", 0
invalidMsg		BYTE	"That is not a valid move.", 0dh, 0ah, 0
againMsg		BYTE	"Do you want to play again? (Enter 1 for yes, anything else for no)", 0dh, 0ah, 0
byeMsg			BYTE	"Thank you for using my program, ", 0
; board states
boardLine1		BYTE	"   |   |   ", 0dh, 0ah, 0	; line 1, 3, 5, 7, 9
boardLine214	BYTE	" ", 0						; line (2, 6, 10) spaces 1, 4
boardLine223	BYTE	" | ", 0					; line (2, 6, 10) spaces 2, 3
boardLine4		BYTE	"-----------", 0dh, 0ah, 0	; line 4, 8
; variables
userName		BYTE	MAX_LENGTH_NAME		DUP (0)	; user's name
currentChar		BYTE	1					DUP	(0)	; current player X or O
inputMove		DWORD	?							; user's move
; bools
buildBlank		DWORD	0							; if first board has been created already
; variables for board positions
space1			BYTE	" ", 0
space2			BYTE	" ", 0
space3			BYTE	" ", 0
space4			BYTE	" ", 0
space5			BYTE	" ", 0
space6			BYTE	" ", 0
space7			BYTE	" ", 0
space8			BYTE	" ", 0
space9			BYTE	" ", 0

;space1			BYTE	"1", 0
;space2			BYTE	"2", 0
;space3			BYTE	"3", 0
;space4			BYTE	"4", 0
;space5			BYTE	"5", 0
;space6			BYTE	"6", 0
;space7			BYTE	"7", 0
;space8			BYTE	"8", 0
;space9			BYTE	"9", 0
; bools for if space is occupied
space1Bool		DWORD	0
space2Bool		DWORD	0
space3Bool		DWORD	0
space4Bool		DWORD	0
space5Bool		DWORD	0
space6Bool		DWORD	0
space7Bool		DWORD	0
space8Bool		DWORD	0
space9Bool		DWORD	0

.code
main PROC
		; display author's name and title of project
		mov		edx, OFFSET welcomeMsg
		call	WriteString
		call	CrLf

		; get name and greet user with a max of 100 char
		mov		edx, OFFSET getName
		call	WriteString
		mov		edx, OFFSET userName
		mov		ecx, MAX_LENGTH_NAME
		call	ReadString
		mov		edx, OFFSET greetMsg1
		call	WriteString
		mov		edx, OFFSET userName
		call	WriteString
		mov		edx, OFFSET greetMsg2
		call	WriteString
		call	CrLf

		cmp		buildBlank,	0
		je		printBoard

	;printBoard: ; display tic tac toe board
		;;call	Clrscr
		;; line 1
		;mov		edx, OFFSET boardLine1
		;call	WriteString
		;; line 2
		;mov		edx, OFFSET boardLine214
		;call	WriteString
		;mov		edx, OFFSET space7
		;call	WriteString
		;mov		edx, OFFSET boardLine223
		;call	WriteString
		;mov		edx, OFFSET space8
		;call	WriteString
		;mov		edx, OFFSET boardLine223
		;call	WriteString
		;mov		edx, OFFSET space9
		;call	WriteString
		;mov		edx, OFFSET boardLine214
		;call	WriteString
		;call	CrLf
		;; line 3
		;mov		edx, OFFSET boardLine1
		;call	WriteString
		;; line 4
		;mov		edx, OFFSET boardLine4
		;call	WriteString
		;; line 5
		;mov		edx, OFFSET boardLine1
		;call	WriteString
		;; line 6
		;mov		edx, OFFSET boardLine214
		;call	WriteString
		;mov		edx, OFFSET space4
		;call	WriteString
		;mov		edx, OFFSET boardLine223
		;call	WriteString
		;mov		edx, OFFSET space5
		;call	WriteString
		;mov		edx, OFFSET boardLine223
		;call	WriteString
		;mov		edx, OFFSET space6
		;call	WriteString
		;mov		edx, OFFSET boardLine214
		;call	WriteString
		;call	CrLf
		;; line 7
		;mov		edx, OFFSET boardLine1
		;call	WriteString
		;; line 8
		;mov		edx, OFFSET boardLine4
		;call	WriteString
		;; line 9
		;mov		edx, OFFSET boardLine1
		;call	WriteString
		;; line 10
		;mov		edx, OFFSET boardLine214
		;call	WriteString
		;mov		edx, OFFSET space1
		;call	WriteString
		;mov		edx, OFFSET boardLine223
		;call	WriteString
		;mov		edx, OFFSET space2
		;call	WriteString
		;mov		edx, OFFSET boardLine223
		;call	WriteString
		;mov		edx, OFFSET space3
		;call	WriteString
		;mov		edx, OFFSET boardLine214
		;call	WriteString
		;call	CrLf
		;; line 11
		;mov		edx, OFFSET boardLine1
		;call	WriteString
		;call	CrLf
		;call	CrLf

	getMove: ; get input for move
		mov		buildBlank, 1	; set bool to true, don't initial build again
		mov		edx, OFFSET instrcMsg
		call	WriteString
		call	ReadDec
		mov		inputMove, eax
		call	CrLf

		; check if valid
		cmp		inputMove, 1
		jl		invalidMove
		cmp		inputMove, 9
		jg		invalidMove

		;; relay what user wrote
		;mov		edx, OFFSET checkMsg
		;call	WriteString
		;mov		eax, inputMove
		;call	WriteDec
		;call	CrLf
		;call	CrLf

		; check what user wrote
		cmp		inputMove, 1
		je		xMove1
		cmp		inputMove, 2
		je		xMove2
		cmp		inputMove, 3
		je		xMove3
		cmp		inputMove, 4
		je		xMove4
		cmp		inputMove, 5
		je		xMove5
		cmp		inputMove, 6
		je		xMove6
		cmp		inputMove, 7
		je		xMove7
		cmp		inputMove, 8
		je		xMove8
		cmp		inputMove, 9
		je		xMove9





	printBoard: ; display tic tac toe board
		;call	Clrscr
		; line 1
		mov		edx, OFFSET boardLine1
		call	WriteString
		; line 2
		mov		edx, OFFSET boardLine214
		call	WriteString
		mov		edx, OFFSET space7
		call	WriteString
		mov		edx, OFFSET boardLine223
		call	WriteString
		mov		edx, OFFSET space8
		call	WriteString
		mov		edx, OFFSET boardLine223
		call	WriteString
		mov		edx, OFFSET space9
		call	WriteString
		mov		edx, OFFSET boardLine214
		call	WriteString
		call	CrLf
		; line 3
		mov		edx, OFFSET boardLine1
		call	WriteString
		; line 4
		mov		edx, OFFSET boardLine4
		call	WriteString
		; line 5
		mov		edx, OFFSET boardLine1
		call	WriteString
		; line 6
		mov		edx, OFFSET boardLine214
		call	WriteString
		mov		edx, OFFSET space4
		call	WriteString
		mov		edx, OFFSET boardLine223
		call	WriteString
		mov		edx, OFFSET space5
		call	WriteString
		mov		edx, OFFSET boardLine223
		call	WriteString
		mov		edx, OFFSET space6
		call	WriteString
		mov		edx, OFFSET boardLine214
		call	WriteString
		call	CrLf
		; line 7
		mov		edx, OFFSET boardLine1
		call	WriteString
		; line 8
		mov		edx, OFFSET boardLine4
		call	WriteString
		; line 9
		mov		edx, OFFSET boardLine1
		call	WriteString
		; line 10
		mov		edx, OFFSET boardLine214
		call	WriteString
		mov		edx, OFFSET space1
		call	WriteString
		mov		edx, OFFSET boardLine223
		call	WriteString
		mov		edx, OFFSET space2
		call	WriteString
		mov		edx, OFFSET boardLine223
		call	WriteString
		mov		edx, OFFSET space3
		call	WriteString
		mov		edx, OFFSET boardLine214
		call	WriteString
		call	CrLf
		; line 11
		mov		edx, OFFSET boardLine1
		call	WriteString
		call	CrLf
		call	CrLf
		; if first time building, jump back
		cmp		buildBlank,	0
		je		getMove







	checkWin: ; check if game has ended
		;call	Clrscr
		;jmp		printBoard

	checkFull: ; check if pieces are present
		space1Check: ; space 1
			cmp		space1, "X"
			je		space1Full
			cmp		space1, "O"
			je		space1Full
		space2Check: ; space 2
			cmp		space2, "X"
			je		space2Full
			cmp		space2, "O"
			je		space2Full
		space3Check: ; space 3
			cmp		space3, "X"
			je		space3Full
			cmp		space3, "O"
			je		space3Full
		space4Check: ; space 4
			cmp		space4, "X"
			je		space4Full
			cmp		space4, "O"
			je		space4Full
		space5Check: ; space 5
			cmp		space5, "X"
			je		space5Full
			cmp		space5, "O"
			je		space5Full
		space6Check: ; space 6
			cmp		space6, "X"
			je		space6Full
			cmp		space6, "O"
			je		space6Full
		space7Check: ; space 7
			cmp		space7, "X"
			je		space7Full
			cmp		space7, "O"
			je		space7Full
		space8Check: ; space 8
			cmp		space8, "X"
			je		space8Full
			cmp		space8, "O"
			je		space8Full
		space9Check: ; space 9
			cmp		space9, "X"
			je		space9Full
			cmp		space9, "O"
			je		space9Full
		space10Check: ; exit for space 9, here for consistency

	checkBoardFull: ; check if all 9 pieces are filled
		cmp		space1Bool, 1
		jne		getMove
		cmp		space2Bool, 1
		jne		getMove
		cmp		space3Bool, 1
		jne		getMove
		cmp		space4Bool, 1
		jne		getMove
		cmp		space5Bool, 1
		jne		getMove
		cmp		space6Bool, 1
		jne		getMove
		cmp		space7Bool, 1
		jne		getMove
		cmp		space8Bool, 1
		jne		getMove
		cmp		space9Bool, 1
		jne		getMove

		; ask if want to play again
		mov		edx, OFFSET againMsg
		call	WriteString
		call	ReadDec
		;call	Clrscr
		cmp		eax, 1
		je		getMove

		; say goodbye
		call	CrLf
		mov		edx, OFFSET byeMsg
		call	Writestring
		mov		edx, OFFSET userName
		call	WriteString
		call	CrLf
		exit	; exit to operating system



	invalidMove: ; input is out of bounds
		mov		edx, OFFSET invalidMsg
		call	Writestring
		call	CrLf
		jmp		getMove

	; Player X makes a move
	xMove1:
		mov		space1, "X"
		jmp		printBoard

	xMove2:
		mov		space2, "X"
		jmp		printBoard

	xMove3:
		mov		space3, "X"
		jmp		printBoard

	xMove4:
		mov		space4, "X"
		jmp		printBoard

	xMove5:
		mov		space5, "X"
		jmp		printBoard

	xMove6:
		mov		space6, "X"
		jmp		printBoard

	xMove7:
		mov		space7, "X"
		jmp		printBoard

	xMove8:
		mov		space8, "X"
		jmp		printBoard

	xMove9:
		mov		space9, "X"
		jmp		printBoard

	; check if spaces are occupied
	space1Full:
		mov		space1Bool, 1
		jmp		space2Check

	space2Full:
		mov		space2Bool, 1
		jmp		space3Check

	space3Full:
		mov		space3Bool, 1
		jmp		space4Check

	space4Full:
		mov		space4Bool, 1
		jmp		space5Check

	space5Full:
		mov		space5Bool, 1
		jmp		space6Check

	space6Full:
		mov		space6Bool, 1
		jmp		space7Check

	space7Full:
		mov		space7Bool, 1
		jmp		space8Check

	space8Full:
		mov		space8Bool, 1
		jmp		space9Check

	space9Full:
		mov		space9Bool, 1
		jmp		space10Check

		

main ENDP

; (insert additional procedures here)

END main
