# ApiExErcise

This repo is intended as a tool for helping to put together a basic webserver
using `Elixir`. The aim is to step through several iterations of building up a
webserver and introduce some basic `Elixir` principles.

The structure has been heavily influenced by https://github.com/Adzz/ex_ample

## Target audience

People who are familiar with elixir basics but have not used it before.

### Assumptions about what to know

Some knowledge of [HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol)
basics is assumed.

By the end we should have seen some of the following:

1. How to use [`Cowboy`](https://github.com/ninenines/cowboy) and
   [`Plug`](https://github.com/elixir-plug/plug) to implement `GET` requests
2. Example test implementation
3. Some `Elixir` features (pipes, pattern matching)

## What this is not

Complete, perfect or useful for anything other than a helper to get to grips
with elixir! We don't touch on a lot of things (such as `POST` requests) and
the examples are somewhat contrived.

## Structure

The `master` branch of this repo is just a blank
[umbrella application](https://elixir-lang.org/getting-started/mix-otp/dependencies-and-umbrella-projects.html#umbrella-projects).

There are several branches which can be walked through one at a time, in order:

    0_webserver
    1_basic_get
    2_basic_calculator
    3_refactoring
    4_example_refactor

Each branch builds on the previous one.

## Getting started

Clone the repo using:

    git@github.com:nested-tech/api_ex_ercise.git

Now switch to the first branch and generate some documentation:

    git checkout 1_basic_get # Switch our branch
    mix deps.get             # Fetch our dependencies
    mix docs                 # Generate documentation!

Open up the file created in `docs/index.html` and read the documentation in
`Webserver.Router`.

Follow the exercises in the code, and when done:

* Switch to the next branch
* Regenerate documentation with `mix docs`
* Do the exercises
* Rinse and repeat!

## Issues

Please feel free to raise any issues or ask questions in the Issues section of
this repo, we'll do our best to answer them!
