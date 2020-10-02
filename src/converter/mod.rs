mod animals;
mod bubble;

pub fn build(message: Vec<&str>) -> String {
    return format!("{}{}", bubble::build(message), animals::BUNNY);
}
