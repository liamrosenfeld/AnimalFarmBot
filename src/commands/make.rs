use serenity::{
    builder::CreateApplicationCommand,
    model::interactions::application_command::ApplicationCommandOptionType,
};

use crate::generator::animals::Animal;

pub fn generate(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command
        .name("generate")
        .description("Generate ASCII Art for an animal")
        .create_option(|option| {
            option
                .name("animal")
                .description("The animal to use")
                .kind(ApplicationCommandOptionType::String)
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
                .kind(ApplicationCommandOptionType::String)
        })
}

pub fn ping(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command.name("ping").description("A ping command")
}

pub fn animals(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command
        .name("animals")
        .description("List available animals")
}

pub fn add(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command
        .name("add")
        .description("Link to add to your own server")
}

pub fn feedback(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command
        .name("feedback")
        .description("Send feedback to the developer")
}

pub fn info(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command.name("info").description("Credits and source code")
}

pub fn send(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command
        .name("send")
        .description("Send a custom message")
        .create_option(|option| {
            option
                .name("channel")
                .description("The ID of the channel to send it to")
                .kind(ApplicationCommandOptionType::String)
                .required(true)
        })
        .create_option(|option| {
            option
                .name("message")
                .description("Message to say")
                .kind(ApplicationCommandOptionType::String)
                .required(true)
        })
        .default_permission(false)
}

pub fn status(command: &mut CreateApplicationCommand) -> &mut CreateApplicationCommand {
    command
        .name("status")
        .description("Set status")
        .create_option(|option| {
            option
                .name("status")
                .description("Message to set as status")
                .kind(ApplicationCommandOptionType::String)
                .required(true)
        })
        .default_permission(false)
}
