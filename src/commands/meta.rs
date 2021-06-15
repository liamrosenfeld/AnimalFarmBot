use serenity::client::Context;
use serenity::framework::standard::macros::command;
use serenity::framework::standard::CommandResult;
use serenity::model::channel::Message;

use crate::slash::handle;

#[command]
async fn ping(ctx: &Context, msg: &Message) -> CommandResult {
    msg.channel_id
        .send_message(ctx, |m| m.content(handle::ping()))
        .await?;
    Ok(())
}

#[command]
async fn add(ctx: &Context, msg: &Message) -> CommandResult {
    msg.channel_id
        .send_message(ctx, |m| m.content(handle::add()))
        .await?;
    Ok(())
}

#[command]
async fn feedback(ctx: &Context, msg: &Message) -> CommandResult {
    msg.channel_id
        .send_message(ctx, |m| m.content(handle::feedback()))
        .await?;
    Ok(())
}

#[command]
async fn info(ctx: &Context, msg: &Message) -> CommandResult {
    msg.channel_id
        .send_message(ctx, |m| m.content(handle::info()))
        .await?;
    Ok(())
}

#[command]
async fn help(ctx: &Context, msg: &Message) -> CommandResult {
    msg.channel_id
        .send_message(ctx, |m| m.content(HELP_TEXT))
        .await?;
    Ok(())
}

const HELP_TEXT: &str = r#"
**Sending**
`!<animal> <message>`
send an animal saying the message

`!<animal>`
sends an animal saying a random message

**Utilities**
`!animals`
Lists supported animals

`!help`
bring up this help menu

`!info`
show credits and link to source code

`!feedback`
link for bug report or suggestions

`!add`
link to add to your own server

`!ping`
ping the bot

**Slash Commands**
Just type `/` for an easier way to send commands
"#;
