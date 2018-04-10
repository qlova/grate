type set {}

.javascript {
	setting_color = []
	setting_color.push([255, 255, 255, 1])
	setting_color.push([255, 255, 255, 1])
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
	setting_scalex = 1
	setting_scaley = 1
	setting_angle = 0
	grate_color = (255, 255, 255, 1)
}

method set.defaults() {
	.android {
		MainActivity.setting_angle = 1;
		MainActivity.setting_offsetx = 0;
		MainActivity.setting_offsety = 0;
	}

	.javascript {
		var last = setting_color[setting_color.length-2]
		setting_color[setting_color.length-1] = [last[0], last[1], last[2], 1]
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
		global setting_scalex
		global setting_scaley
		
		setting_offsetx = 0
		setting_offsety = 0
		setting_angle = 0
		setting_scalex = 1
		setting_scaley = 1
	}
}

method set.environment() {
	.android {
		MainActivity.canvas.save();
		MainActivity.canvas.translate(MainActivity.setting_offsetx, MainActivity.setting_offsety);
		MainActivity.canvas.rotate(MainActivity.setting_angle);
	}

	.javascript {
		context.save();
		var last = setting_color[setting_color.length-2];
		setting_color.push([last[0], last[1], last[2], last[3]]);
		context.translate(setting_offsetx, setting_offsety);
		context.rotate(setting_angle);
		context.scale(setting_scalex, setting_scaley)
		var color = setting_color[setting_color.length-2];
		context.fillStyle = " rgba( "+color[0]+" , "+color[1]+" , "+color[2]+" , "+color[3]+") ";
	}
	
	.python {
		glPushMatrix()
		
		glTranslatef(setting_offsetx, setting_offsety, 0)
		glRotatef(setting_angle, 0, 0, 1.0)
		glScalef(setting_scalex, setting_scaley, 1)
	}
	
	set.defaults()
}

method set.decay() {
	.android {
		MainActivity.canvas.restore();
	}

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
	.android {
		MainActivity.paint.setColor(MainActivity.rgb(r.intValue(), g.intValue(), b.intValue()));
	}

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

method set.opacity(a) {
	.javascript {
		var color = setting_color[setting_color.length-1];
		color[3] = (a.toJSNumber())*(1.0/255);
		context.fillStyle = " rgba( "+color[0]+" , "+color[1]+" , "+color[2]+" , "+color[3]+") ";
	}
	
	.python {
		global grate_color
		grate_color = (grate_color[0], grate_color[1], grate_color[2], a/255)
	}
}

method set.angle(.2 deg) {
	.android {
		MainActivity.setting_angle = (float)(deg.intValue())/100;
	}

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
	
	.python {
		global setting_scalex
		global setting_scaley
		setting_scalex = x/100;
		setting_scaley = y/100;
	}
}

method set.offset(.2 x, .2 y) {
	.android {
		MainActivity.setting_offsetx = ((float)x.intValue())/1000;
		MainActivity.setting_offsety = ((float)y.intValue())/1000;
	}

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
