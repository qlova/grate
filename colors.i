.python grate_color = (255, 255, 255, 255)

type Color {
	r, g, b, a
}

function fill(r, g, b, a) {
	.python global grate_color
	.python grate_color = (r, g, b, 255-a)
}

method set(Color) {
	.python global grate_color
	var R = r
	var G = g
	var B = b
	var A = a	
	
	.go {
		op.ColorM.Reset()
		op.ColorM.Translate(
			-float64(255-R.ToInt())*(1.0/255), 
			-float64(255-G.ToInt())*(1.0/255), 
			-float64(255-B.ToInt())*(1.0/255), 
			-float64(A.ToInt())*(1.0/255),
		)
	}
	
	.python grate_color = (R, G, B, 255-A)
	
	.java MainActivity . paint . setColor ( MainActivity . rgb ( R.intValue() , G.intValue() , B.intValue(), 255 - A.intValue() ) ) ;

	.javascript context.fillStyle = " rgba( "+R+" , "+G+" , "+B+" , "+(255-A.toJSNumber())+" ) "
	.qml context.fillStyle = "rgba("+R+", "+G+", "+B+", "+(255-A.toJSNumber())+")"
}
