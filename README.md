# elm-game-of-colife

An experiment modeling Conway's Game of Life using a comonadic design.

## Motivation

Many of the game of life designs follow an imperative thought process. If we take a step back, and think about the design from a different perspective, we should be able to make a more readable version.

Cellular automata are naturally modeled by comonads. This property has been known for years and implemented in a few languages at this point. However, many people are scared of the word comonad, so a beautiful solution is relegated to the minds of few. Since Conway's Game of Life is a cellular automata, it makes sense to explore modeling with comonads in elm.

A very hand-wavy way to understand comonads is recognize that they model algorithms where the result of one small part depends on the context in which said part exists. Cellular automata decide whether each cell lives or dies based their neighbors. Put another way: each cell decides what to do next depending on the context it is currently in.

When we separate out "generating the context for a cell", from the rules that govern what that cell will do next, we arrive at a very clear abstraction.

It should be known that since there's no real way to write a comonad in elm, we take a couple shortcuts:

* we don't bother with the functor
* we don't worry about laws

A.k.a We're throwing the baby out with the bathwater. The language pushes us into ad-hoc solutions, so why care about generality and rigor?

Enough prose, look at the code!
