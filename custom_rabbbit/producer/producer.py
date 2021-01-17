# This script will publish MQ message to my_exchange MQ exchange

import pika

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost', 5672, '/', pika.PlainCredentials('guest', 'guest')))
channel = connection.channel()

channel.basic_publish(exchange='my_exchange', routing_key='test', body='Shoshi_Sheli')

connection.close()