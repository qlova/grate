type Circle {
	x, y, r
}

method draw(Circle) {
	var X = x
	var Y = y
	var R = r
	.python pygame.gfxdraw.filled_circle(pygame.display.get_surface(), int(X/10), int(Y/10), int(R/10), grate_color)
	
	.java MainActivity.canvas.drawCircle(X.intValue()/10, Y.intValue()/10, R.intValue()/10, MainActivity.paint);
	
	.lua love.graphics.circle("fill", tonumber(tostring(X))/10, tonumber(tostring(X))/10, tonumber(tostring(X))/10)
	
	.javascript context.beginPath(); context.arc(X/10, Y/10, R/10, 0, 2*Math.PI, false); context.fill();
	.qml context.beginPath(); context.arc(X/10, Y/10, R/10, 0, 2*Math.PI, false); context.fill();
}
