use crate::converter::build;
use serenity::client::Context;
use serenity::framework::standard::macros::command;
use serenity::framework::standard::CommandResult;
use serenity::model::channel::Message;

#[command]
async fn ping(ctx: &Context, msg: &Message) -> CommandResult {
    msg.channel_id
        .send_message(ctx, |m| {
            m.content(format!("```\n{}\n```", build(vec!["Pong!"], rand::random())))
        })
        .await?;
    Ok(())
}
