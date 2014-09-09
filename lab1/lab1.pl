% 1
beautiful(ulrika).

% 2
beautiful(nisse).

% 3
rich(bettan).
strong(bettan).

% 4
strong(peter).
beautiful(peter).

% 5
kind(bosse).
strong(bosse).

% 6
man(peter).
man(bosse).
woman(ulrika).
woman(bettan).
like(X, Y) :- 
    man(X), beautiful(Y), woman(Y).

% 7
happy(X) :- 
    rich(X), man(X).
happy(X) :-
    rich(X), woman(Y).

% 8
