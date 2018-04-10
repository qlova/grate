type key {}

macro javascript_key(code) {
	.javascript { 
		if (grate_keys[code]) {
			stack.push(bigInt.one)
			return;
		}
	}
}

macro python_key(symbol, code) {
	.python {
		if grate_keys[key.symbol]:
			\t Network_SendCode(75, code, 0)
		if Network_GetCode(75, code, 0):
			\t return
	}
}

macro android_key(symbol, code) {
	.android {
		Boolean b = MainActivity.grate_keys.get(KeyEvent.KEYCODE_\symbol);
		if (b != null && b) {
			Network_SendCode((byte)75, (byte)code, (byte)0);
		}
		if (Network_GetCode((byte)75, (byte)code, (byte)0)) {
			stack.push(new Stack.Number(1));
			return;
		}
	}
}

macro capital_letter_key(code) {

}

//Alphanumeric Keys:

method key.a() {
	javascript_key(65)
	//capital_letter_key(A)
	
	android_key(A, 65)
	python_key(A, 65)
	
	return false
}

method key.b() {
	javascript_key(66)
	capital_letter_key(B)
	
	python_key(B, 66)
	android_key(B, 66)
	
	return false
}

method key.c() {
	javascript_key(67)
	capital_letter_key(C)
	
	python_key(C, 67)
	android_key(C, 67)
	
	return false
}
method key.d() {
	javascript_key(68)
	
	.android {
		if (Network_GetCode((byte)75, (byte)68, (byte)0)) {
			stack.push(new Stack.Number(1));
			return;
		}
	}
	
	python_key(D, 68)
	android_key(D, 68)
	//capital_letter_key(D)
	
	return false
}

method key.e() {
	javascript_key(69)
	capital_letter_key(E)
	
	python_key(E, 69)
	android_key(E, 69)
	
	return false
}

method key.f() {
	javascript_key(70)
	
	python_key(F, 70)
	android_key(F, 70)
	
	return false
}

method key.g() {
	javascript_key(71)
	
	python_key(G, 71)
	android_key(G, 71)
	
	return false
}

method key.h() {
	javascript_key(72)
	capital_letter_key(H)
	
	python_key(H, 72)
	android_key(H, 72)
	
	return false
}

method key.i() {
	javascript_key(73)
	capital_letter_key(I)
	
	python_key(I, 73)
	android_key(I, 73)
	
	return false
}

method key.j() {
	javascript_key(74)
	capital_letter_key(J)
	
	python_key(J, 74)
	android_key(J, 74)
	
	return false
}

method key.k() {
	javascript_key(75)
	capital_letter_key(K)
	
	python_key(K, 75)
	android_key(K, 75)
	
	return false
}

method key.l() {
	javascript_key(76)
	capital_letter_key(L)
	
	python_key(L, 76)
	android_key(L, 76)
	
	return false
}

method key.m() {
	javascript_key(77)
	capital_letter_key(M)
	
	python_key(M, 77)
	android_key(M, 77)
	
	return false
}

method key.n() {
	javascript_key(78)
	capital_letter_key(N)
	
	python_key(N, 78)
	android_key(N, 78)
	
	return false
}

method key.o() {
	javascript_key(79)
	capital_letter_key(O)
	
	python_key(O, 79)
	android_key(O, 79)
	
	return false
}

method key.p() {
	javascript_key(80)
	capital_letter_key(P)
	
	python_key(P, 80)
	android_key(P, 80)
	
	return false
}

method key.q() {
	javascript_key(81)
	capital_letter_key(Q)
	python_key(Q, 81)
	android_key(Q, 81)
	
	return false
}

method key.r() {
	javascript_key(82)
	capital_letter_key(R)
	python_key(R, 82)
	android_key(R, 82)
	
	return false
}

method key.s() {
	javascript_key(83)
	capital_letter_key(S)
	python_key(S, 83)
	android_key(S, 83)
	
	return false
}

method key.t() {
	javascript_key(84)
	capital_letter_key(T)
	
	python_key(T, 84)
	android_key(T, 64)
	
	return false
}

method key.u() {
	javascript_key(85)
	capital_letter_key(U)
	python_key(U, 85)
	
	android_key(U, 85)
	
	return false
}

method key.v() {
	javascript_key(86)
	capital_letter_key(V)
	
	python_key(V, 86)
	android_key(V, 86)
	
	return false
}

method key.w() {
	javascript_key(87)
	capital_letter_key(W)
	python_key(W, 87)
	android_key(W, 87)
	
	return false
}

method key.x() {
	javascript_key(88)
	capital_letter_key(X)
	
	python_key(X, 88)
	android_key(X, 88)
	
	return false
}

method key.y() {
	javascript_key(89)
	capital_letter_key(Y)
	
	python_key(Y, 89)
	android_key(Y, 89)
	return false
}

method key.z() {
	javascript_key(90)
	capital_letter_key(Z)
	
	python_key(Z, 90)
	android_key(Z, 90)
	
	return false
}

method key.backspace() {
	javascript_key(8)
	python_key(BACKSPACE, 8)
	
	android_key(DEL, 8)
	
	return false
}

method key.space() {
	javascript_key(32)
	//python_key(SPACE)
	
	android_key(SPACE, 32)
	python_key(SPACE, 32)
	
	return false
}

method key.shift() {
	javascript_key(16)
	
	python_key(LSHIFT, 16)
	
	android_key(SHIFT_LEFT, 16)
	
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
