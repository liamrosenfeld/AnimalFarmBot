use serenity::client::Context;
use serenity::framework::standard::macros::command;
use serenity::framework::standard::CommandResult;
use serenity::model::channel::Message;

use crate::converter::build;

#[command]
async fn bunny(ctx: &Context, msg: &Message) -> CommandResult {
    // get contents of message
    let full_message = msg.content_safe(ctx).await;
    let mut split_message = full_message.split_whitespace();
    split_message.next();
    let message = split_message.collect::<Vec<&str>>();

    let animal = format!("```\n{}\n```", build(message));
    msg.channel_id
        .send_message(ctx, |m| m.content(animal))
        .await?;
    Ok(())
}
