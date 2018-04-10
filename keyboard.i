.javascript grate_keys = {}
.javascript grate_pressed = []
.javascript grate_released = []

.python {
	grate_pressed = []
	def on_key_press(symbol, modifiers):	
		\t global grate_pressed
		\t if (symbol >= 97 and symbol <= 122):
			\t\t if grate_keys[key.LSHIFT]: 
			\t\t\t grate_pressed.append(symbol-32)
			\t\t else:
			\t\t\t grate_pressed.append(symbol)
		\t else:
			\t\t if symbol == key.BACKSPACE:
			\t\t\t grate_pressed.append(8)
			\t\t elif symbol == key.SPACE:
			\t\t\t grate_pressed.append(32)
		
	window.on_key_press = on_key_press
}

type keys {}

method keys.pressed() {
	
	.python {
		global grate_pressed
		if (True):
			\t a = 0
			\t b = 0
			\t if len(grate_pressed) > 0:
				\t\t a = grate_pressed[0]
			\t if len(grate_pressed) > 1:
				\t\t b = grate_pressed[1]
			\t if len(grate_pressed) > 0:
				\t\t Network_SendSets(100, a, b)
			\t grate_pressed = []
			
			\t r = Network_GetSets(100)
			\t if r:
				\t\t if r[0] == 0:
					\t\t\t stack.share([])
				\t\t elif r[1] == 0:
					\t\t\t stack.share([r[0]])
				\t\t else:
					\t\t\t stack.share(r)
				\t\t return
	}
	
	.javascript {
		if (true) {
			stack.share(grate_pressed);
			grate_pressed = [];
			return;
		}
	}
	
	.android {
		if (true) {
			stack.share(MainActivity.grate_pressed);
			MainActivity.grate_pressed = new Stack.Array();
			return;
		}
	}
	
	return ""
}

/*macro CheckPressed(k, q, id) {
	if key.k()
		PressedNow()
	else
		NotPressedNow()
	end
	if pressedkeys[id]
		PressedBefore()
	else
		NotPressedBefore()
	end
	
	if PressedNow and NotPressedBefore
		pressed += q	
		pressedkeys[id] = true
	elseif NotPressedNow and PressedBefore
		released += q
		pressedkeys[id] = false
	end
}

type Keyboard {
	[]pressedkeys
}

method Keyboard.pressed() {
	if len(pressedkeys) = 0
		pressedkeys = array(30)
		print("hello")
	end
	
	var pressed = []
	var released = []
	
	boolean PressedNow/NotPressedNow
	boolean PressedBefore/NotPressedBefore

	if key.shift()
		CheckPressed(a, "A", 0)
		CheckPressed(b, "B", 1)
		CheckPressed(c, "C", 2)
		CheckPressed(d, "D", 3)
		CheckPressed(e, "E", 4)
		CheckPressed(f, "F", 5)
		CheckPressed(g, "G", 6)
		CheckPressed(h, "H", 7)
		CheckPressed(i, "I", 8)
		CheckPressed(j, "J", 9)
		
		CheckPressed(k, "K", 10)
		CheckPressed(l, "L", 11)
		CheckPressed(m, "M", 12)
		CheckPressed(n, "N", 13)
		CheckPressed(o, "O", 14)
		CheckPressed(p, "P", 15)
		CheckPressed(q, "Q", 16)
		
		CheckPressed(r, "R", 17)
		CheckPressed(s, "S", 18)
		CheckPressed(t, "T", 19)
		CheckPressed(u, "U", 20)
		CheckPressed(v, "V", 21)
		CheckPressed(w, "W", 22)
		CheckPressed(x, "X", 23)
		CheckPressed(y, "Y", 24)
		CheckPressed(z, "Z", 25)
	else
		CheckPressed(a, "a", 0)
		CheckPressed(b, "b", 1)
		CheckPressed(c, "c", 2)
		CheckPressed(d, "d", 3)
		CheckPressed(e, "e", 4)
		CheckPressed(f, "f", 5)
		CheckPressed(g, "g", 6)
		CheckPressed(h, "h", 7)
		CheckPressed(i, "i", 8)
		CheckPressed(j, "j", 9)
		
		CheckPressed(k, "k", 10)
		CheckPressed(l, "l", 11)
		CheckPressed(m, "m", 12)
		CheckPressed(n, "n", 13)
		CheckPressed(o, "o", 14)
		CheckPressed(p, "p", 15)
		CheckPressed(q, "q", 16)
		
		CheckPressed(r, "r", 17)
		CheckPressed(s, "s", 18)
		CheckPressed(t, "t", 19)
		CheckPressed(u, "u", 20)
		CheckPressed(v, "v", 21)
		CheckPressed(w, "w", 22)
		CheckPressed(x, "x", 23)
		CheckPressed(y, "y", 24)
		CheckPressed(z, "z", 25)
	end
	
	CheckPressed(space, " ", 26)
	CheckPressed(backspace, "", 27)
	
	
	return pressed
}*/
