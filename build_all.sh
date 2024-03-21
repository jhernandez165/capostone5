#!/bin/bash

# Go into each directory in the current directory
for dir in */; do
    echo "Building $dir ..."
    # Change directory
    cd "$dir" || exit
    # Run Maven clean package with skipTests flag
    mvn clean package -DskipTests
    # Move back to the original directory
    cd ..
done

echo "Build process completed for all directories."
