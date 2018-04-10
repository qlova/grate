.python {
	mouse_pos_x = 0
	mouse_pos_y = 0
	mouse_buttons = 0
	def on_mouse_motion(x, y, dx, dy):
		\t global mouse_pos_x
		\t global mouse_pos_y
		\t global mouse_buttons
		\t mouse_pos_x = x
		\t mouse_pos_y = y
		\t mouse_buttons = 0
	def on_mouse_drag(x, y, dx, dy, buttons, m):
		\t global mouse_pos_x
		\t global mouse_pos_y
		\t global mouse_buttons
		\t mouse_pos_x = x
		\t mouse_pos_y = y
		\t mouse_buttons = buttons
	
	def on_mouse_press(x, y, button, modifiers):
		\t global mouse_buttons
		\t mouse_pos_x = x
		\t mouse_pos_y = y
		\t mouse_buttons = mouse_buttons | button

	def on_mouse_release(x, y, button, modifiers):
		\t global mouse_buttons
		\t mouse_pos_x = x
		\t mouse_pos_y = y
		\t mouse_buttons =  mouse_buttons & ~button

	window.on_mouse_motion = on_mouse_motion
	window.on_mouse_drag = on_mouse_drag
	window.on_mouse_press = on_mouse_press
	window.on_mouse_release = on_mouse_release
}


type MouseWheel {}

method MouseWheel.x() {
	.javascript {
		stack.push(bigInt(scroll_X));
		return;
	}
	
	return 0
}

method MouseWheel.y() {
	.javascript {
		stack.push(bigInt(scroll_Y));
		return;
	}
	
	return 0
}

type mouse { 
	{MouseWheel} wheel 
}

method mouse.x() {
	.javascript {
		stack.push(bigInt(cursor_X*10));
		return;
	}
	
	.python {
		Network_SendSets(120, mouse_pos_x%250, i_div(mouse_pos_x, 250))
		x = Network_GetSets(120)
		if x:
			\t stack.push((x[0]+x[1]*250)*10)
			\t return 
 
	}
	
	.android {
		Stack.Array x = Network_GetSets((byte)120);
		if (x != null) {
			stack.push(new Stack.Number( ((x.index(0))+(x.index(1)*250))*10 ));
			return;
		}
	}
	
	return 0
}

method mouse.y() {
	.javascript {
		stack.push(bigInt(cursor_Y*10));
		return;
	}
	
	.python {
		value = int((window.height-mouse_pos_y))
		Network_SendSets(121, value%250, i_div(value, 250))
		y = Network_GetSets(121)
		if y:
			\t stack.push((y[0]+y[1]*250)*10)
			\t return 
 
	}
	
	.android {
		Stack.Array y = Network_GetSets((byte)121);
		if (y != null) {
			stack.push(new Stack.Number( ((y.index(0))+(y.index(1)*250))*10 ));
			return;
		}
	}
	
	return 0
}

method mouse.down(n) {
	.javascript {
		if (grate_mouse[n-1]) {
			stack.push(bigInt.one);
			return;
		}
	}
	
	.python{
		if mouse_buttons & n:
			\t Network_SendCode(86, n, 0)
		if Network_GetCode(86, n, 0):
			\t return
	}
	
	return 0
}

.qml var touch = null

.javascript {
	var cursor_X = 0;
	var cursor_Y = 0;
	var scroll_X = 0;
	var scroll_Y = 0;
	var grate_mouse = {};
	
	document.onmousemove = function(e){
		cursor_X = e.pageX;
		cursor_Y = e.pageY;
	}
	document.body.onmousedown = function(e) {
		e = e
	  grate_mouse[e.button] = 1;
	}
	document.body.onmouseup = function(e) {
	e = e
	  delete grate_mouse[e.button];
	}
	document.body.oncontextmenu = function(e) {
		return false
	}
	
	var grate_mouse_wheel = function(e) {
		scroll_X = e.wheelDeltaX;
		scroll_Y = e.wheelDeltaY;
	}
	
	document.addEventListener("DOMMouseScroll", grate_mouse_wheel, false);
	document.onmousewheel = grate_mouse_wheel;
}

/*method update(Mouse) {
	var X = 0
	var Y = 0
	var Button = 0
	
	.python {
		X,Y = pygame.mouse.get_pos()
		X = X * 10
		Y = Y * 10
		a,b,c = pygame.mouse.get_pressed()
		if a: 
			\t Button = 1
	}
	
	.java {
		X = new Stack.Number(MainActivity.touchx*10);
		Y = new Stack.Number(MainActivity.touchy*10);
		if (MainActivity.touching) {
			Button = new Stack.Number(1);
		}
	}
	
	.qml {
		X = bigInt(Math.floor(touch.x)*10)
		Y = bigInt(Math.floor(touch.y)*10)
		if (touch.pressed) {
			Button = bigInt.one
		}
	}
	
	x = X
	y = Y
	button = Button
}*/
