workflow "Schedule Workflow" {
  on = "schedule(*/5 * * * *)"
  resolves = ["Create an RC"]
}

action "Create an RC" {
  uses = "./"
  args = "Boom boom pow"
}
