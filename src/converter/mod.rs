pub mod animals;
mod bubble;

pub fn build(message: Vec<&str>, animal: animals::Animal) -> String {
    return format!("{}{}", bubble::build(message), animal.art());
}
