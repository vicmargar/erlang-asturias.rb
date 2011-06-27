-module(animales).

-export([sonido/1]).

sonido(perro) ->
    io:format("Guau guau!~n");

sonido(gato) ->
    io:format("Miauuuuuuu!~n");

sonido(_Otro) ->
    io:format("Grrrrrrrrrr!~n").

