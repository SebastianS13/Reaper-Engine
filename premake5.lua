workspace "Reaper"
	architecture "x64"
    startproject "Sandbox"

	configurations {
		"Deubg",
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
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines {
			"RE_PLATFORM_WINDOWS",
			"RE_BUILD_DLL",
			"RE_ENABLE_ASSERTS",
			"GLFW_INCLUDE_NONE",
		}

		postbuildcommands {
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}
	
	filter "Configurations:Debug"
		defines "RE_DEBUG"
		buildoptions "/MDd"
		symbols "On"
	
	filter "Configurations:Release"
		defines "RE_RELEASE"
		buildoptions "/MD"
		optimize "On"

	filter "Configurations:Dist"
		defines "RE_DIST"
		buildoptions "/MD"
		optimize "On"



project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

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
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines {
			"RE_PLATFORM_WINDOWS"
		}
	
	filter "Configurations:Debug"
		defines "RE_DEBUG"
		buildoptions "/MDd"
		symbols "On"
	
	filter "Configurations:Release"
		defines "RE_RELEASE"
		buildoptions "/MD"
		optimize "On"

	filter "Configurations:Dist"
		defines "RE_DIST"
		buildoptions "/MD"
		optimize "On"