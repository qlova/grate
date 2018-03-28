.python {
	grate_font = None
	grate_label = pyglet.text.Label("", font_name="Times New Roman",font_size=36,x=0, y=0, anchor_y="top")
}



function display(""txt, x, y) {
	.javascript {
	
		var x = x.toJSNumber()/10
		var y = y.toJSNumber()/10
		
		context.save()
		context.translate(x, y)
		context.rotate(setting_angle)
		context.translate(-x, -y)
		
		console.log(setting_scalex, setting_scaley)
		context.scale(setting_scalex, setting_scaley)
	
		var name = ""
		for (var i = 0; i < txt.length; i = i + 1) {
			name = name + String.fromCharCode(txt[i])
		}
		context.fillText(name, x, y+parseInt(context.font.split(" ")[0].split("px")[0]));
		
		context.restore()
	}
	
	.python {
		glPushMatrix()
		glScalef(10.0, -10.0, 1.0)
		glTranslatef(x/10, y/10, 1.0)
		t = ""
		for i in range(0, len(txt)):
			\t t = t + chr(txt[i])
		grate_label.text = t
		grate_label.draw()
		glPopMatrix()
	}
}

/*type Text {
	""txt
	x, y
}

.go var GrateText = make(map[string]*ebiten.Image)

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
	
	.go {
	
		var data = txt.String()
		var img, ok = GrateText[data]
		
		if !ok {
			
			var w, h = common.ArcadeFont.TextWidth(data), common.ArcadeFont.TextHeight(data)
			img, _ = ebiten.NewImage(w, h, ebiten.FilterNearest)
		
			common.ArcadeFont.DrawText(img, data, 0, 0, 1, color.White)
		
			GrateText[data] = img
		}
		
		op.GeoM.Reset()
		op.GeoM.Translate(float64(X.ToInt()/10), float64(Y.ToInt()/10))
		Screen.DrawImage(img, &op)
	}
	
	.java MainActivity.canvas.drawText(Txt.String(), X.intValue()/10, Y.intValue()/10+MainActivity.paint.getTextSize(), MainActivity.paint);
	
	.qml {
		var name = ""
		for (var i = 0; i < Txt.length; i = i + 1) {
			name = name + String.fromCharCode(Txt[i])
		}
		//console.log()
		context.fillStyle = "rgb( 255 , 255 , 255 ) "
		context.fillText(name, X/10, Y/10+parseInt(context.font.split(",5")[0].split(",-1,")[1]));
	}
}*/
