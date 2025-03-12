#!/bin/bash

current_dir=$(pwd)

# Check if repository path and time are provided
if [ -z "$1" ]; then
  echo "Please provide the path to your Git repository."
  exit 1
fi

if [ -z "$2" ]; then
  echo "Please provide the time to check (in 24-hour format, e.g., 13:01)."
  exit 1
fi

# Assign the parameters to variables
repo_dir="$1"
check_time="$2"

# Extract the hour and minute from the check_time
hour=$(echo "$check_time" | cut -d':' -f1)
minute=$(echo "$check_time" | cut -d':' -f2)

# Validate the repository path
if [ ! -d "$repo_dir/.git" ]; then
  echo "The directory $repo_dir is not a valid Git repository."
  exit 1
fi

# Function to check for uncommitted changes
check_for_changes() {
  date=$(date)
  git_output=$(cd "$repo_dir" && git status)

  if echo "$git_output" | grep -q "Changes not staged for commit"; then
  	echo "You have uncommitted changes in $repo_dir on $date!" >> $current_dir/log.txt
  elif echo "$git_output" | grep -q "Changes to be committed"; then
  	echo "You have staged changes in $repo_dir on $date!" >> $current_dir/log.txt
  elif echo "$git_output" | grep -q "Untracked files"; then
  	echo "You have untracked files in $repo_dir on $date!" >> $current_dir/log.txt
  else
  	echo "Everything is up to date in $repo_dir on $date." >> $current_dir/log.txt
  fi
}
check_for_changes "$repo_dir"

# Add the cron job
cron_time="$minute $hour * * *"
echo "$cron_time $current_dir/gitauto.sh $repo_dir $check_time" | crontab -

echo "Cron job has been scheduled to check the repository at $check_time."

