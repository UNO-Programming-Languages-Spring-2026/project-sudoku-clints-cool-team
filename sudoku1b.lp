% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

%each cell must have only one number
%each row must have 1 of each number
%each col must have 1 of each number
%each square must have 1 of each number
%each subgrid must have 1 of each number


values(1..4).
row(1..4).
col(1..4).

%deal with initial
sudoku(R,C,V) :- initial(R,C,V).

%every cell can only have one number assigned to it
1 { sudoku(R, C, V) : values(V) } 1 :- row(R), col(C).

%every row needs 1 of each number
%it is not the case that atoms with the same R and V values do not also have the same C values
:- sudoku(R, C1, V), sudoku(R, C2, V), C1 != C2.

%Every col needs 1 of a number
%it is not the case that for every column and number, that there should be more than one row with that number
:- sudoku(R1, C, V), sudoku(R2, C, V), R1 != R2.

%origin is top left, in subgrid(R, C) where R = row, C = col

subgrid(R, C, G) :- row(R), col(C), BR = (R-1)/2, BC = (C-1)/2, G = BR*2 + BC + 1.




#show sudoku/3.
#show subgrid/3.