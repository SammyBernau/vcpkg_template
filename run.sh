#!/bin/sh

PRINT_FORM="--"

helpFunction() {
	echo ""
	echo "Usage: $0 -p preset"
	echo -e "\t-p Define which preset to build and run. Only 'debug' or 'release' are accepted. To add more, alter 'CMakePresets.json' and 'CMakeUserPresets.json'."
	echo -e "Note: This scripts assumes the built run file is named 'main'."
	exit 1 # Exit script after printing help
}

while getopts "p:" opt
do 
	case "$opt" in
		p) preset="$OPTARG" ;;
		?) helpFunction ;;
	esac
done

# Print helpFunction in case parameters are empty

if [ -z "$preset" ]; then
	echo "Some or all parameters are empty!";
	helpFunction
fi

# Begin script in case all parameters are correct
echo "/-----------------------build.sh start-----------------------/"
BUILD_DIR="bin/$preset/build"
EXECUTABLE="/$BUILD_DIR/main"

# Build
echo -n "$PRINT_FORM Checking if /bin/$preset/build directory exists... "

if [ ! -d $BUILD_DIR ]; then
	echo "$BUILD_DIR not found!"
	echo "$PRINT_FORM Recreating build directory..."
	echo ""
	cmake --preset=$preset
	echo ""
else
	echo "$BUILD_DIR found!"
	echo "$PRINT_FORM Skipping recreate of build directory and building..."
fi

echo "$PRINT_FORM Building project to $preset..."
echo ""
cmake --build $BUILD_DIR
echo ""
echo "$PRINT_FORM Running $EXECUTABLE..."
echo "/-----------------------build.sh end-----------------------/"
echo ""

# Run
.$EXECUTABLE

