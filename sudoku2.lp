% Domains
row(1..l).
col(1..l).
num(1..l).

%determine block size
blockSize(B) :- B*B=l.
:- not blockSize(_).

% One number per sudoku
1 { sudoku(R,C,N) : num(N) } 1 :- row(R), col(C).

% Row constraints
:- row(R), num(N), 2 { sudoku(R,C,N) : col(C) }.

% Column constraints
:- col(C), num(N), 2 { sudoku(R,C,N) : row(R) }.

% 3x3 block constraints
block(RB,CB) :- RB=1..3, CB=1..3.

:- block(RB,CB), num(N),
   2 { sudoku(R,C,N) :
        R = B*(RB-1)+1..B*RB,
        C = B*(CB-1)+1..B*CB }.

% Given clues
sudoku(R,C,N) :- initial(R,C,N).

% Show answers
#show sudoku/3.
