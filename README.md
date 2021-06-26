# Wabanex

This project was created during NLW Together event from [RocketSeat](https://rocketseat.com.br) in the Elixir mission.

## Setup

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create db using [Docker](https://docs.docker.com/engine/install/ubuntu/) with:

    ```docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres``` 
    
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

