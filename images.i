.javascript grate_Image = Image

type Image {
	"" path
	x, y, r
}

.python grate_images = {}
.javascript grate_images = {}

.python {
def rot_center(image, rect, angle):
  \t  """rotate an image while keeping its center"""
  \t  rot_image = pygame.transform.rotate(image, angle)
  \t  rot_rect = rot_image.get_rect(center=rect.center)
  \t  return rot_image,rot_rect
}

method draw(Image) {
	.python {
		img = grate_images[str(path)]
		img, s = rot_center(img, img.get_rect(), r/10)
		pygame.display.get_surface().blit(img, (x/10-s.w/2, y/10-s.h/2))
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
	
	.javascript {
		var img = grate_images[path]
		context.drawImage(img, x/10-img.width/2, y/10-img.height/2)
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

method load(Image) "" {
	.python {
		filename = ""
		for i in range(0, len(path)):
			\t filename = filename + chr(path[i])
		grate_images[str(path)] = pygame.image.load("data/"+filename)
		grate_images[str(path)].convert()
	}
	
	.java MainActivity.loadImage(path.String());
	
	.javascript {
		var name = ""
		for (var i = 0; i < path.length; i = i + 1) {
			name = name + String.fromCharCode(path[i])
		}
		grate_images[path] = new grate_Image();
		grate_images[path].src = "../data/"+name
	}
	
	.qml {
		var name = ""
		for (var i = 0; i < path.length; i = i + 1) {
			name = name + String.fromCharCode(path[i])
		}
		loadImage("assets/"+name)
	}

	return ""
}
