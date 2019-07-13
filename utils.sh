check_var() {
  key=$1
  echo "Checking env for ${key}..."
  val=$(eval echo "\$$key")
  if [[ -z "${val}" ]]; then
    echo "Set the ${key} env variable."
    exit 1
  fi
  echo "${key}=\"${val}\" (OK)"
  echo ""
}

get_commit_message() {
  echo "${MESSAGE_PREFIX:-"Release Candidate"}: $(date +"%A, %b %d, %Y %H:%M:%S %z")"
}

create_pull_request() {
    API_VERSION=v3
    BASE=https://api.github.com
    AUTH_HEADER="Authorization: token ${GITHUB_TOKEN}"
    HEADER="Accept: application/vnd.github.${API_VERSION}+json"
    HEADER="${HEADER}; application/vnd.github.antiope-preview+json; application/vnd.github.shadow-cat-preview+json"

    REPO_URL="${BASE}/repos/${GITHUB_REPOSITORY}"
    PULLS_URL=$REPO_URL/pulls

    DATA="{\"base\":\"${TARGET_BRANCH}\", \"head\":\"${SOURCE_BRANCH}\", \"body\":\"${1}\"}"
    RESPONSE=$(curl -sSL -H "${AUTH_HEADER}" -H "${HEADER}" --user "${GITHUB_ACTOR}" -X GET --data "${DATA}" ${PULLS_URL})
    PR=$(echo "${RESPONSE}" | jq --raw-output '.[] | .head.ref')
    echo "Response ref: ${PR}"

    # Option 1: The pull request is already open
    if [[ "${PR}" == "${SOURCE_BRANCH}" ]]; then
        echo "Pull request from ${SOURCE_BRANCH} to ${TARGET_BRANCH} is already open!"

    # Option 2: Open a new pull request
    else
        # Post the pull request
        DATA="{\"title\":\"${TITLE}\", \"body\":\"${BODY}\", \"base\":\"${TARGET_BRANCH}\", \"head\":\"${SOURCE_BRANCH}\", \"draft\":\"${DRAFT}\"}"
        echo "curl --user ${GITHUB_ACTOR} -X POST --data ${DATA} ${PULLS_URL}"
        curl -sSL -H "${AUTH_HEADER}" -H "${HEADER}" --user "${GITHUB_ACTOR}" -X POST --data "${DATA}" ${PULLS_URL}
        echo $?
    fi
}
