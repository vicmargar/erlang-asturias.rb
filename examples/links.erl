-module(links).
-export([padre/0, hijo/0]).

padre() ->
    process_flag(trap_exit, true),
    PidHijo = spawn_link(links, hijo, []),
    io:format("Pid padre: ~p, Pid hijo: ~p~n", [self(), PidHijo]),
    recibir_mensajes().

recibir_mensajes() ->
    receive
        Msg ->
            io:format("Padre ha recibido un mensaje: ~p~n", [Msg]),
            recibir_mensajes()
    end.

hijo() ->
    receive
        Msg ->
            io:format("Hijo ha recibido un mensaje: ~p~n", [Msg]),
            hijo()
    end.
