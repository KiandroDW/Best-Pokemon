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
sorted2=""

while IFS= read -r mon; do
	c1=$(count_won_occurences "$mon")
	c2=$(count_total_occurences "$mon")

	if [[ "$c2" -gt 0 ]]; then
        ratio=$(echo "$c1 / $c2 * 100" | bc -l)  # Calculate ratio with decimal precision
		if [[ "$ratio" > 0.5 ]]; then
			sorted+="$mon $(printf "%.2f" "$ratio") ($c1/$c2)"$'\n'
		else
			sorted2+="$mon $(printf "%.2f" "$ratio") ($c1/$c2)"$'\n'
		fi
    else
        ratio=0
		sorted2+="$mon $(printf "%.2f" "$ratio") ($c1/$c2)"$'\n'
    fi
done <<< "$all_pokemon"

sorted=$(echo "$sorted" | sed -E 's/^(\S+) (\S+) \((\S+)\/(\S+)\)$/\2|\3|\4|\1/' | \
  sort -t'|' -k1,1nr -k2,2nr -k3,3nr -k4,4 | \
  sed -E 's/^([^|]+)\|([^|]+)\|([^|]+)\|([^|]+)$/\4 \1 (\2\/\3)/')

sorted2=$(echo "$sorted2" | sed -E 's/^(\S+) (\S+) \((\S+)\/(\S+)\)$/\2|\3|\4|\1/' | \
  sort -t'|' -k1,1nr -k2,2nr -k3,3n -k4,4 | \
  sed -E 's/^([^|]+)\|([^|]+)\|([^|]+)\|([^|]+)$/\4 \1 (\2\/\3)/')

echo "$sorted$sorted2"
