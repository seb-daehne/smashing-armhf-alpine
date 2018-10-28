echo "- starting smashing"

ARGS=''


if [[ ! -z "$SMASHING_PORT" ]]; then
  ARGS="$ARGS -p $SMASHING_PORT"
fi

exec smashing start $ARGS
