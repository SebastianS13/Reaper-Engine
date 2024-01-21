workspace "Reaper"
	architecture "x64"
    startproject "Sandbox"

	configurations {
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDirs = {}
IncludeDirs["GLFW"] = "Reaper/vendor/GLFW/include"
IncludeDirs["Glad"] = "Reaper/vendor/Glad/include"
IncludeDirs["ImGUI"] = "Reaper/vendor/ImGUI"

include "Reaper/vendor/GLFW"
include "Reaper/vendor/Glad"
include "Reaper/vendor/ImGUI"

project "Reaper"
	location "Reaper"
	kind "SharedLib"
	language "C++"
	staticruntime "Off"

	targetdir ("bin/".. outputdir.. "/%{prj.name}")
	objdir ("bin-int/".. outputdir.. "/%{prj.name}")

	pchheader "repch.hpp"
	pchsource "Reaper/Source/repch.cpp"

	files {
		"%{prj.name}/Source/**.hpp",
		"%{prj.name}/Source/**.cpp"
	}

	includedirs {
		"%{prj.name}/vendor/spdlog/include",
		"Reaper/Source",
		"%{IncludeDirs.GLFW}",
		"%{IncludeDirs.Glad}",
		"%{IncludeDirs.ImGUI}"
	}

	links {
		"GLFW",
		"Glad",
		"ImGUI",
		"opengl32.lib",
		"msvcrt.lib"
	}

	

	filter "system:windows"
		cppdialect "C++20"
		staticruntime "On"
		systemversion "latest"

		defines {
			"RE_PLATFORM_WINDOWS",
			"RE_BUILD_DLL",
			"GLFW_INCLUDE_NONE",
		}

		postbuildcommands {
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}
	
	filter "configurations:Debug"
		defines {"RE_DEBUG"}
		runtime "Debug"
		symbols "On"
	
	filter "configurations:Release"
		defines {"RE_RELEASE"}
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines {"RE_DIST"}
		runtime "Release"
		optimize "On"



project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	staticruntime "Off"

	targetdir ("bin/".. outputdir.. "/%{prj.name}")
	objdir ("bin-int/".. outputdir.. "/%{prj.name}")

	files {
		"%{prj.name}/Source/**.hpp",
		"%{prj.name}/Source/**.cpp"
	}

	includedirs {
		"Reaper/vendor/spdlog/include",
		"Reaper/Source",
	}

	links {
		"Reaper"
	}

	filter "system:windows"
		cppdialect "C++20"
		systemversion "latest"

		defines {
			"RE_PLATFORM_WINDOWS",
		}
	
	filter "configurations:Debug"
		defines "RE_DEBUG"
		runtime "Debug"
		symbols "On"
	
	filter "configurations:Release"
		defines "RE_RELEASE"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines "RE_DIST"
		runtime "Release"
		optimize "On"