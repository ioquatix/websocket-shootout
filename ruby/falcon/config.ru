# Run with: bundle exec falcon serve -b http://0.0.0.0:3334

require 'async/websocket/adapters/rack'
require 'set'

$connections = Set.new

run lambda {|env|
	Async::WebSocket::Adapters::Rack.open(env, protocols: ['ws']) do |connection|
		$connections << connection
		
		while message = connection.read
			cmd, payload = message.values_at(:type, :payload)
			if cmd == 'echo'
				connection.write({type: 'echo', payload: payload})
			else
				message = {type: 'broadcast', payload: payload}
				
				$connections.each do |connection|
					connection.write(message)
				end
				
				connection.write({type: "broadcastResult", payload: payload})
			end
		end
	ensure
		$connections.delete(connection)
	end or [200, {}, ["Hello World"]]
}
