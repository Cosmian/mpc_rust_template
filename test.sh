#!/bin/bash

# Only for the example
if [ -f fixtures/example/inputs/player_x.json ]; then
    mv fixtures/example/inputs/player_x.json fixtures/example/inputs/player_0.json
    for i in {1..{{players_nb}}}
    do
        cp fixtures/example/inputs/player_0.json "fixtures/example/inputs/player_$i.json"
        cp fixtures/example/outputs/player_0.json "fixtures/example/outputs/player_$i.json"
    done
fi

env RUST_BACKTRACE=1 RUSTC_BOOTSTRAP=1 SHARING_DATA=$(pwd)/SharingData.txt RUST_TEST_THREADS=1 cargo test --features emulate -- --nocapture