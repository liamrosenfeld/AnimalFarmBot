use reqwest::header::{ACCEPT, USER_AGENT};

pub async fn get_pun() -> String {
    // Create Header
    let mut header = reqwest::header::HeaderMap::new();
    header.insert(ACCEPT, "text/plain".parse().unwrap());
    header.insert(
        USER_AGENT,
        "Animal Farm Discord Bot (https://github.com/liamrosenfeld/AnimalFarmBot)"
            .parse()
            .unwrap(),
    );

    // Send Request
    let client = reqwest::Client::new();
    let response = client
        .get("https://icanhasdadjoke.com")
        .headers(header)
        .send()
        .await;

    // Decode response
    let pun = match response {
        Ok(resp) => resp.text().await,
        Err(err) => Err(err),
    };
    match pun {
        Ok(pun) => pun,
        Err(_) => "...".to_string(),
    }
}
