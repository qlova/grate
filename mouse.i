
type Mouse {
	x,y
	button
}

.qml var touch = null

method new(Mouse) {
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
	
}
