const H_CHAR: char = '-';
const V_CHAR: char = '|';

const MIN_SIGN_WIDTH: usize = 9;

const MIN_CHAR_LIMIT: usize = 15;
const MAX_CHAR_LIMIT: usize = 32;

pub fn build(message: Vec<&str>) -> String {
    // Calculate char limit for line
    let char_limit = message.iter().fold(MIN_CHAR_LIMIT, |longest, &current| {
        if current.chars().count() > longest {
            current.chars().count()
        } else {
            longest
        }
    });

    // Check None Longer Than Max
    if char_limit > MAX_CHAR_LIMIT {
        return build(
            "One or more of your words are too long"
                .split_whitespace()
                .collect(),
        );
    }

    // Make lines
    let mut lines = Vec::<String>::new();
    let mut line = "".to_string();
    for word in &message {
        // skip if it will break the monospaced section
        if word.contains("```") {
            continue;
        }

        if line.chars().count() + word.chars().count() > char_limit {
            lines.push(line.to_string());
            line = word.to_uppercase()
        } else if line == "" {
            line = word.to_uppercase()
        } else {
            line = format!("{} {}", line, word.to_uppercase())
        }
    }
    if line != "" {
        lines.push(line)
    }

    // Find final sign width
    let longest_line = lines.iter().fold(MIN_SIGN_WIDTH, |longest, current| {
        if current.chars().count() > longest {
            current.chars().count()
        } else {
            longest
        }
    });

    // Add space padding and end characters
    let mut padded_lines: Vec<String> = lines
        .iter()
        .map(|line| {
            let pad_length = longest_line - line.chars().count();
            let padding = std::iter::repeat(" ").take(pad_length).collect::<String>();
            format!("{} {}{} {}", V_CHAR, line, padding, V_CHAR)
        })
        .collect();

    // Make top and bottom then put them together
    let sign_width = longest_line + 4; // because of the side characters and the spaces
    let cap = std::iter::repeat(H_CHAR)
        .take(sign_width)
        .collect::<String>();
    padded_lines.insert(0, cap.clone());
    padded_lines.push(cap);
    return padded_lines.join("\n");
}
