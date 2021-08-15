use rand::distributions::{Distribution, Standard};
use rand::{Rng, random};

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
    Owl,
    Squirrel,
    Duck,
    Ducks,
    Raccoon,
}

impl Animal {
    pub fn from_name(str: &str) -> Self {
        match str {
            "bunny" => Animal::Bunny,
            "cow" => Animal::Cow,
            "tux" => Animal::Tux,
            "cat" => Animal::Cat,
            "dog" => Animal::Dog,
            "pig" => Animal::Pig,
            "hedgehog" => Animal::Hedgehog,
            "dino" => Animal::Dino,
            "frog" => Animal::Frog,
            "owl" => Animal::Owl,
            "squirrel" => Animal::Squirrel,
            "duck" => Animal::Duck,
            "ducks" => Animal::Ducks,
            "raccoon" => Animal::Raccoon,
            "random" => random(),
            _ => Animal::Bunny,
        }
    }

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
            Animal::Owl => OWL,
            Animal::Squirrel => SQUIRREL,
            Animal::Duck => DUCK,
            Animal::Ducks => DUCKS,
            Animal::Raccoon => RACCOON,
        }
    }

    pub const ANIMALS: [&'static str; 15] = [
        "random", "bunny", "cow", "tux", "cat", "dog", "pig", "hedgehog", "dino", "frog", "owl",
        "squirrel", "duck", "ducks", "raccoon",
    ];
}

impl Distribution<Animal> for Standard {
    fn sample<R: Rng + ?Sized>(&self, rng: &mut R) -> Animal {
        match rng.gen_range(0, 13) {
            0 => Animal::Bunny,
            1 => Animal::Cow,
            2 => Animal::Tux,
            3 => Animal::Cat,
            4 => Animal::Dog,
            5 => Animal::Pig,
            6 => Animal::Hedgehog,
            7 => Animal::Dino,
            8 => Animal::Frog,
            9 => Animal::Owl,
            10 => Animal::Squirrel,
            11 => Animal::Duck,
            12 => Animal::Raccoon,
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

const OWL: &str = r#"
   \ ,_,
    (o,o)
    (   )
    -"-"---dwb-
"#;

const SQUIRREL: &str = r#"
 __  (\_ /
(_ \ ( '>
  ) \/_)=
  (_(_ )_
"#;

const DUCK: &str = r#"
    \  _
     >(')____,
      (` =~~/
    ^~^`---'~^~
"#;

const DUCKS: &str = r#"
 \  _       \  _          _
  >(')____,  >(')____,  =(')____,
   (` =~~/    (` =~~/    (` =~~/
 ^~^`---'~^~^~^`---'~^~^~^`---'~^~^
"#;

const RACCOON: &str = r#"
    \          ______    .-.
     \  /\_/\-/.  '  \  /\\|
      \ (O|O) ` ,`. . \/\\\/
         \./  )____(  )\.-`
          )/)/   )/ )/
          " "    "´"´
"#;