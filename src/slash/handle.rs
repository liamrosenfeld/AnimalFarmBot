use serenity::{
    client::Context,
    model::{
        gateway::Activity,
        id::ChannelId,
        interactions::{
            ApplicationCommandInteractionData, ApplicationCommandInteractionDataOptionValue,
        },
    },
};
use std::env;

use crate::generator::animals::Animal;
use crate::generator::build;
use crate::generator::pun::get_pun;

pub async fn generate(command: &ApplicationCommandInteractionData) -> String {
    // get animal
    let animal_option = command
        .options
        .get(0)
        .expect("Expected animal option")
        .resolved
        .as_ref();
    let animal = match animal_option {
        Some(ApplicationCommandInteractionDataOptionValue::String(animal_name)) => {
            Animal::from_name(&animal_name)
        }
        _ => rand::random(),
    };

    // get message
    let msg_option = command
        .options
        .get(1)
        .and_then(|option| option.resolved.as_ref());
    let pun;
    let split_msg = match msg_option {
        Some(ApplicationCommandInteractionDataOptionValue::String(message)) => {
            message.split_whitespace().collect()
        }
        _ => {
            pun = get_pun().await;
            pun.split_whitespace().collect()
        }
    };

    // assemble animal
    format!("```\n{}\n```", build(split_msg, animal))
}

pub fn ping() -> String {
    format!("```\n{}\n```", build(vec!["Pong!"], rand::random()))
}

pub fn animals() -> String {
    let list = Animal::ANIMALS.join("\n - ");
    format!("Supported Animals: \n - {}", list)
}

pub fn add() -> String {
    let app_id = env::var("APPLICATION_ID").expect("Expected an application id in the environment");
    let link = format!("https://discord.com/api/oauth2/authorize?client_id={}&permissions=2048&scope=bot%20applications.commands", app_id);
    let art = build(
        "Add Me To Your Own Server Here:"
            .split_whitespace()
            .collect(),
        rand::random(),
    );
    format!("```\n{}```\n<{}>", art, link)
}

pub fn feedback() -> String {
    let link = "https://github.com/liamrosenfeld/AnimalFarmBot/issues/new";
    let art = build(
        "Please Report Bugs or Give Suggestions Here:"
            .split_whitespace()
            .collect(),
        rand::random(),
    );
    format!("```\n{}```\n<{}>", art, link)
}

pub fn info() -> String {
    let link = "My Website: <https://www.liamrosenfeld.com>\nThe Source Code: <https://github.com/liamrosenfeld/AnimalFarmBot>";
    let art = build(
        "<> with <3 By Liam Rosenfeld:".split_whitespace().collect(),
        rand::random(),
    );
    format!("```\n{}```\n{}", art, link)
}

pub async fn send(ctx: &Context, command: &ApplicationCommandInteractionData) -> String {
    // get channel
    let channel_option = command
        .options
        .get(0)
        .expect("Expected channel option")
        .resolved
        .as_ref();
    let channel_id: u64 = match channel_option {
        Some(ApplicationCommandInteractionDataOptionValue::String(id)) => match id.parse() {
            Ok(id) => id,
            Err(_) => return "Not valid channel id".to_string(),
        },
        _ => return "Channel not provided".to_string(),
    };

    // get message
    let msg_option = command
        .options
        .get(1)
        .expect("Expected message option")
        .resolved
        .as_ref();
    let msg = match msg_option {
        Some(ApplicationCommandInteractionDataOptionValue::String(msg)) => msg,
        _ => return "Message not provided".to_string(),
    };

    // Send the message to the channel
    let channel = ChannelId(channel_id);
    match channel.send_message(&ctx, |m| m.content(msg)).await {
        Ok(_) => "Message sent!".to_string(),
        Err(_) => "Message could not send".to_string(),
    }
}

pub fn status(ctx: &Context, command: &ApplicationCommandInteractionData) -> String {
    // get message
    let msg_option = command
        .options
        .get(0)
        .expect("Expected message option")
        .resolved
        .as_ref();
    let msg = match msg_option {
        Some(ApplicationCommandInteractionDataOptionValue::String(msg)) => msg,
        _ => return "Message not provided".to_string(),
    };

    // Set status
    ctx.shard.set_activity(Some(Activity::playing(msg)));
    "Status sent!".to_string()
}

pub fn welcome() -> String {
    format!(
        "```\n{}\n{}\n{}\n{}```",
        build(
            "Hello! I'm Animal Farm!".split_whitespace().collect(),
            rand::random()
        ),
        build(
            "I Support Both Slash Commands and Messages"
                .split_whitespace()
                .collect(),
            rand::random()
        ),
        build(
            "Type / to see available slash commands"
                .split_whitespace()
                .collect(),
            rand::random()
        ),
        build(
            "Send !help to see all message commands"
                .split_whitespace()
                .collect(),
            rand::random()
        ),
    )
}
