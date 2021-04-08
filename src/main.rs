#![cfg_attr(not(test), no_std)]
#![cfg_attr(not(test), no_main)]

use cosmian_std::prelude::*;
use cosmian_std::{scale, scale::println, InputRow, OutputRow};

// Players list
{{#forRange players_nb}}
const PLAYER_{{@index}}: Player<{{@index}}> = Player::<{{@index}}>;{{/forRange}}

// Example program
#[cosmian_std::main(KAPPA = 40)]
#[inline(never)]
fn main() {

    // Read first row of each players
    {{#forRange players_nb}}
    println!("##### Reading input row from player {{@index}}");
    let mut first_row_player_{{@index}} = InputRow::read(PLAYER_{{@index}});{{/forRange}}

    // Send data to output of each player
    {{#forRange players_nb}}
    println!("##### Writing output row for player {{@index}}");
    let mut first_output_row_player_{{@index}} = OutputRow::new(PLAYER_{{@index}});
    first_output_row_player_{{@index}}.append(
        first_row_player_{{@index}}
            .next_col() // Fetch the next column
            .unwrap()
            .into_secret_modp() // Convert the column of the row into SecretModP
            .expect("value should be i64"),
    );{{/forRange}}

    // All rows are automatically flushed thanks to the drop implementation
    println!("If you're running in emulation mode, please check into data/outputs directory the output of each players");
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_example() {
        // An example of test which can be run with `bash test.sh`
        cosmian_std::test!("example");
    }
}
