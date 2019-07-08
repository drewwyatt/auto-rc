say_hello() {
  echo "Let's open a PR"
}

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
