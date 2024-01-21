#include "repch.hpp"
#include <Reaper.hpp>

class TestLayer : public Reaper::Layer
{
public:
	TestLayer() : Layer("Test")
	{

	}

	void OnUpdate() override
	{
		//RE_INFO("Test layer updated");
	}

	void OnEvent(Reaper::Event& event) override
	{
		RE_TRACE("{0}", event);
	}
};

class Sandbox : public Reaper::Application
{
public:
	Sandbox()
	{
		PushLayer(new TestLayer());
		PushOverlay(new Reaper::ImGuiLayer());
	}

	~Sandbox()
	{

	}
};

Reaper::Application* Reaper::CreateApplication()
{
	return new Sandbox();
}