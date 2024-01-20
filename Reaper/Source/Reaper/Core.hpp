#pragma once

#ifdef RE_PLATFORM_WINDOWS
	#ifdef RE_BUILD_DLL
		#define REAPER_API __declspec(dllexport)
	#else
		#define REAPER_API __declspec(dllimport)
	#endif
#else
	#error Reaper only supports windows.
#endif