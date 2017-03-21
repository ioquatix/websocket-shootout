from channels import Group

import json

def ws_connect(message):
  message.reply_channel.send({"accept": True})
  Group('all').add(message.reply_channel)


def ws_disconnect(message):
  Group('all').discard(message.reply_channel)

def ws_receive(message):
  Group('all').send({'text': message.content['text']})
  decoded = json.loads(message.content['text'])
  decoded['type'] = 'broadcastResult'
  message.reply_channel.send({'text': json.dumps(decoded)})
