.javascript grate_Image = Image

type Image {
	"" path
	x, y
}

.python grate_images = {}
.javascript grate_images = {}

.go var op ebiten.DrawImageOptions

method draw(Image) {
	var p = path
	var X = x
	var Y = y
	.python {
		img = grate_images[str(p)]
		r = img.get_rect()
		pygame.display.get_surface().blit(img, (X/10-r.w/2, Y/10-r.h/2))
	}
	
	.go {
		var img = GrateImages[p.String()]
		var w, h = img.Size()
		op.GeoM.Reset()
		op.GeoM.Translate(float64(w)/2, float64(h)/2)
		op.GeoM.Translate(float64(X.ToInt()/10), float64(Y.ToInt()/10))
		Screen.DrawImage(img, &op)
	}
	
	.java {
		int w = MainActivity.images.get(p.String()).getIntrinsicWidth();
		int h =  MainActivity.images.get(p.String()).getIntrinsicHeight();
		MainActivity . images . get ( p . String ( ) ) . setBounds ( 
				X . intValue ( ) / 10 - (int)(((float)w)*(.8)), 
				Y . intValue ( ) / 10 - (int)(((float)h)*(.8)) ,
				X . intValue ( ) / 10 + (int)(((float)w)*(.8)) , 
				Y . intValue ( ) / 10 + (int)(((float)h)*(.8)) 
		) ;
		MainActivity.images.get(p.String()).draw(MainActivity.canvas);
	}
	
	.javascript {
		var img = grate_images[p]
		context.drawImage(img, X/10-img.width/2, Y/10-img.height/2)
	}
	
	.qml {
		var name = ""
		for (var i = 0; i < p.length; i = i + 1) {
			name = name + String.fromCharCode(p[i])
		}
		var img = context.createImageData("assets/"+name)
		context.drawImage("assets/"+name, X/10-img.width/2, Y/10-img.height/2)
	}
}

.go var GrateImages = make(map[string]*ebiten.Image)

method load(Image) "" {
	var p = path
	.python {
		filename = ""
		for i in range(0, len(p)):
			\t filename = filename + chr(p[i])
		grate_images[str(p)] = pygame.image.load("data/"+filename)
		grate_images[str(p)].convert()
	}
	
	.go {
		var ps = p.String()
		var img, _, err = ebitenutil.NewImageFromFile(ps, ebiten.FilterNearest)
		if err == nil {
			GrateImages[ps] = img
		} else {
			stack.ERROR = NewNumber(1)
		}
	}
	
	.java MainActivity.loadImage(p.String());
	
	.javascript {
		var name = ""
		for (var i = 0; i < p.length; i = i + 1) {
			name = name + String.fromCharCode(p[i])
		}
		grate_images[p] = new grate_Image();
		grate_images[p].src = "data/"+name
	}
	
	.qml {
		var name = ""
		for (var i = 0; i < p.length; i = i + 1) {
			name = name + String.fromCharCode(p[i])
		}
		loadImage("assets/"+name)
	}

	return ""
}
