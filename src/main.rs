use dotenv::dotenv;
use log::error;
use serenity::{
    framework::standard::{macros::group, StandardFramework},
    http::Http,
    prelude::*,
};
use std::{collections::HashSet, env};

mod commands;
mod events;
mod generator;
mod slash;

use commands::{animals::*, meta::*, owner::*};
use events::Handler;

#[group]
#[commands(
    ping, add, feedback, info, help, send, status, animals, bunny, cow, tux, cat, dog, pig,
    hedgehog, dino, frog, owl, squirrel, duck, ducks, random
)]
struct General;

#[tokio::main]
async fn main() {
    // Get bot token from the environment
    dotenv().ok();
    let token = env::var("DISCORD_TOKEN").expect("Expected DISCORD_TOKEN in env");

    // Get owner
    let http = Http::new_with_token(&token);
    let (owners, _bot_id) = match http.get_current_application_info().await {
        Ok(info) => {
            let mut owners = HashSet::new();
            owners.insert(info.owner.id);

            (owners, info.id)
        }
        Err(why) => panic!("Could not access application info: {:?}", why),
    };

    // Get Application ID
    let application_id: u64 = env::var("APPLICATION_ID")
        .expect("Expected APPLICATION_ID in env")
        .parse()
        .expect("application id is not a valid id");

    // Create framework
    let framework = StandardFramework::new()
        .configure(|c| c.prefix("!").owners(owners))
        .group(&GENERAL_GROUP);

    // Create client
    let mut client = Client::builder(token)
        .event_handler(Handler)
        .application_id(application_id)
        .framework(framework)
        .await
        .expect("Error creating client");

    // start listening for events by starting a single shard
    if let Err(why) = client.start().await {
        error!("An error occurred while running the client: {:?}", why)
    }
}
