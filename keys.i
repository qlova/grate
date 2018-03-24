type key {}

pattern javascript_key(code) {
	.javascript { 
		if (grate_keys[code]) {
			stack.push(bigInt.one)
			return;
		}
	}
}


pattern capital_letter_key(code) {
	.python { 
		if grate_keys[key.code]:
			\t stack.push(1)
			\t return;
	}
}

//Alphanumeric Keys:

method key.a() {
	javascript_key(65)
	capital_letter_key(A)
	
	return false
}

method key.b() {
	javascript_key(66)
	capital_letter_key(B)
	
	return false
}

method key.c() {
	javascript_key(67)
	capital_letter_key(C)
	
	return false
}
method key.d() {
	javascript_key(68)
	capital_letter_key(D)
	
	return false
}

method key.e() {
	javascript_key(69)
	capital_letter_key(E)
	
	return false
}

method key.f() {
	javascript_key(70)
	capital_letter_key(F)
	
	return false
}

method key.g() {
	javascript_key(71)
	capital_letter_key(G)
	
	return false
}

method key.h() {
	javascript_key(72)
	capital_letter_key(H)
	
	return false
}

method key.i() {
	javascript_key(73)
	capital_letter_key(I)
	
	return false
}

method key.j() {
	javascript_key(74)
	capital_letter_key(J)
	
	return false
}

method key.k() {
	javascript_key(75)
	capital_letter_key(K)
	
	return false
}

method key.l() {
	javascript_key(76)
	capital_letter_key(L)
	
	return false
}

method key.m() {
	javascript_key(77)
	capital_letter_key(M)
	
	return false
}

method key.n() {
	javascript_key(78)
	capital_letter_key(N)
	
	return false
}

method key.o() {
	javascript_key(79)
	capital_letter_key(O)
	
	return false
}

method key.p() {
	javascript_key(80)
	capital_letter_key(P)
	
	return false
}

method key.q() {
	javascript_key(81)
	capital_letter_key(Q)
	
	return false
}

method key.r() {
	javascript_key(82)
	capital_letter_key(R)
	
	return false
}

method key.s() {
	javascript_key(83)
	capital_letter_key(S)
	
	return false
}

method key.t() {
	javascript_key(84)
	capital_letter_key(T)
	
	return false
}

method key.u() {
	javascript_key(85)
	capital_letter_key(U)
	
	return false
}

method key.v() {
	javascript_key(86)
	capital_letter_key(V)
	
	return false
}

method key.w() {
	javascript_key(87)
	capital_letter_key(W)
	
	return false
}

method key.x() {
	javascript_key(88)
	capital_letter_key(X)
	
	return false
}

method key.y() {
	javascript_key(89)
	capital_letter_key(Y)
	
	return false
}

method key.z() {
	javascript_key(90)
	capital_letter_key(Z)
	
	return false
}

method key.backspace() {
	javascript_key(8)
	capital_letter_key(BACKSPACE)
	
	return false
}

method key.space() {
	javascript_key(32)
	capital_letter_key(SPACE)
	
	return false
}

method key.shift() {
	javascript_key(16)
	capital_letter_key(LSHIFT)
	
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
