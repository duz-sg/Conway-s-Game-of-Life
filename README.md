# Conway-s-Game-of-Life

## Background:
This script born in a hackathon within a time limit, may not be the optimal solution, just share for fun

## What
Quote from Wikipedia
https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970.[1]

The "game" is a zero-player game, meaning that its evolution is determined by its initial state, requiring no further input. One interacts with the Game of Life by creating an initial configuration and observing how it evolves or, for advanced players, by creating patterns with particular properties.

## Rule:
The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, alive or dead. Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

Any live cell with fewer than two live neighbours dies, as if caused by under-population.

Any live cell with two or three live neighbours lives on to the next generation.

Any live cell with more than three live neighbours dies, as if by over-population.

Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

## Usage:
perl GameOfLife.pl

