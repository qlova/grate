.python grate_font = None

type Text {
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
	
	.javascript {
		var name = ""
		for (var i = 0; i < Txt.length; i = i + 1) {
			name = name + String.fromCharCode(Txt[i])
		}
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
