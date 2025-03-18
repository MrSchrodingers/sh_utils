#!/bin/bash
output_file="$(basename "$(pwd)")_content.json"
echo "[" > "$output_file"
first=true

find . -type f \
  ! -path "./node_modules/*" \
  ! -path "*/__pycache__/*" \
  ! -path "./.next/*" \
  ! -path "./.venv/*" \
  ! -path "./.env/*" \
  ! -path "./*_tree.txt" \
  ! -path "./*_content.json" \
  ! -path "./*.lock" \
  ! -path "./.git/*" | while IFS= read -r file; do

    if [ "$first" = true ]; then
      first=false
    else
      echo "," >> "$output_file"
    fi

    relpath="${file#./}"
    
    if file "$file" | grep -qi "text"; then
      content=$(python3 -c "import sys, json; print(json.dumps(sys.stdin.read()))" < "$file")
      echo "{\"path\": \"${relpath}\", \"encoding\": \"utf-8\", \"content\": ${content}}" >> "$output_file"
    else
      encoded=$(base64 "$file")
      echo "{\"path\": \"${relpath}\", \"encoding\": \"base64\", \"content\": \"${encoded}\"}" >> "$output_file"
    fi
done

echo "]" >> "$output_file"
