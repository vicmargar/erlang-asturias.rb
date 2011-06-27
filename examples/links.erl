-module(links).
-export([padre/0, hijo/0]).

padre() ->
    process_flag(trap_exit, true),
    PidHijo = spawn_link(links, hijo, []),
    io:format("Padre: ~p, Hijo: ~p~n", [self(), PidHijo]),
    recibir_mensajes().

recibir_mensajes() ->
    receive
        Msg ->
            io:format("Mensaje Padre: ~p~n", [Msg]),
            recibir_mensajes()
    end.

hijo() ->
    receive
        Msg ->
            io:format("Mensaje Hijo: ~p~n", [Msg]),
            hijo()
    end.
