#!/bin/bash

# Define the filenames
file1="won.txt"
file2="lost.txt"

# Check if files exist
if [[ ! -f "$file1" ]]; then
  echo "File $file1 not found!"
  exit 1
fi

if [[ ! -f "$file2" ]]; then
  echo "File $file2 not found!"
  exit 1
fi

count_won_occurences() {
	count=$(grep -w "$1" "$file1" | wc -l)
	echo "$count"
}

count_total_occurences() {
	count=$(grep -w "$1" "$file1" "$file2" | wc -l)
	echo "$count"
}

all_pokemon=$(cat $file1 $file2 | sort -u)

sorted=""

while IFS= read -r mon; do
	c1=$(count_won_occurences "$mon")
	c2=$(count_total_occurences "$mon")

	if [[ "$c2" -gt 0 ]]; then
        ratio=$(echo "$c1 / $c2 * 100" | bc -l)  # Calculate ratio with decimal precision
    else
        ratio=0
    fi
	sorted+="$mon $(printf "%.2f" "$ratio")"$'\n'
done <<< "$all_pokemon"

echo "$sorted" | sort -k2,2 -n -r
