use serenity::client::Context;
use serenity::framework::standard::macros::command;
use serenity::framework::standard::CommandResult;
use serenity::model::channel::Message;
use serenity::model::gateway::Activity;
use serenity::model::id::ChannelId;

#[command]
#[owners_only]
async fn send(ctx: &Context, msg: &Message) -> CommandResult {
    // Get channel to send the message to
    let mut content = msg.content.split_whitespace();
    content.next();
    let id = match content.next().and_then(|m: &str| m.parse::<u64>().ok()) {
        Some(num) => num,
        None => {
            msg.reply(ctx, "That is not a valid channel").await?;
            return Ok(());
        }
    };
    let channel = ChannelId(id);

    // Send the message to the channel
    let message = content.collect::<Vec<&str>>().join(" ");
    match channel.send_message(&ctx, |m| m.content(message)).await {
        Ok(_) => msg.reply(ctx, "Message sent!").await?,
        Err(_) => msg.reply(ctx, "Message could not send").await?,
    };
    Ok(())
}

#[command]
#[owners_only]
async fn status(ctx: &Context, msg: &Message) -> CommandResult {
    // Get status from message
    let status = match msg.content.find(" ") {
        Some(first_space) => Some(Activity::playing(&msg.content[first_space..])),
        None => None,
    };

    // Set status
    ctx.shard.set_activity(status); // hopefully they eventually allow fully custom status
    Ok(())
}
