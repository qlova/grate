type key {}

pattern javascript_key(code) {
	.javascript { 
		if (grate_keys[code]) {
			stack.push(bigInt.one)
			return;
		}
	}
}

//Alphanumeric Keys:

method key.a() {
	javascript_key(65)
	
	return false
}

method key.b() {
	javascript_key(66)
	
	return false
}

method key.c() {
	javascript_key(67)
	
	return false
}
method key.d() {
	javascript_key(68)
	
	return false
}

method key.e() {
	javascript_key(69)
	
	return false
}

method key.f() {
	javascript_key(70)
	
	return false
}

method key.g() {
	javascript_key(71)
	
	return false
}

method key.h() {
	javascript_key(72)
	
	return false
}

method key.i() {
	javascript_key(73)
	
	return false
}

method key.j() {
	javascript_key(74)
	
	return false
}

method key.k() {
	javascript_key(75)
	
	return false
}

method key.l() {
	javascript_key(76)
	
	return false
}

method key.m() {
	javascript_key(77)
	
	return false
}

method key.n() {
	javascript_key(78)
	
	return false
}

method key.o() {
	javascript_key(79)
	
	return false
}

method key.p() {
	javascript_key(80)
	
	return false
}

method key.q() {
	javascript_key(81)
	
	return false
}

method key.r() {
	javascript_key(82)
	
	return false
}

method key.s() {
	javascript_key(83)
	
	return false
}

method key.t() {
	javascript_key(84)
	
	return false
}

method key.u() {
	javascript_key(85)
	
	return false
}

method key.v() {
	javascript_key(86)
	
	return false
}

method key.w() {
	javascript_key(87)
	
	return false
}

method key.x() {
	javascript_key(88)
	
	return false
}

method key.y() {
	javascript_key(89)
	
	return false
}

method key.z() {
	javascript_key(90)
	
	return false
}

method key.backspace() {
	javascript_key(8)
	
	return false
}

method key.space() {
	javascript_key(32)
	
	return false
}

method key.shift() {
	javascript_key(16)
	
	return false
}

pattern CheckPressed(k, q, id) {
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
		keys += q	
		pressed_keys[id] = true
	elseif NotPressedNow and PressedBefore
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
	
	var keys = []
	
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
	
	
	return keys
}
