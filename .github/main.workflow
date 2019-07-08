workflow "Schedule Workflow" {
  on = "schedule(*/5 * * * *)"
  resolves = ["Create an RC"]
}

action "Create an RC" {
  uses = "./"
  env = {
    SOURCE_BRANCH = "develop"
    TARGET_BRANCH = "master"
  }
  secrets = ["GITHUB_TOKEN"]
}

workflow "New workflow" {
  on = "push"
  resolves = ["Auto RC"]
}

action "GitHub Action for npm" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
}

action "Auto RC" {
  uses = "./"
  needs = ["GitHub Action for npm"]
}
