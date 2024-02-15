#!/usr/bin/env bash
## https://devhints.io/bash
main_dir="$PWD"
web_dir="$main_dir/webapp-journal"
source_dir="$main_dir/composition-experiments"
target_dir="$web_dir/src/frameworks"

cd "$source_dir" || exit

# List subdirectories in the source directory
sub_dirs=($(find . -maxdepth 1 -type d ! -name "."))

# Go back to the original directory
cd ..

# Loop through the subdirectories
for sub_dir in "${sub_dirs[@]}"; do
    # Create the corresponding target subdirectory if it doesn't exist
    if [ -d "$target_dir/$sub_dir" ]; then
	echo "$target_dir/$sub_dir does exist."
    else
	echo "$target_dir/$sub_dir does not exist. Creating"
	mkdir -p "$target_dir/$sub_dir"
    fi
# TODO: Make this more dynamic with a list of extensions
    # Find and copy .md files from the source subdirectory to the target subdirectory
    find "$source_dir/$sub_dir" -name "*.md" -exec cp -p {} "$target_dir/$sub_dir/" \;
done

echo "Files copied successfully."

cd "$web_dir"

while getopts "t" opt; do
  case $opt in
    t)
	echo "Testing locally with elm-pages and new Markdown files!"
	npx elm-pages dev
      ;;
    ?)
	echo "Publishing to GitHub for CD"
	git add "$target_dir" && git commit -m "Update Journal: $(date +'%Y-%m-%d'), $(date +"%T")" && git push
      ;;
  esac
done

cd "$main_dir"

echo "Files published successfully!"
# TODO: Use netlify CLI to test netlify build locally and deploy without GitHub
# https://docs.netlify.com/cli/get-started/
