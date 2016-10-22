type Image {
	"" path
	x, y
}

.python grate_images = {}

method draw() {
	var p = path
	var X = x
	var Y = y
	.python {
		img = grate_images[str(p)]
		r = img.get_rect()
		pygame.display.get_surface().blit(img, (X/10-r.w/2, Y/10-r.h/2))
	}
	
	.java {
		int w = MainActivity.images.get(p.String()).getIntrinsicWidth();
		int h =  MainActivity.images.get(p.String()).getIntrinsicHeight();
		MainActivity.images.get(p.String()).setBounds(X.intValue()/10 - w/2, Y.intValue()/10 - h/2,
				X.intValue()/10 + w/2, Y.intValue()/10 + h/2);
		MainActivity.images.get(p.String()).draw(MainActivity.canvas);
	}
}

method load() "" {
	print("loading")
	var p = path
	.python {
		filename = ""
		for i in range(0, len(p)):
			\t filename = filename + chr(p[i])
		grate_images[str(p)] = pygame.image.load(filename)
		grate_images[str(p)].convert()
	}
	
	.java MainActivity.loadImage(p.String());

	return ""
}
