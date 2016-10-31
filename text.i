.python grate_font = None

type Text {
	""txt
	x, y
}

method draw(Text) {
	var X = x
	var Y = y
	var Txt = txt
	
	.python {
		t = ""
		for i in range(0, len(Txt)):
			\t t = t + chr(Txt[i])
		label = grate_font.render(t, 0, grate_color)
		label.set_alpha(grate_color[3])
		pygame.display.get_surface().blit(label, (X/10, Y/10))
	}
	
	.java MainActivity.canvas.drawText(Txt.String(), X.intValue()/10, Y.intValue()/10+MainActivity.paint.getTextSize(), MainActivity.paint);
	
	.javascript {
		var name = ""
		for (var i = 0; i < Txt.length; i = i + 1) {
			name = name + String.fromCharCode(Txt[i])
		}
		//console.log()
		context.fillStyle = "rgb( 255 , 255 , 255 ) "
		context.fillText(name, X/10, Y/10+parseInt(context.font.split(" ")[0].split("px")[0]));
	}
	
	.qml {
		var name = ""
		for (var i = 0; i < Txt.length; i = i + 1) {
			name = name + String.fromCharCode(Txt[i])
		}
		//console.log()
		context.fillStyle = "rgb( 255 , 255 , 255 ) "
		context.fillText(name, X/10, Y/10+parseInt(context.font.split(",5")[0].split(",-1,")[1]));
	}
}
