.python grate_font = None

type Text {
	""txt
	x, y
}

method draw() {
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
}
