use rand::distributions::{Distribution, Standard};
use rand::Rng;

pub enum Animal {
    Bunny,
    Cow,
    Tux,
    Cat,
    Dog,
    Pig,
    Hedgehog,
    Dino,
    Frog,
}

impl Animal {
    pub fn art(&self) -> &str {
        match *self {
            Animal::Bunny => BUNNY,
            Animal::Cow => COW,
            Animal::Tux => TUX,
            Animal::Cat => CAT,
            Animal::Dog => DOG,
            Animal::Pig => PIG,
            Animal::Hedgehog => HEDGEHOG,
            Animal::Dino => DINO,
            Animal::Frog => FROG,
        }
    }
}

impl Distribution<Animal> for Standard {
    fn sample<R: Rng + ?Sized>(&self, rng: &mut R) -> Animal {
        match rng.gen_range(0, 9) {
            0 => Animal::Bunny,
            1 => Animal::Cow,
            2 => Animal::Tux,
            3 => Animal::Cat,
            4 => Animal::Dog,
            5 => Animal::Pig,
            6 => Animal::Hedgehog,
            7 => Animal::Dino,
            8 => Animal::Frog,
            _ => Animal::Bunny,
        }
    }
}

const BUNNY: &str = r#"
(\__/) ||
(•ㅅ•) ||
/ 　 づ
"#;

const COW: &str = r#"
    \  ^__^
     \ (oo)\_______
       (__)\ o O o )\/\
           ||----w |
           ||     ||
"#;

const TUX: &str = r#"
    \   .--.
     \ |o_o |
       |:_/ |
      //   \ \
     (|     | )
    /'\_   _/`\
    \___):(___/
"#;

const CAT: &str = r#"
    \   /\_/\           ___
     \ : o_o :_______    \ \
          ^      __(  \.__) )
    (@)<_____>__(_____)____/
"#;

const DOG: &str = r#"
    \     __
     \ o-''|\_____/)
        \_/|_)     )
           \  __  /
           (_/ (_/
"#;

const PIG: &str = r#"
    \     _____
     \ ^..^     \9
       (oo)_____/
          WW  WW
"#;

const HEDGEHOG: &str = r#"
    \      ..::::::::.
     \    :::::::::::::
      \  /. `:::::::::::
        o__,_::::::::::'
"#;

const DINO: &str = r#"
    \   __
     \ (_ \
         \ \_.----._
          \         \
           |  ) |  )  \__
           |_|--|_|'-.__/
"#;

const FROG: &str = r#"
     \    _  _
      \  (.)(.)
     ,-.(.____.),-.
    ( \ \ '--' / / )
     \ \ / ,. \ / /
      ) '| || |' (
"#;
