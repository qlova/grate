
type Mouse {
	x,y
	button
}

.qml var touch = null

.javascript {
	var cursor_X;
	var cursor_Y;
	var mouse_Down = 0;
	
	document.onmousemove = function(e){
		cursor_X = e.pageX;
		cursor_Y = e.pageY;
	}
	document.body.onmousedown = function() {
	  mouse_Down = 1;
	}
	document.body.onmouseup = function() {
	  mouse_Down = 0;
	}
}

method update(Mouse) {
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
	
	.javascript {
		X = bigInt(cursor_X * 10);
		Y = bigInt(cursor_Y * 10);
		
		if (mouse_Down > 0) {
			Button = bigInt.one;
		}
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
}

method new(Mouse) {
	update(Mouse)
}
