type Circle {
	x, y, r, f
}

function circle(x, y, r) {
	.python pygame.gfxdraw.filled_circle(pygame.display.get_surface(), int(x/10), int(y/10), int(r/10), grate_color)
}

method draw(Circle) {
	.python pygame.gfxdraw.filled_circle(pygame.display.get_surface(), int(x/10), int(y/10), int(r/10), grate_color)
	
	.java MainActivity.canvas.drawCircle(x.intValue()/10, y.intValue()/10, r.intValue()/10, MainActivity.paint);
	
	.lua love.graphics.circle("fill", tonumber(tostring(x))/10, tonumber(tostring(y))/10, tonumber(tostring(r))/10)
	
	.javascript context.beginPath(); context.arc(x/10, y/10, r/10, 0, 2*Math.PI, false); context.fill();
	.qml context.beginPath(); context.arc(x/10, y/10, r/10, 0, 2*Math.PI, false); context.fill();
}

type Rectangle {
	x, y, w, h, f
}

method draw(Rectangle) {
	.python pygame.draw.rect(pygame.display.get_surface(), grate_color, (x/10,y/10,w/10,h/10), 0)
}

type Square {
	x, y, s, f
}

method draw(Square) {
	.python pygame.draw.rect(pygame.display.get_surface(), grate_color, (x/10,y/10,s/10,s/10), 0)
}

