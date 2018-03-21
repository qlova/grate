.javascript {
	grate_Image = Image
	grate_images = [new grate_Image()]
}

type image {}

method image.load(""path) {
	
	.javascript {
		var name = ""
		for (var i = 0; i < path.length; i = i + 1) {
			name = name + String.fromCharCode(path[i])
		}
		grate_images.push(new grate_Image());
		grate_images[grate_images.length-1].src = "data/"+name
		
		stack.push(bigInt(grate_images.length-1));
		return;
	}
	
	return 0
}

method image.draw(pointer, x, y) {
	.javascript {
		var img = grate_images[pointer]
		
		var x = x.toJSNumber()/10-img.width/2
		var y = y.toJSNumber()/10-img.height/2
		
		context.save()
		context.translate(x, y)
		context.rotate(setting_angle)
		context.translate(-x, -y)
		context.scale(setting_scalex, setting_scaley)
		
		context.drawImage(img, x, y)
		context.restore()
	}
}

/*type Image {
	"" path
	x, y, r
}

.python grate_images = {}
.javascript grate_images = {}

.python {
def rot_center(image, rect, angle):
  \t  rot_image = pygame.transform.rotate(image, angle)
  \t  rot_rect = rot_image.get_rect(center=rect.center)
  \t  return rot_image,rot_rect
}
.go var op ebiten.DrawImageOptions

method draw(Image) {
	.python {
		img = grate_images[str(path)]
		img, s = rot_center(img, img.get_rect(), r/10)
		pygame.display.get_surface().blit(img, (x/10-s.w/2, y/10-s.h/2))
	}
	
	.go {
		var img = GrateImages[path.String()]
		var w, h = img.Size()
		op.GeoM.Reset()
		op.GeoM.Translate(float64(w)/2, float64(h)/2)
		op.GeoM.Translate(float64(x.ToInt()/10), float64(y.ToInt()/10))
		Screen.DrawImage(img, &op)
	}
	
	.java {
		int w = MainActivity.images.get(path.String()).getIntrinsicWidth()*2;
		int h =  MainActivity.images.get(path.String()).getIntrinsicHeight()*2;
		MainActivity . images . get ( path . String ( ) ) . setBounds ( 
				x . intValue ( ) / 10 - (int)(((float)w)*(.8)), 
				y . intValue ( ) / 10 - (int)(((float)h)*(.8)) ,
				x . intValue ( ) / 10 + (int)(((float)w)*(.8)) , 
				y . intValue ( ) / 10 + (int)(((float)h)*(.8)) 
		) ;
		MainActivity.images.get(path.String()).draw(MainActivity.canvas);
	}
	
	.qml {
		var name = ""
		for (var i = 0; i < path.length; i = i + 1) {
			name = name + String.fromCharCode(path[i])
		}
		var img = context.createImageData("assets/"+name)
		context.drawImage("assets/"+name, x/10-img.width/2, y/10-img.height/2)
	}
}

.go var GrateImages = make(map[string]*ebiten.Image)

method load(Image) "" {
	.python {
		filename = ""
		for i in range(0, len(path)):
			\t filename = filename + chr(path[i])
		grate_images[str(path)] = pygame.image.load("data/"+filename)
		grate_images[str(path)].convert()
	}
	
	.java MainActivity.loadImage(path.String());
	.go {
		var ps = path.String()
		var img, _, err = ebitenutil.NewImageFromFile(ps, ebiten.FilterNearest)
		if err == nil {
			GrateImages[ps] = img
		} else {
			stack.ERROR = NewNumber(1)
		}
	}
	
	.qml {
		var name = ""
		for (var i = 0; i < path.length; i = i + 1) {
			name = name + String.fromCharCode(path[i])
		}
		loadImage("assets/"+name)
	}

	return ""
}*/
