% ARTI 303 - Programming for AI
% Lab 5 - Task 1: The Simpsons family tree - Rules
% Name: Rawan Alqattan   Section: F02

% FACTS

% gender
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% parent(Parent, Child)
parent(abraham, herb).
parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).

% RULES

% X is the father of Y if X is a parent of Y and X is male
father(X, Y) :- parent(X, Y), male(X).

% X is the mother of Y if X is a parent of Y and X is female
mother(X, Y) :- parent(X, Y), female(X).

% X is the son of Y if Y is a parent of X and X is male
son(X, Y) :- parent(Y, X), male(X).

% X is the daughter of Y if Y is a parent of X and X is female
daughter(X, Y) :- parent(Y, X), female(X).

% X is the brother of Y if they share a parent, X is male, and X is not Y
brother(X, Y) :- parent(P, X), parent(P, Y), male(X), X \= Y.

% X is the sister of Y if they share a parent, X is female, and X is not Y
sister(X, Y) :- parent(P, X), parent(P, Y), female(X), X \= Y.

% X is the grandfather of Z if X is a parent of Y, Y is a parent of Z, and X is male
grandfather(X, Z) :- parent(X, Y), parent(Y, Z), male(X).

% X is the uncle of Y if X is the brother of one of Y's parents
uncle(X, Y) :- parent(P, Y), brother(X, P).

% X is the aunt of Y if X is the sister of one of Y's parents
aunt(X, Y) :- parent(P, Y), sister(X, P).

% X and Y are cousins if their parents are different children of the same person
cousin(X, Y) :- parent(P1, X), parent(P2, Y), parent(G, P1), parent(G, P2), P1 \= P2.

% ancestor - recursive (base case + recursive case)
ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

