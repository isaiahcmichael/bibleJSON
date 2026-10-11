#!/bin/bash

# Ensure 1.json exists before starting
if [ ! -f "1.json" ]; then
    echo "Error: 1.json does not exist in the current directory."
    exit 1
fi

# Prompt the user for how many files they want
read -p "Enter the total number of files you want to generate: " total

# Validate that the input is a positive integer
if ! [[ "$total" =~ ^[0-9]+$ ]] || [ "$total" -lt 1 ]; then
    echo "Error: Please enter a valid positive integer greater than 0."
    exit 1
fi

# Save a temporary backup of 1.json to use as a clean template
cp "1.json" ".template.json"

# Loop from 1 to the specified total
for ((i=1; i<=total; i++)); do
    filename="${i}.json"

    # Copy the template to the new filename
    cp ".template.json" "$filename"

    # Replace the '#' character with the current number
    # Note: If you are on macOS, change 'sed -i' to 'sed -i ""'
    sed -i "s/#/$i/g" "$filename"
done

# Clean up the temporary template file
rm ".template.json"

echo "Successfully generated files from 1.json to ${total}.json!"
