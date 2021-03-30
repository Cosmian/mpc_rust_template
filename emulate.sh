#!/bin/bash

# Only for the example
if [ -f data/inputs/player_x.json ]; then
    mv data/inputs/player_x.json data/inputs/player_0.json
    for i in {1..{{players_nb}}}
    do
        cp data/inputs/player_0.json "data/inputs/player_$i.json"
    done
fi

env RUST_BACKTRACE=1 RUSTC_BOOTSTRAP=1 SHARING_DATA=$(pwd)/SharingData.txt cargo run --features emulate -- --no-capture