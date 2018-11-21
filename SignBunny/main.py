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
        if message.content.startswith("!help"):
            await message.channel.send(sendHelp())
        elif message.content.startswith("!bunny"):
            await message.channel.send(generateBunny(message.content[6::]))   
        elif message.content.startswith("!ping"):
            await message.channel.send(generateBunny("🏓 Pong!"));

def generateBunny(message: str):
    bunny = f"```{BunnyBuilder.buildSign(message)}```"
    return bunny

def sendHelp():
    message = """
                `!bunny <message>` -> Put that message in a sign
                `!ping`            -> Ping the bot
                `!help`            -> Bring up this help menu
            """
    return message

token = os.environ.get("DISCORD_BOT_SECRET")
client.run(token)