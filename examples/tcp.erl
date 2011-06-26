-module(tcp).

-export([unpack/1]).

unpack(SomeBinary) ->
    <<SourcePort:16, DestinationPort:16,
      SequenceNumber:32,
      AckNumber:32,
      DataOffset:4, _Reserved:4, Flags:8, WindowSize:16,
      CheckSum: 16, UrgentPointer:16,
      Payload/binary>> = SomeBinary.
