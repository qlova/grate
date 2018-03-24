 
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
			\t stack.push(1)
			\t return
	}

	return 0
}

method gamepad.axis(button) {

	.javascript {
		var b = button.toJSNumber()
		var gp = gamepad.toJSNumber()
		
		if (navigator.getGamepads()[gp]) {
			stack.push(bigInt(navigator.getGamepads()[gp].axes[b]*100));
			return;
		}
		
	}
	
	.python {
		if len(grate_gamepads) <= gamepad:
			\t stack.push(0)
			\t return
		if button == 0:
			\t stack.push(grate_gamepads[gamepad].x*100)
			\t return
		elif button == 1:
			\t stack.push(grate_gamepads[gamepad].y*100)
			\t return
		elif button == 2:
			\t stack.push(grate_gamepads[gamepad].z*100)
			\t return
		elif button == 3:
			\t stack.push(grate_gamepads[gamepad].rz*100)
			\t return
	}

	return 0
}
