#!/bin/bash
output="$(basename "$(pwd)")_content.json"
echo "[" > "$output"
first=true

find . -type f \
  ! -path "./node_modules/*" \
  ! -path "./.next/*" \
  ! -path "./.git/*" | while IFS= read -r file; do
    if [ "$first" = true ]; then
      first=false
    else
      echo "," >> "$output"
    fi

    relpath="${file#./}"
    
    if file "$file" | grep -qi "text"; then
      content=$(python3 -c "import sys, json; print(json.dumps(sys.stdin.read()))" < "$file")
      echo "{\"path\": \"${relpath}\", \"encoding\": \"utf-8\", \"content\": ${content}}" >> "$output"
    else
      encoded=$(base64 "$file")
      echo "{\"path\": \"${relpath}\", \"encoding\": \"base64\", \"content\": \"${encoded}\"}" >> "$output"
    fi
done

echo "]" >> "$output"
