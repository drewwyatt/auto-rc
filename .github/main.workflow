workflow "New workflow" {
  on = "schedule(*/5 * * * *)"
  resolves = ["Open a PR"]
}

action "Open a PR" {
  uses = "./"
  args = "Boom boom pow"
}
