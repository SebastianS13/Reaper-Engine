#pragma once

#include "Reaper/Input/Input.hpp"

namespace Reaper {
	class WindowsInput : public Input
	{
	protected:
		virtual bool IsKeyPressedImpl(int KeyCode) override;

		virtual bool IsMouseButtonPressedImpl(int Button) override;
		virtual std::pair<float, float> GetMousePositionImpl() override;
		virtual float GetMouseXImpl() override;
		virtual float GetMouseYImpl() override;
	};
}