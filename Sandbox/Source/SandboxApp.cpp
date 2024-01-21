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

		if (Reaper::Input::IsKeyPressed(RE_KEY_TAB))
			RE_INFO("Tab key pressed");
	}

	void OnEvent(Reaper::Event& event) override
	{
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