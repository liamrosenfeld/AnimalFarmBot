use serenity::{
    builder::CreateApplicationCommand,
    model::{application::command::CommandOptionType, Permissions},
};

use crate::generator::animals::Animal;

use super::names;

pub fn generate(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command
        .name(names::GENERATE)
        .description("Generate ASCII Art for an animal")
        .create_option(|option| {
            option
                .name("animal")
                .description("The animal to use")
                .kind(CommandOptionType::String)
                .required(true);

            for animal in Animal::ANIMALS.iter() {
                option.add_string_choice(animal, animal);
            }

            option
        })
        .create_option(|option| {
            option
                .name("message")
                .description("Message for the animal to say")
                .kind(CommandOptionType::String)
        })
}

pub fn ping(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command.name(names::PING).description("A ping command")
}

pub fn animals(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command
        .name(names::ANIMALS)
        .description("List available animals")
}

pub fn add(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command
        .name(names::ADD)
        .description("Link to add to your own server")
}

pub fn feedback(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command
        .name(names::FEEDBACK)
        .description("Send feedback to the developer")
}

pub fn info(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command.name(names::INFO).description("Credits and source code")
}

pub fn send(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command
        .name(names::SEND)
        .description("Send a custom message")
        .create_option(|option| {
            option
                .name("channel")
                .description("The ID of the channel to send it to")
                .kind(CommandOptionType::String)
                .required(true)
        })
        .create_option(|option| {
            option
                .name("message")
                .description("Message to say")
                .kind(CommandOptionType::String)
                .required(true)
        })
        .default_member_permissions(Permissions::empty()) // disable for everyone
}

pub fn status(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command
        .name(names::STATUS)
        .description("Set status")
        .create_option(|option| {
            option
                .name("status")
                .description("Message to set as status")
                .kind(CommandOptionType::String)
                .required(true)
        })
        .default_member_permissions(Permissions::empty()) // disable for everyone
}
