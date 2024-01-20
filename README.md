# Reaper-Engine
Reaper Game Engine

## Building Source Code

Firstly make sure you have [Git](https://git-scm.com/) installed. If you are unsure you can run the command `git --version`.

Next you will have to clone the repo into a folder. Do this by opening a command prompt and running:
```
git clone https://github.com/SebastianS13/Reaper-Engine ReaperEngine
```

cd into the folder using `cd ReaperEngine` or to the location you cloned the repo making sure your in the same directory as the ".gitignore". Here you will run the premake command:
```
vendor\bin\premake\premake5.exe vs2022
```

This is an example to build a visual studio solution, if you would like to build to anything else you can check out the [Premake Wiki](https://premake.github.io/docs/Building-Premake) OR running `vendor\bin\premake\premake5.exe --help`