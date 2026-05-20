#!/usr/bin/env bash
set -e
OUT=${1:-rag-serve-demo.cast}

echo "Recording demo to $OUT"

after() {
  echo "Convert the cast to GIF with: asciinema2gif $OUT rag-demo.gif"
}

if ! command -v asciinema >/dev/null 2>&1; then
  echo "Please install asciinema: https://asciinema.org/docs/installation"
  exit 1
fi

asciinema rec -c "docker build -t rag-serve-demo . && docker run --rm -p 8080:8080 rag-serve-demo" $OUT

after
