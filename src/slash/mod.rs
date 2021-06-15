pub mod handle;
mod make;

use serenity::{
    builder::CreateApplicationCommands, client::Context,
    model::interactions::ApplicationCommandInteractionData,
};

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

pub async fn handle_command(ctx: &Context, command: &ApplicationCommandInteractionData) -> String {
    match command.name.as_str() {
        "generate" => handle::generate(command).await,
        "ping" => handle::ping(),
        "animals" => handle::animals(),
        "add" => handle::add(),
        "feedback" => handle::feedback(),
        "info" => handle::info(),
        "send" => handle::send(ctx, command).await,
        "status" => handle::status(ctx, command),
        _ => "not implemented :(".to_string(),
    }
}
