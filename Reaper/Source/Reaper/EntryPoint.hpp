#pragma once


#ifdef RE_PLATFORM_WINDOWS

extern Reaper::Application* Reaper::CreateApplication();

	int main(int argc, char** argv)
	{
		auto app = Reaper::CreateApplication();
		app->Run();
		delete app;
	}

#endif
