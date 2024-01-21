#include "repch.hpp"
#include <Reaper.hpp>

class Sandbox : public Reaper::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

Reaper::Application* Reaper::CreateApplication()
{
	return new Sandbox();
}