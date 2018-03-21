type Circle {
	x, y, r, f
}

function triangle(x, y, w, h, v) {
	.javascript {
		context.save()
		
		
		
		var x = x.toJSNumber()/10
		var y = y.toJSNumber()/10
		var w = w.toJSNumber()/10
		var h = h.toJSNumber()/10
		
		context.translate(x, y)
		context.rotate(setting_angle)
		context.translate(-x, -y)
		
		context.scale(setting_scalex, setting_scaley)
	
		var path = new Path2D();
		path.moveTo(x-w/2, y-h/2);
		path.lineTo(x+v, y+h/2);
		path.lineTo(x+w/2, y+-h/2);
		context.fill(path);
		
		context.restore()
	}
	
	set.defaults()
}

function oval(x, y, w, h) {
	.python pygame.gfxdraw.filled_circle(pygame.display.get_surface(), int(x/10), int(y/10), int(r/10), grate_color)
	
	.javascript {
	
		var x = x.toJSNumber()/10
		var y = y.toJSNumber()/10
		var w = w.toJSNumber()/10
		var h = h.toJSNumber()/10
		
		context.save()
		context.translate(x, y)
		context.rotate(setting_angle)
		context.translate(-x, -y)
	
		context.beginPath(); 
		context.ellipse(x + setting_offsetx, y + setting_offsety, w*setting_scalex, h*setting_scaley, 0, 2*Math.PI, false); 
		context.fill();
		
		context.restore();
	}
	
	set.defaults()
}

function circle(x, y, r) {
	oval(x, y, r, r)
}


function rectangle(x, y, w, h) {	
	.javascript {
		var X = x.toJSNumber()/10 + setting_offsetx
		var Y = y.toJSNumber()/10 + setting_offsety
		var W = w.toJSNumber()/10*setting_scalex
		var H = h.toJSNumber()/10*setting_scaley
		
		context.save()
		context.translate(X, Y)
		context.rotate(setting_angle)
		context.translate(-X, -Y)
		
		context.beginPath(); context.rect(X-W/2, Y-H/2, W, H); context.fill();
		context.restore()
	}
	
	set.defaults()
}

function square(x, y, s) {	
	rectangle(x, y, s, s)
}


/*method draw(Circle) {
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
}*/

