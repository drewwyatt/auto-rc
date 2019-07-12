workflow "Schedule Workflow" {
  on = "schedule(*/5 * * * *)"
  resolves = ["Create an RC"]
}

action "Create an RC" {
  uses = "./"
  secrets = [
    "GITHUB_TOKEN"
  ]
  env = {
    SOURCE_BRANCH = "develop"
    TARGET_BRANCH = "master"
  }
}
