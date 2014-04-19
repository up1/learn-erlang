-module(learn014).

-export([server/1, client/1]).

server(Clients) ->
	receive
		{connect, Client} ->
			NewClients = [Client | Clients],
			Client ! {connected, self()},
			server(NewClients);
		{message, Message} ->
			io:format("Server receive : ~s~n", [Message]),
			lists:foreach(
				fun(Client) ->
					Client ! {notify,Message}
				end,
				Clients
				),
			server(Clients)
	end.


client(Server) ->
	receive
		{notify, Messsage} ->
			io:format("Receive : ~s~n", [Messsage]),
			client(Server);
		{connected, ServerPID} ->
			io:format("connected to server : ~p~n", [ServerPID]),
			client(ServerPID);
		{broadcast, Messsage} ->
			Server ! {message, Messsage},
			client(Server)
	end.

%Server = spawn(learn014, server, [[]]).  
%Client1 = spawn(learn014, client, [Server]).
%Server ! {connect, Client1}.
%Server ! {message, hello}.

%Client2 = spawn(learn014, client, [Server]).
%Server ! {connect, Client2}. 

%Client1 ! {broadcast, hello}.

