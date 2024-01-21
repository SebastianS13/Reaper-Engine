#include "Application.hpp"

#include "Reaper/Events/ApplicationEvent.hpp"
#include "Reaper/Log.hpp"

namespace Reaper {

	Application::Application()
	{

	}


	Application::~Application()
	{

	}

	void Application::Run()
	{
		// Test event to make sure event system is working
		WindowResizeEvent e(1280, 720);
		RE_TRACE(e);

		while (true);
	}

}