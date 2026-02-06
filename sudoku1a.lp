% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
% Domains
row(1..4).
col(1..4).
num(1..4).

% One number per cell
1 { cell(R,C,N) : num(N) } 1 :- row(R), col(C).

% Row constraints
:- row(R), num(N), 2 { cell(R,C,N) : col(C) }.

% Column constraints
:- col(C), num(N), 2 { cell(R,C,N) : row(R) }.

% 2x2 block constraints
block(RB,CB) :- RB=1..2, CB=1..2.

:- block(RB,CB), num(N),
   2 { cell(R,C,N) :
        R = 2*(RB-1)+1..2*RB,
        C = 2*(CB-1)+1..2*CB }.

% Given clues
cell(R,C,N) :- initial(R,C,N).

% Show answers
#show sudoku/3.
