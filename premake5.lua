workspace "Reaper"
	architecture "x64"

	configurations {
		"Deubg",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Reaper"
	location "Reaper"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/".. outputdir.. "/%{prj.name}")
	objdir ("bin-int/".. outputdir.. "/%{prj.name}")

	files {
		"%{prj.name}/Source/**.hpp",
		"%{prj.name}/Source/**.cpp"
	}

	includedirs {
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines {
			"RE_PLATFORM_WINDOWS",
			"RE_BUILD_DLL"
		}

		postbuildcommands {
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}
	
	filter "Configurations:Debug"
		defines "RE_DEBUG"
		symbols "On"
	
	filter "Configurations:Release"
		defines "RE_RELEASE"
		optimize "On"

	filter "Configurations:Dist"
		defines "RE_DIST"
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
		symbols "On"
	
	filter "Configurations:Release"
		defines "RE_RELEASE"
		optimize "On"

	filter "Configurations:Dist"
		defines "RE_DIST"
		optimize "On"