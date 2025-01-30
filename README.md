# vcpkg Project Template

## Summary

This is a simple outline for setting up and using vcpkg with everyone's favorite language C++.

Within this template are two examples of cmake builds ('debug' and 'release') which showcase how vcpkg can package and build a project to different directories.


## Creating build directory presets

Inside 'CMakePresets.json' you can find the two builds mentioned above with their defined settings. These are simple setups; however, other advanced settings can be applied. 

Outline
```
cmake --preset=<preset_name>
```

Example...
```
cmake --preset=debug
```

## Building and running project via separate commands

### Building

Outline
```
cmake --build <path_to_preset_build_director>
```

Example...
```
cmake --build bin/debug/build
```

### Running

Outline...
```./<path_to_exec_in_newly_built_dir>
```

Example...
```
./bin/debug/build/main
```

### Build and running project via run.sh

The script 'run.sh' allows you to build and run with one command, targeting a specific preset. For more info look to script.

### vcpkg Path

In order for vcpkg to work properly 'VCPKG_ROOT' in 'CMakeUsersPresets.json' should point to your installation of vcpkg.

## Useful sources
- [What is vcpkg?](https://learn.microsoft.com/en-us/vcpkg/get_started/overview)
- [vcpkg dependency library](https://vcpkg.link/)
- [vcpkg setup documentation] (https://learn.microsoft.com/en-us/vcpkg/get_started/get-started?pivots=shell-bash)


## Notes

Its been some time since I have touched a compiled language like C++ so I thought putting together a template would help myself remember. I also realized that it might also help others whoare new to vcpkg or perhaps just getting back into it and need a quick refresher. 

### Author: Sam Bernau
