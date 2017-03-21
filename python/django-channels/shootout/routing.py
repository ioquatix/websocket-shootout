from channels.routing import route
from shootout.consumers import ws_connect, ws_disconnect, ws_receive


channel_routing = {
    'websocket.connect': ws_connect,
    'websocket.disconnect': ws_disconnect,
    'websocket.receive': ws_receive
}
