use serenity::client::Context;
use serenity::framework::standard::macros::command;
use serenity::framework::standard::CommandResult;
use serenity::model::channel::Message;

use crate::converter::animals::Animal;
use crate::converter::build;

const ANIMAL_LIST: &str = r#"
Supported Animals:
- `bunny`
- `cow`
- `tux`
- `cat`
- `dog`
- `pig`
- `hedgehog`
- `dino`
- `frog`
- `owl`
- `squirrel`
- `duck`/`ducks`
"#;

#[command]
async fn animals(ctx: &Context, msg: &Message) -> CommandResult {
    msg.channel_id
        .send_message(ctx, |m| m.content(ANIMAL_LIST))
        .await?;
    Ok(())
}

#[command]
async fn bunny(ctx: &Context, msg: &Message) -> CommandResult {
    send_animal_msg(ctx, msg, Animal::Bunny).await
}

#[command]
async fn cow(ctx: &Context, msg: &Message) -> CommandResult {
    send_animal_msg(ctx, msg, Animal::Cow).await
}

#[command]
async fn tux(ctx: &Context, msg: &Message) -> CommandResult {
    send_animal_msg(ctx, msg, Animal::Tux).await
}

#[command]
async fn cat(ctx: &Context, msg: &Message) -> CommandResult {
    send_animal_msg(ctx, msg, Animal::Cat).await
}

#[command]
async fn dog(ctx: &Context, msg: &Message) -> CommandResult {
    send_animal_msg(ctx, msg, Animal::Dog).await
}

#[command]
async fn pig(ctx: &Context, msg: &Message) -> CommandResult {
    send_animal_msg(ctx, msg, Animal::Pig).await
}

#[command]
async fn hedgehog(ctx: &Context, msg: &Message) -> CommandResult {
    send_animal_msg(ctx, msg, Animal::Hedgehog).await
}

#[command]
async fn dino(ctx: &Context, msg: &Message) -> CommandResult {
    send_animal_msg(ctx, msg, Animal::Dino).await
}

#[command]
async fn frog(ctx: &Context, msg: &Message) -> CommandResult {
    send_animal_msg(ctx, msg, Animal::Frog).await
}

#[command]
async fn owl(ctx: &Context, msg: &Message) -> CommandResult {
    send_animal_msg(ctx, msg, Animal::Owl).await
}

#[command]
async fn squirrel(ctx: &Context, msg: &Message) -> CommandResult {
    send_animal_msg(ctx, msg, Animal::Squirrel).await
}

#[command]
async fn duck(ctx: &Context, msg: &Message) -> CommandResult {
    send_animal_msg(ctx, msg, Animal::Duck).await
}

#[command]
async fn ducks(ctx: &Context, msg: &Message) -> CommandResult {
    send_animal_msg(ctx, msg, Animal::Ducks).await
}

#[command]
async fn random(ctx: &Context, msg: &Message) -> CommandResult {
    send_animal_msg(ctx, msg, rand::random()).await
}

async fn send_animal_msg(ctx: &Context, msg: &Message, animal: Animal) -> CommandResult {
    // get contents of message
    let full_message = msg.content_safe(ctx).await;
    let mut split_message = full_message.split_whitespace();
    split_message.next();
    let message = split_message.collect::<Vec<&str>>();

    let animal = format!("```\n{}\n```", build(message, animal));
    msg.channel_id
        .send_message(ctx, |m| m.content(animal))
        .await?;
    Ok(())
}
