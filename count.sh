#!/bin/bash

echo "Unique pokémon seen: $(cat won.txt lost.txt | sort -u | wc -l)"
echo "Total comparisons done: $(cat won.txt | wc -l)"
