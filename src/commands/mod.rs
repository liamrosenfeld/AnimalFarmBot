pub mod handle;
mod make;

use serenity::{
    builder::CreateApplicationCommands, client::Context,
    model::application::interaction::application_command::CommandData,
};

mod names {
    pub const GENERATE: &'static str = "generate";
    pub const PING: &'static str = "ping";
    pub const ANIMALS: &'static str = "animals";
    pub const ADD: &'static str = "add";
    pub const FEEDBACK: &'static str = "feedback";
    pub const INFO: &'static str = "info";
    pub const SEND: &'static str = "send";
    pub const STATUS: &'static str = "status";
}

pub fn make_public_commands(
    commands: &mut CreateApplicationCommands,
) -> &mut CreateApplicationCommands {
    commands
        .create_application_command(make::generate)
        .create_application_command(make::ping)
        .create_application_command(make::animals)
        .create_application_command(make::add)
        .create_application_command(make::feedback)
        .create_application_command(make::info)
}

pub fn make_private_commands(
    commands: &mut CreateApplicationCommands,
) -> &mut CreateApplicationCommands {
    commands
        .create_application_command(make::send)
        .create_application_command(make::status)
}

pub async fn handle_command(ctx: &Context, command: &CommandData) -> String {
    use names::*;
    
    match command.name.as_str() {
        GENERATE => handle::generate(command).await,
        PING => handle::ping(),
        ANIMALS => handle::animals(),
        ADD => handle::add(),
        FEEDBACK => handle::feedback(),
        INFO => handle::info(),
        SEND => handle::send(ctx, command).await,
        STATUS => handle::status(ctx, command),
        _ => "not implemented :(".to_string(),
    }
}
