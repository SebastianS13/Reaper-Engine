#pragma once

#include "Core.hpp"
#include "Events/Event.hpp"

namespace Reaper {

	class REAPER_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// To be defined by clients
	Application* CreateApplication();

}