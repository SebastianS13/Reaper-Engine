#pragma once

#include "Core.hpp"

#include "Window.hpp"

#include "Reaper/LayerStack.hpp"
#include "Reaper/Events/Event.hpp"
#include "Reaper/Events/ApplicationEvent.hpp"

namespace Reaper {

	class REAPER_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);

		void PushLayer(Layer* layer);
		void PushOverlay(Layer* layer);

		inline Window& GetWindow() { return *m_window; };
		static inline Application& Get() { return *s_Instance; };
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_window = nullptr;
		bool m_Running = true;
		LayerStack m_LayerStack;

	private:
		static Application* s_Instance;
	};

	// To be defined by clients
	Application* CreateApplication();

}