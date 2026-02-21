% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...



%each row must have 1 of each number
%each col must have 1 of each number
%each square must have 1 of each number

%values(1)

values(1..4) .
row(1..2).
col(1..2).

%every cell can only have one number assigned to it
1 { sudoku(R, C, V) : values(V) } 1 :- row(R), col(C).

%every row needs 1 of each number
it is not the case that for every row and number, that threre should bem ore than one column with that number

%Every co needs 1 of a number
it is not the case that for every column and number, that there should be more than one row with that number

#show sudoku/3.
