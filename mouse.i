
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
	
	return 0
}

method mouse.y() {
	.javascript {
		stack.push(bigInt(cursor_Y*10));
		return;
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
