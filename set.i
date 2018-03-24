type set {}

.javascript {
	setting_color = []
	setting_color.push([255, 255, 255, 255])
	setting_scalex = 1;
	setting_scaley = 1;
	setting_angle = 0;
	setting_offsetx = 0;
	setting_offsety = 0;
	setting_colors = [];
}

.python {
	setting_offsetx = 0
	setting_offsety = 0
	setting_angle = 0
	grate_color = (255, 255, 255, 255)
}

method set.defaults() {
	.javascript {
		setting_color[setting_color.length-1] = [255, 255, 255, 255]
		setting_scalex = 1;
		setting_scaley = 1;
		setting_angle = 0;
		setting_offsetx = 0;
		setting_offsety = 0;
	}
	
	.python {
		global setting_offsetx
		global setting_offsety
		global setting_angle
		setting_offsetx = 0
		setting_offsety = 0
		setting_angle = 0
	}
}

method set.environment() {
	.javascript {
		context.save();
		setting_color.push([]);
		context.translate(setting_offsetx, setting_offsety);
		context.rotate(setting_angle);
		context.scale(setting_scalex, setting_scaley)
		var color = setting_color[setting_color.length-1];
		context.fillStyle = " rgba( "+color[0]+" , "+color[1]+" , "+color[2]+" , "+color[3]+") ";
	}
	
	.python {
		glPushMatrix()
		glTranslatef(setting_offsetx, setting_offsety, 0)
		glRotatef(setting_angle, 0, 0, 1.0)
	}
	
	set.defaults()
}

method set.decay() {
	.javascript {
		context.restore();
		setting_color.pop();
		var color = setting_color[setting_color.length-1];
		context.fillStyle = " rgba( "+color[0]+" , "+color[1]+" , "+color[2]+" , "+color[3]+") ";
	}
	
	.python {
		glPopMatrix()
	}
}

method set.color(r, g, b) {
	.javascript {
		var color = setting_color[setting_color.length-1];
		color[0] = r;
		color[1] = g;
		color[2] = b;
		context.fillStyle = " rgba( "+color[0]+" , "+color[1]+" , "+color[2]+" , "+color[3]+") ";
	}
	
	.python {
		global grate_color
		grate_color = (r/255, g/255, b/255, grate_color[3])
	}
}

method set.opacity(.2 a) {
	.javascript {
		var color = setting_color[setting_color.length-1];
		color[3] = (a.toJSNumber())/100;
		context.fillStyle = " rgba( "+color[0]+" , "+color[1]+" , "+color[2]+" , "+color[3]+") ";
	}
}

method set.angle(.2 deg) {
	.javascript {
		setting_angle = (deg.toJSNumber()/100)*Math.PI/180;
	}
	
	.python {
		global setting_angle
		setting_angle = deg/100
	}
}

method set.scale(.2 x, .2 y) {
	.javascript {
		setting_scalex = x.toJSNumber()/100;
		setting_scaley = y.toJSNumber()/100;
	}
}

method set.offset(.2 x, .2 y) {
	.javascript {
		setting_offsetx = x.toJSNumber()/1000;
		setting_offsety = y.toJSNumber()/1000;
	}
	
	.python {
		global setting_offsetx
		global setting_offsety
		setting_offsetx = x/100;
		setting_offsety = y/100;
	}
}
