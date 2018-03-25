macro CheckPressed(k, q, id) {
	if key.k()
		PressedNow()
	else
		NotPressedNow()
	end
	if pressed_keys[id]
		PressedBefore()
	else
		NotPressedBefore()
	end
	
	if PressedNow and NotPressedBefore
		pressed += q	
		pressed_keys[id] = true
	elseif NotPressedNow and PressedBefore
		released += q
		pressed_keys[id] = false
	end
}

type Keyboard {
	[]pressed_keys
}

method Keyboard.pressed() {
	if len(pressed_keys) = 0
		pressed_keys = array(30)
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
}
