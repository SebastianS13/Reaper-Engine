#pragma once

#include "Core.hpp"
#include "Events/Event.hpp"
#include "Window.hpp"

namespace Reaper {

	class REAPER_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

	private:
		std::unique_ptr<Window> m_window = nullptr;
		bool m_Running = true;
	};

	// To be defined by clients
	Application* CreateApplication();

}