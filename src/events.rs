use log::info;
use serenity::{
    async_trait,
    model::{event::ResumedEvent, gateway::Ready, guild::Guild},
    prelude::*,
};

use crate::converter::build;

pub struct Handler;

#[async_trait]
impl EventHandler for Handler {
    async fn guild_create(&self, ctx: Context, guild: Guild, is_new: bool) {
        if is_new {
            match guild.system_channel_id {
                Some(channel) => {
                    let _ = channel
                        .send_message(ctx, |m| {
                            m.content(format!(
                                "```\n{}\n{}\n{}\n{}```",
                                build(
                                    "Hello! I'm Animal Farm!".split_whitespace().collect(),
                                    rand::random()
                                ),
                                build(
                                    "Use Me By Typing !<animal> <message>"
                                        .split_whitespace()
                                        .collect(),
                                    rand::random()
                                ),
                                build(
                                    "Just Type !animals for a list of all available animals"
                                        .split_whitespace()
                                        .collect(),
                                    rand::random()
                                ),
                                build(
                                    "And !help for all command available"
                                        .split_whitespace()
                                        .collect(),
                                    rand::random()
                                ),
                            ))
                        })
                        .await;
                }
                None => {}
            };
        }
    }

    async fn ready(&self, _: Context, ready: Ready) {
        info!("Connected as {}", ready.user.name);
    }

    async fn resume(&self, _: Context, _: ResumedEvent) {
        info!("Resumed");
    }
}
