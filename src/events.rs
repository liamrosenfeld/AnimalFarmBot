use log::info;
use serenity::http::Http;
use serenity::{
    async_trait,
    model::{
        event::ResumedEvent,
        gateway::Ready,
        guild::Guild,
        interactions::{
            application_command::{ApplicationCommand, ApplicationCommandPermissionType},
            Interaction, InteractionResponseType,
        },
    },
    prelude::*,
};
use std::env;

use crate::commands;
use crate::commands::handle::welcome;
use serenity::model::guild::PartialGuild;

pub struct Handler;

#[async_trait]
impl EventHandler for Handler {
    async fn guild_create(&self, ctx: Context, guild: Guild, is_new: bool) {
        if is_new {
            match guild.system_channel_id {
                Some(channel) => {
                    let _ = channel.send_message(ctx, |m| m.content(welcome())).await;
                }
                None => {}
            };
        }
    }

    async fn ready(&self, ctx: Context, ready: Ready) {
        // get admin guild
        let guild_id: u64 = env::var("ADMIN_GUILD")
            .expect("Expected ADMIN_GUILD in env")
            .parse()
            .expect("ADMIN_GUILD is not a valid id");
        let guild = Guild::get(&ctx.http, guild_id).await;

        // create private commands
        if let Ok(guild) = guild {
            // add private commands to admin guild
            let private_commands = guild
                .set_application_commands(&ctx.http, commands::make_private_commands)
                .await;

            // add owner permission to private commands
            match private_commands {
                Ok(commands) => limit_to_owner(commands, guild, &ctx.http).await,
                Err(err) => info!("Info creating commands {}", err),
            }
        }

        // add public commands to bot
        let public_commands = ApplicationCommand::set_global_application_commands(
            &ctx.http,
            commands::make_public_commands,
        )
        .await;
        if let Err(err) = public_commands {
            info!("Error creating commands {}", err);
        }

        // log startup
        info!("Connected as {}", ready.user.name);
    }

    async fn resume(&self, _: Context, _: ResumedEvent) {
        info!("Resumed");
    }

    async fn interaction_create(&self, ctx: Context, interaction: Interaction) {
        if let Interaction::ApplicationCommand(command) = interaction {
            let content = commands::handle_command(&ctx, &command.data).await;

            let response = command
                .create_interaction_response(&ctx.http, |response| {
                    response
                        .kind(InteractionResponseType::ChannelMessageWithSource)
                        .interaction_response_data(|message| message.content(content))
                })
                .await;

            if let Err(err) = response {
                println!("error in responding: {:#?}", err)
            }
        }
    }
}

async fn limit_to_owner(commands: Vec<ApplicationCommand>, guild: PartialGuild, http: &Http) {
    // get owner
    let owner_id = match http.get_current_application_info().await {
        Ok(info) => info.owner.id,
        Err(err) => panic!("Could not access application info: {:?}", err),
    };

    for command in commands {
        let permission_creation = guild
            .create_application_command_permission(http, command.id, |permissions| {
                permissions.create_permission(|permission| {
                    permission
                        .id(*owner_id.as_u64())
                        .kind(ApplicationCommandPermissionType::User)
                        .permission(true)
                })
            })
            .await;
        if let Err(err) = permission_creation {
            info!("Info creating permissions {}", err);
        }
    }
}
