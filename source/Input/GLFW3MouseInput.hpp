#ifndef __PLATFORM_GLFW3MouseInput_HPP_
#define __PLATFORM_GLFW3MouseInput_HPP_

#include <r3d/Input/MouseInput.hpp>

namespace r3d
{
	class GLFW3ContextWindow;
	class GLFW3MouseInput: public MouseInput
	{
	public:
		GLFW3MouseInput(ContextWindow *window);
		virtual ~GLFW3MouseInput()=default;

		virtual void setPos(double, double);
		virtual void getPos(double *xpos, double *ypos);
		virtual void updateInput(){}

		virtual bool getButton(MouseButton);
	};
}

#endif