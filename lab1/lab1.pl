/*
 * TDDD08 Logic Programming
 * Autumn 2014
 * Lab 1
 * Alexander Häger (aleha209)
 * Emil Tholin (emith809)
 */

% Lab 1.1
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

% --------- Rules -----------

% Men likes women who are beautiful
like(X, Y) :- 
    man(X), 
    beautiful(Y), 
    woman(Y).

% Nisse likes women who likes him back
like(nisse, X) :-
    woman(X), 
    like(X, nisse).

% Ulrika likes men who are rich and kind
like(ulrika, X) :-
    man(X),
    rich(X), 
    kind(X),
    like(X, ulrika).

% Ulrika likes men who are beautiful and strong
like(ulrika, X) :-
    man(X),  
    beautiful(X), 
    strong(X),
    like(X, ulrika).

% A man is happy if he's rich
happy(X) :- 
    rich(X), 
    man(X).

% A woman is happy if she's rich
happy(X) :-
    rich(X),
    woman(X).

% Men like women who likes them back
happy(X) :-
    man(X), 
    woman(Y), 
    like(X,Y), 
    like(Y,X).

% Women like men who likes them back
happy(X) :-
    woman(X), 
    man(Y), 
    like(X,Y), 
    like(Y,X).

% Questions
/* 
Who is happy?
?- happy(X).
X = nisse ;
X = bettan ;
X = peter ;
X = ulrika ;

Who likes who?
?- like(X, Y).
X = peter,
Y = ulrika ;
X = bosse,
Y = ulrika ;
X = nisse,
Y = ulrika ;
X = ulrika,
Y = peter ;

How many persons like Ulrika?
?- setof(X, like(X, ulrika), Y), length(Y, Z).
Y = [bosse, nisse, peter],
Z = 3.

*/

% Lab 1.2
% All the nodes
node(a).
node(b).
node(c).
node(d).
node(e).
node(f).
node(g).

% Edge declartion between nodes
edge(a, b).
edge(a, c).
edge(b, c).
edge(c, d).
edge(c, e).
edge(d, f).
edge(e, f).
edge(e, g).
edge(f, g).

% Path/2
% Returns true if there exist a path between node X and Y.
path(X, Y) :-
    edge(X, Y).

path(X, Y) :-
    edge(X, Z),
    path(Z, Y).

% Path/3
% Finds and records a path in Z between nodes X and Y.
path(X, Y, [W|Zs]) :-
    edge(X, W),
    path(W, Y, Zs).

path(X, Y, [Y]) :-
    edge(X, Y).

% NPath/3
% Finds and returns the number of nodes in Z between X and Y.
npath(X, Y, Z) :-
    path(X, Y, W),
    length(W, Z).

