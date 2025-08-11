#!/bin/bash

DIST_DIR="dist"

# Define list of git-related files/folders to preserve
IGNORE_ITEMS=(".git" ".gitignore" ".gitattributes" ".gitmodules" "README.md")

# Step 1: Delete everything in current directory except dist and git-related files/folders
echo "Deleting everything except '$DIST_DIR/' and Git-related files..."

if [ ! -d "$DIST_DIR" ]; then
  echo "Directory '$DIST_DIR' does not exist. Exiting."
  exit 1
fi

for item in * .*; do
  # Skip current/parent dir, dist dir, and any Git-related files
  if [[ "$item" == "." || "$item" == ".." || "$item" == "$DIST_DIR" ]]; then
    continue
  fi

  # Skip git items
  for git_item in "${IGNORE_ITEMS[@]}"; do
    if [[ "$item" == "$git_item" ]]; then
      continue 2  # Skip this item and continue to next in outer loop
    fi
  done

  # Remove the item (file or directory)
  rm -rf -- "$item"
done

echo "Step 1 complete: Cleaned directory."

# Step 2: Move contents from dist/ to current directory
echo "Moving contents from '$DIST_DIR/' into current directory..."

shopt -s dotglob  # Include hidden files
mv "$DIST_DIR"/* . 2>/dev/null
shopt -u dotglob

echo "Step 2 complete: Contents moved."

# Step 3: Remove dist directory
echo "Deleting '$DIST_DIR/'..."
rm -rf "$DIST_DIR"

echo "✅ All steps complete."
