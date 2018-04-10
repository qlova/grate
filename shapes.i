type Circle {
	x, y, r, f
}

function triangle(x, y, w, h, v) {
	.android {
	
		MainActivity.canvas.save();
		
		
		float X = x.intValue()/10;
		float Y = y.intValue()/10;	
		float W = w.intValue()/10;	
		float H = h.intValue()/10;	
		float V = v.intValue()/10;	
		
		MainActivity.canvas.translate(X, Y);
		MainActivity.canvas.rotate(MainActivity.setting_angle);
		MainActivity.canvas.translate(-X, -Y);
		
		android.graphics.Path path = new android.graphics.Path();
		path.moveTo(X-W/2, Y+H/2);
		path.lineTo(X+V, Y-H/2);
		path.lineTo(X+W/2, Y+H/2);
		
		MainActivity.canvas.drawPath(path, MainActivity.paint);
		
		MainActivity.canvas.restore();
	}
	
	.javascript {
		context.save()
		
		
		
		var x = x.toJSNumber()/10
		var y = y.toJSNumber()/10
		var w = w.toJSNumber()/10
		var h = h.toJSNumber()/10
		var v = v.toJSNumber()/10
		
		context.translate(x, y)
		context.rotate(setting_angle)
		context.translate(-x, -y)
		
		context.scale(setting_scalex, setting_scaley)
	
		var path = new Path2D();
		path.moveTo(x-w/2, y+h/2);
		path.lineTo(x+v, y-h/2);
		path.lineTo(x+w/2, y+h/2);
		context.fill(path);
		
		context.restore()
	}
	
	.python {
		glPushMatrix()
		glTranslatef(x, y, 0)
		glRotatef(setting_angle, 0, 0, 1.0)
		glTranslatef(-x, -y, 0)
	
		glEnable(GL_BLEND)
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
		glBegin(GL_POLYGON)

		#for the colour of the current object
		glColor4f(grate_color[0], grate_color[1], grate_color[2], grate_color[3])
			
		#list of vertices for object
		glVertex2f(x-w/2, y+h/2)
		glVertex2f(x+v, y-h/2)
		glVertex2f(x+w/2, y+h/2)
		

		#complete drawing verticies
		glEnd()
		glDisable(GL_BLEND)
		glPopMatrix()
	}
	
	set.defaults()
}

function oval(x, y, w, h) {
	.android {
		
		//MainActivity.canvas.save();
		//MainActivity.canvas.translate(MainActivity.setting_offsetx, MainActivity.setting_offsety);
	
		MainActivity.canvas.drawCircle(x.intValue()/10+MainActivity.setting_offsetx, 
			y.intValue()/10+MainActivity.setting_offsety, w.intValue()/10, MainActivity.paint);
		
		//MainActivity.canvas.restore();
	}

	.python {
	
		iterations = int(2*w*math.pi)
		s = math.sin(2*math.pi / iterations)
		c = math.cos(2*math.pi / iterations)

		dx, dy = w, 0
		
		glEnable(GL_BLEND)
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
		glBegin(GL_TRIANGLE_FAN)
		glColor4f(grate_color[0], grate_color[1], grate_color[2], grate_color[3])
		glVertex2f(x, y)
		for i in range(iterations+1):
			\t glVertex2f(x+dx, y+dy)
			\t dx, dy = (dx*c - dy*s), (dy*c + dx*s)
		glEnd()
		glDisable(GL_BLEND)

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
	.android {
		float X, Y, W, H;
		X = (float)(x.intValue()/10)+MainActivity.setting_offsetx;
		Y = (float)(y.intValue()/10)+MainActivity.setting_offsety;
		W = (float)(w.intValue()/10);
		H = (float)(h.intValue()/10);
		X -= W/2;
		Y -= H/2;
		W += X;
		H += Y;
		MainActivity.canvas.drawRect(X, Y, W, H, MainActivity.paint);
	}

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
		glColor4f(grate_color[0], grate_color[1], grate_color[2], grate_color[3])
			
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
	.lua love.graphics.circle("fill", tonumber(tostring(x))/10, tonumber(tostring(y))/10, tonumber(tostring(r))/10)
	
	.qml context.beginPath(); context.arc(x/10, y/10, r/10, 0, 2*Math.PI, false); context.fill();
}*/
