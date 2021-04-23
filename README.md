# Rust MPC template

This templates helps you generate your own Rust MPC program using [cargo scaffold](https://github.com/iomentum/cargo-scaffold).

## Installation

If you don't have already cargo scaffold installed on your machine, please run:

```
cargo install cargo-scaffold
```

## Usage

To scaffold your Rust MPC program:

```
cargo scaffold https://github.com/Cosmian/mpc_rust_template.git
```

Follow the instructions displayed in your terminal to launch, emulate and test your first Rust MPC program.

## Editing and testing

To edit the gererated code, we recommend that you use the free VSCode and rust-analyzer extension.

To check the validity of your code, simply run  `cargo build`.
 
The build process outputs [WASM](https://fr.wikipedia.org/wiki/WebAssembly) which
is what is actually fed as an intermediate representation to the CipherCompute engine.

To facilitate testing without having to run [CipherCompute EAP](https://github.com/Cosmian/CipherCompute),  2 facilities are provided via 2 scripts:

 - `emulate.sh` will pick up the input data in the `data/inputs` directory 
  and output its results in the `data/outputs` directory. These directories contain one 
  file per player. This scripts perform the same emulation as that provided on the CipherCompute UI. 

 - `test.sh` will run the unit tests of the `main.rs` file. For a test written 
   ```rust
   #[test]
    fn test_example() {
        // An example of a successful test
        // which input and expected output data are located
        // in the `fixtures/first_test` folder
        cosmian_std::test!("first_test");
        // If you change any data in the input or output files,
        // the test will fail
    }
    ```
    The input data will be picked up from the `fixtures/first_test/inputs` directory and
    the outputs will be **compared** to those of the `fixtures/first_test/outputs` directory.

## Testing inside the CipherCompute MPC engine

1. Make a change and test it using `./simulate.sh`
2. commit the change to the local git and note the git commit

3. Then use the `git-daemon.sh` script to launch a git daemon which exposes this project at
at a git URL displayed by the script

From the UI on the CipherCompute EAP version

4. Create/update a computation using the git URL above and the git commit you want to test
5. Run the computation from the UI

See the [CipherCompute EAP](https://github.com/Cosmian/CipherCompute) Quick Start Guide
on how to use its UI to configure a computation.


Have fun and feel free to make pull-requests to add features to this template and also report issues.

<!--
## Demo
[![asciicast](https://asciinema.org/a/Fmj2hhuzkoazAaSavasJPjfjL.svg)](https://asciinema.org/a/Fmj2hhuzkoazAaSavasJPjfjL)
--!>
