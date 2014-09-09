/*
 * TDDD08 Logic Programming
 * Autumn 2014
 * Lab 1
 * Alexander Häger (aleha209)
 * Emil Tholin (emith809)
 */

% --------- Facts -----------
woman(ulrika).
woman(bettan).

man(peter).
man(bosse).
man(nisse).

beautiful(ulrika).
beautiful(nisse).
beautiful(peter).

rich(nisse).
rich(bettan).

strong(bettan).
strong(peter).
strong(bosse).

kind(bosse).

% --------- Procedures -----------


like(X, Y) :- 
    man(X), 
    beautiful(Y), 
    woman(Y).

like(nisse, X) :-
    woman(X), 
    like(X, nisse).

like(ulrika, X) :-
    man(X), 
    like(X, ulrika), 
    rich(X), 
    kind(X).

like(ulrika, X) :-
    man(X), 
    like(X, ulrika), 
    beautiful(X), 
    strong(X).



happy(X) :- 
    rich(X), 
    man(X).

happy(X) :-
    rich(X),
    woman(X).

happy(X) :-
    man(X), 
    woman(Y), 
    like(X,Y), 
    like(Y,X).

happy(X) :-
    woman(X), 
    man(Y), 
    like(X,Y), 
    like(Y,X).
