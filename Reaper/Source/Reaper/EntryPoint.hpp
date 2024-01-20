#pragma once


#ifdef RE_PLATFORM_WINDOWS

extern Reaper::Application* Reaper::CreateApplication();

	int main(int argc, char** argv)
	{
		Reaper::Log::Init();
		RE_CORE_WARN("Logger initialized");
		int TestVar = 5;
		RE_INFO("Test Var={0}", TestVar);

		auto app = Reaper::CreateApplication();
		app->Run();
		delete app;
	}

#endif
