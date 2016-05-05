# Eratosthenes

Elixir implementations of Melissa O’Neill’s [genuine sieve of Eratosthenes](https://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf).

`Eratosthenes.Eager.sieve/1` is a fairly faithful translation from Haskell to Elixir,
but is less efficient since Elixir lacks Haskell's lazy lists.

`Eratosthenes.Lazy.sieve/1` is a more efficient implementation which produces a `Stream` of primes. 
