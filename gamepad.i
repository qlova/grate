 
type gamepad


.python {
	grate_gamepads = []

	joysticks = pyglet.input.get_joysticks()
	if joysticks:
		\t joystick = joysticks[0]
		\t joystick.open()
		\t grate_gamepads.append(joystick)
}

function gamepads() {
	.javascript {
		stack.push(navigator.getGamepads().length)
		return
	}

	.python {
		stack.push(len(grate_gamepads))
		return 
	}
	
	return 0
}

method gamepad.down(button) {

	.javascript {
		var b = button.toJSNumber()
		var gp = gamepad.toJSNumber()
		
		if (navigator.getGamepads()[gp] && navigator.getGamepads()[gp].buttons[b].pressed) {
			stack.push(bigInt.one);
			return;
		}
		
		
	}
	
	.python {
		if len(grate_gamepads) > gamepad and grate_gamepads[gamepad].buttons[button]:
			\t Network_SendCode(74, gamepad, button)
		if Network_GetCode(74, gamepad, button):
			\t return
	}

	return 0
}

method gamepad.axis(button) {

	.javascript {
		var b = button.toJSNumber()
		var gp = gamepad.toJSNumber()
		
		if (navigator.getGamepads()[gp]) {
			stack.push(bigInt(Math.floor(navigator.getGamepads()[gp].axes[b]*100)));
			return;
		}
		
	}
	
	.python {
		if (len(grate_gamepads) > gamepad):
			\t if button == 0:
				\t\t Network_SendBoth(150, gamepad, int(grate_gamepads[gamepad].x*125)+125)
			\t elif button == 1:
				\t\t Network_SendBoth(151, gamepad, int(grate_gamepads[gamepad].y*125)+125)
			\t elif button == 2:
				\t\t Network_SendBoth(152, gamepad, int(grate_gamepads[gamepad].z*125)+125)
			\t elif button == 3:
				\t\t Network_SendBoth(153, gamepad, int(grate_gamepads[gamepad].rz*125)+125)

		if button == 0:
			\t v = Network_GetBoth(150, gamepad)
			\t if v >= 0:
			\t\t v = v-125
			\t else:
			\t\t v = 0
			\t stack.push(v)
			\t return
		elif button == 1:
			\t v = Network_GetBoth(151, gamepad)
			\t if v >= 0:
			\t\t v = v-125
			\t else:
			\t\t v = 0
			\t stack.push(v)
			\t return
		elif button == 2:
			\t v = Network_GetBoth(152, gamepad)
			\t if v >= 0:
			\t\t v = v-125
			\t else:
			\t\t v = 0
			\t stack.push(v)
			\t return
		elif button == 3:
			\t v = Network_GetBoth(153, gamepad)
			\t if v >= 0:
			\t\t v = v-125
			\t else:
			\t\t v = 0
			\t stack.push(v)
			\t return
		
	}

	return 0
}
