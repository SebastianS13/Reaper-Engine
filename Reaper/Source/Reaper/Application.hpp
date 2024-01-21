#pragma once

#include "Core.hpp"

#include "Events/Event.hpp"
#include "Reaper/Events/ApplicationEvent.hpp"

#include "Window.hpp"

namespace Reaper {

	class REAPER_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_window = nullptr;
		bool m_Running = true;
	};

	// To be defined by clients
	Application* CreateApplication();

}