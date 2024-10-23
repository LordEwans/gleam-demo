import gleam/bytes_builder.{type BytesBuilder}
import gleam/http/elli
import gleam/http/request.{type Request}
import gleam/http/response.{type Response}
import gleam/io

pub fn service(_request: Request(t)) -> Response(BytesBuilder) {
  let body = bytes_builder.from_string("hello world!")

  response.new(200)
  |> response.prepend_header("made-with", "gleam")
  |> response.set_body(body)
}

pub fn main() {
  elli.become(service, on_port: 3000)
}
