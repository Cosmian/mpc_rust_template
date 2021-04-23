#!/usr/bin/env bash

# Init fake examples for emulation
if [ -f data/inputs/player_x.json ]; then
    mv data/inputs/player_x.json data/inputs/player_0.json
    for ((i=1 ; i < {{players_nb}} ; i++))
    do
        cp data/inputs/player_0.json "data/inputs/player_$i.json"
    done
fi

# Init fake examples for tests
if [ -f fixtures/example/inputs/player_x.json ]; then
    mv fixtures/example/inputs/player_x.json fixtures/example/inputs/player_0.json
    for ((i=1 ; i < {{players_nb}} ; i++))
    do
        cp fixtures/example/inputs/player_0.json "fixtures/example/inputs/player_$i.json"
        cp fixtures/example/outputs/player_0.json "fixtures/example/outputs/player_$i.json"
    done
fi
