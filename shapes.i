type Circle {
	x, y, r
}

method draw() {
	var X = x
	var Y = y
	var R = r
	.python pygame.draw.circle(pygame.display.get_surface(), (255, 0, 0), (int(X/10), int(Y/10)), R, 0)
}
