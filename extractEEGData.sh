#!/bin/bash
# Set variable values
SRCFILE=~/data/zhang_eeg/eeg_full.tar
TARDIR=~/data/zhang_eeg/extracted
# Make target directory
mkdir $TARDIR
# Extract primary tar file to desired target folder
tar -xvf $SRCFILE -C $TARDIR
# Change directory to the desired target folder
cd $TARDIR
# Extract each subject's tar.gz file as directories with the same name in the
# same location
cat *.tar.gz | tar zxvf - --ignore-zeros
# Delete the compressed tar.gz files that have been extracted
find . -type f -name "*.tar.gz" -delete
# Extract and replace all the trial files for each subject inside their
# respective folders
find . -name "*.gz" -exec gunzip {} \;
# # Delete the 17 'blacklisted' trials with empty files in co2c1000367
# xargs rm < $TARDIR/../blacklist.txt