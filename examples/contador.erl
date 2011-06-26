-module(contador).

-export([contar/0]).

contar() ->
    contar(0).

contar(Valor) ->
    receive
        cuenta ->
            contar(Valor + 1);
        valor ->
            io:format("El valor es: ~p~n", [Valor]),
            contar(Valor);
        Msg ->
            io:format("Mensaje desconocido: ~p~n", [Msg]),
            contar(Valor)
    end.
