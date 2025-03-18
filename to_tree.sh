#!/bin/bash

output_file="$(basename "$(pwd)")_tree.txt"
{
  echo "$(basename "$(pwd)")/"
  find . \( -path "./node_modules" -o -path "./.next" -o -path "./.git" \) -prune -o -print \
    | sed -e 's/^\.\///' -e 's/[^\/]*\//├── /g'
} > "$output_file"

echo "Tree saved to $output_file"