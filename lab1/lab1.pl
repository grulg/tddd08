% 1
beautiful(ulrika).

% 2
beautiful(nisse).
rich(nisse).

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
man(nisse).
woman(ulrika).
woman(bettan).
like(X, Y) :- 
    man(X), beautiful(Y), woman(Y).

% 7
happy(X) :- 
    rich(X), man(X).
happy(X) :-
    rich(X), woman(X).

% 8
happy(X) :-
    man(X), woman(Y), like(X,Y), like(Y,X).

% 9
happy(X) :-
    woman(X), man(Y), like(X,Y), like(Y,X).

% 10
like(nisse, X) :-
    woman(X), like(X, nisse).

% 11
like(ulrika, X) :-
    man(X), like(X, ulrika), rich(X), kind(X).

like(ulrika, X) :-
    man(X), like(X, ulrika), beautiful(X), strong(X).
