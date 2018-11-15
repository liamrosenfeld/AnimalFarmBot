import sys
import os
import discord
import BunnyBuilder

client = discord.Client()

@client.event
async def on_ready():
    print("I'm in")
    print(client.user)

@client.event
async def on_message(message):
    if message.author != client.user:
        if message.content.startswith("!bunnyhelp"):
            await message.channel.send(sendHelp())
        elif message.content.startswith("!bunny"):
            await message.channel.send(generateBunny(message = message.content[6::]))   

def generateBunny(message: str):
    bunny = f"```{BunnyBuilder.buildSign(message)}```"
    return bunny

def sendHelp():
    message = "Write a message after `!bunny` to put it in a sign "
    return message

token = os.environ.get("DISCORD_BOT_SECRET")
client.run(token)