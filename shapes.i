type Circle {
	x, y, r
}

method draw() {
	var X = x
	var Y = y
	var R = r
	.python pygame.draw.circle(pygame.display.get_surface(), (255, 0, 0), (int(X/10), int(Y/10)), int(R/10), 0)
	
	.java MainActivity.canvas.drawCircle(X.intValue()/10, Y.intValue()/10, R.intValue()/10, MainActivity.paint);
	
	.lua love.graphics.circle("fill", tonumber(tostring(X))/10, tonumber(tostring(X))/10, tonumber(tostring(X))/10)
}
