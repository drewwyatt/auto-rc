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
