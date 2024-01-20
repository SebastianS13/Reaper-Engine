#pragma once

#include <memory>

#include "Core.hpp"
#include "spdlog/spdlog.h"

namespace Reaper {

	class REAPER_API Log
	{
	public:
		static void Init();
		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

	private:
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
	};

}

// Core logger macros
#define RE_CORE_TRACE(...)     ::Reaper::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define RE_CORE_INFO(...)      ::Reaper::Log::GetCoreLogger()->info(__VA_ARGS__)
#define RE_CORE_WARN(...)      ::Reaper::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define RE_CORE_ERROR(...)     ::Reaper::Log::GetCoreLogger()->error(__VA_ARGS__)
#define RE_CORE_FATAL(...)     ::Reaper::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client logger macros
#define RE_TRACE(...)          ::Reaper::Log::GetClientLogger()->trace(__VA_ARGS__)
#define RE_INFO(...)           ::Reaper::Log::GetClientLogger()->info(__VA_ARGS__)
#define RE_WARN(...)           ::Reaper::Log::GetClientLogger()->warn(__VA_ARGS__)
#define RE_ERROR(...)          ::Reaper::Log::GetClientLogger()->error(__VA_ARGS__)
#define RE_FATAL(...)          ::Reaper::Log::GetClientLogger()->fatal(__VA_ARGS__)