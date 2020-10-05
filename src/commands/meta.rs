use crate::converter::build;
use serenity::client::Context;
use serenity::framework::standard::macros::command;
use serenity::framework::standard::CommandResult;
use serenity::model::channel::Message;

#[command]
async fn ping(ctx: &Context, msg: &Message) -> CommandResult {
    msg.channel_id
        .send_message(ctx, |m| {
            m.content(format!(
                "```\n{}\n```",
                build(vec!["Pong!"], rand::random())
            ))
        })
        .await?;
    Ok(())
}

#[command]
async fn vote(ctx: &Context, msg: &Message) -> CommandResult {
    bot_msg(
        ctx,
        msg,
        "If You're Enjoying Me, Please Upvote Here:",
        "<https://top.gg/bot/511688790994059267/vote>",
    )
    .await
}

#[command]
async fn add(ctx: &Context, msg: &Message) -> CommandResult {
    bot_msg(
        ctx,
        msg,
        "Add Me To Your Own Server Here:",
        "<https://discordapp.com/api/oauth2/authorize?scope=bot&client_id=511688790994059267>",
    )
    .await
}

#[command]
async fn feedback(ctx: &Context, msg: &Message) -> CommandResult {
    bot_msg(
        ctx,
        msg,
        "Please Report Bugs or Give Suggestions Here:",
        "<https://github.com/liamrosenfeld/AnimalFarmBot/issues/new>",
    )
    .await
}

#[command]
async fn info(ctx: &Context, msg: &Message) -> CommandResult {
    bot_msg(
        ctx,
        msg,
        "<> with <3 By Liam Rosenfeld",
        "Here's my Website: <https://www.liamrosenfeld.com>\nAnd Check Out The Source Code Here: <https://github.com/liamrosenfeld/AnimalFarmBot>",
    )
    .await
}

async fn bot_msg(ctx: &Context, msg: &Message, bot_text: &str, below_text: &str) -> CommandResult {
    msg.channel_id
        .send_message(ctx, |m| {
            m.content(format!(
                "```\n{}\n```\n{}",
                build(bot_text.split_whitespace().collect(), rand::random()),
                below_text
            ))
        })
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

`!vote`
shows how to vote for this bot

`!feedback`
link for bug report or suggestions

`!add`
link to add to your own server

`!ping`
ping the bot

`!stats`
shows stats for bot
"#;
