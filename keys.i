type key {}

macro javascript_key(code) {
	.javascript { 
		if (grate_keys[code]) {
			stack.push(bigInt.one)
			return;
		}
	}
}


macro capital_letter_key(code) {
	.python { 
		if grate_keys[key.code]:
			\t stack.push(1)
			\t return
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
		keys += q	
		pressed_keys[id] = true
	elseif NotPressedNow and PressedBefore
		pressed_keys[id] = false
	end
}
