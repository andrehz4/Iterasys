from pymongo import MongoClient

# Host: -
# Port: --
# User: -
# Pwd: -
# Database: -

# "mongodb://usuario:senha@servidor:porta/bancodedados"

client = MongoClient("mongodb://usuario:senha@server.mlab.com:00000/banco")
db = client['bancodedados']

def remove_celula(name):
    teste = db['teste']
    teste.delete_many({'name': name})
