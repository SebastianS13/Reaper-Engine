#include "repch.hpp"

#include "Application.hpp"

#include "Reaper/Events/ApplicationEvent.hpp"
#include "Reaper/Log.hpp"

namespace Reaper {

	Application::Application()
	{
		m_window = std::unique_ptr<Window>(Window::Create());
	}


	Application::~Application()
	{

	}

	void Application::Run()
	{
		// Test event to make sure event system is working

		while (m_Running)
		{
			m_window->OnUpdate();
		}
	}

}