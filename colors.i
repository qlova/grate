.python grate_color = (255, 255, 255, 255)

type Color {
	r, g, b, a
}

method set(Color) {
	.python global grate_color
	var R = r
	var G = g
	var B = b
	var A = a	
	
	.python grate_color = (R, G, B, 255-A)
	
	.java MainActivity . paint . setColor ( MainActivity . rgb ( R.intValue() , G.intValue() , B.intValue(), 255 - A.intValue() ) ) ;

	.javascript context.fillStyle = " rgba( "+R+" , "+G+" , "+B+" , "+(255-A.toJSNumber())+" ) "
	.qml context.fillStyle = "rgba("+R+", "+G+", "+B+", "+(255-A.toJSNumber())+")"
}
