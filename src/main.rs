use dotenv::dotenv;
use log::error;
use serenity::prelude::*;
use std::env;

mod commands;
mod events;
mod generator;

use events::Handler;

#[tokio::main]
async fn main() {
    // Get bot token from the environment
    dotenv().ok();
    let token = env::var("DISCORD_TOKEN").expect("Expected DISCORD_TOKEN in env");

    // Get Application ID
    let application_id: u64 = env::var("APPLICATION_ID")
        .expect("Expected APPLICATION_ID in env")
        .parse()
        .expect("application id is not a valid id");

    // Create client
    let mut client = Client::builder(token)
        .event_handler(Handler)
        .application_id(application_id)
        .await
        .expect("Error creating client");

    // start listening for events by starting a single shard
    if let Err(why) = client.start().await {
        error!("An error occurred while running the client: {:?}", why)
    }
}
