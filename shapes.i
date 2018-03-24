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
		path.lineTo(x+w/2, y-h/2);
		context.fill(path);
		
		context.restore()
	}
	
	.python {
		glPushMatrix()
		glTranslatef(x, y, 0)
		glRotatef(setting_angle, 0, 0, 1.0)
		glTranslatef(-x, -y, 0)
	
		glBegin(GL_POLYGON)

		#for the colour of the current object
		glColor3f(grate_color[0], grate_color[1], grate_color[2])
			
		#list of vertices for object
		glVertex2f(x-w/2, y-h/2)
		glVertex2f(x+v, y+h/2)
		glVertex2f(x+w/2, y-h/2)
		

		#complete drawing verticies
		glEnd()
		
		glPopMatrix()
	}
	
	set.defaults()
}

function oval(x, y, w, h) {
	.python {
	
		iterations = int(2*w*math.pi)
		s = math.sin(2*math.pi / iterations)
		c = math.cos(2*math.pi / iterations)

		dx, dy = w, 0

		glBegin(GL_TRIANGLE_FAN)
		glColor3f(grate_color[0], grate_color[1], grate_color[2])
		glVertex2f(x, y)
		for i in range(iterations+1):
			\t glVertex2f(x+dx, y+dy)
			\t dx, dy = (dx*c - dy*s), (dy*c + dx*s)
		glEnd()

	}
	
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
	
	.python {
		glBegin(GL_POLYGON)

		#for the colour of the current object
		glColor3f(grate_color[0], grate_color[1], grate_color[2])
			
		#list of vertices for object
		glVertex2f(x-w/2, y+h/2)
		glVertex2f(x-w/2, y-h/2)
		glVertex2f(x+w/2, y-h/2)
		glVertex2f(x+w/2, y+h/2)
		

		#complete drawing verticies
		glEnd()
	}
	
	set.defaults()
}

function square(x, y, s) {	
	rectangle(x, y, s, s)
}


/*method draw(Circle) {	
	.java MainActivity.canvas.drawCircle(x.intValue()/10, y.intValue()/10, r.intValue()/10, MainActivity.paint);
	
	.lua love.graphics.circle("fill", tonumber(tostring(x))/10, tonumber(tostring(y))/10, tonumber(tostring(r))/10)
	
	.qml context.beginPath(); context.arc(x/10, y/10, r/10, 0, 2*Math.PI, false); context.fill();
}*/
