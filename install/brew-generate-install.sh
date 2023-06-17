#!/bin/bash

# Generates a shell script which isntalls all
# the brew items which are on on the current 
# machine onto a new one.
#
# This should be run on the old computer and 
# the generated script should be run on the 
# new one

output_file=brew-install.sh
casks=$(brew list --full-name --cask)
formula=$(brew list --full-name --formula)

echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"' >> $output_file

echo "# Casks" >> $output_file
while IFS= read -r line; do
  modified_line="brew install --cask ${line}"
  echo "$modified_line" >> $output_file
done <<< "$casks"

echo "# Formulae" >> $output_file
while IFS= read -r line; do
  modified_line="brew install ${line}"
  echo "$modified_line" >> $output_file
done <<< "$formula"
