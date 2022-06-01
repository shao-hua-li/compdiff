#!/bin/bash
set -e

if [ -z $FUZZER ] || [ -z $TARGET ] || [ -z $TIMEOUT ] || [ -z $SLAVES ] || [ -z $OUT ] || [ -z $AFFINITY ]; then
    echo '$FUZZER, $TARGET, $TIMEOUT, $SLAVES, $OUT, and $AFFINITY must be specified as environment variables.'
    exit 1
fi

export AFFINITY
source "$TARGET/args.sh"
source "$FUZZER/diff-fuzz-M.sh" &

sleep 5
for i in `seq 1 $SLAVES`
do
    AFFINITY=$((AFFINITY+1))
    export SLAVEID=$i
    source "$FUZZER/diff-fuzz-S.sh" &
    sleep 2
done
sleep $TIMEOUT

