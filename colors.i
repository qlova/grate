
type color {}

method color.red() {
	set.color(255, 0, 0)
}

method color.green() {
	set.color(0, 255, 0)
}

method color.blue() {
	set.color(0, 0, 255)
}

/*method set(Color) {
	.go {
		op.ColorM.Reset()
		op.ColorM.Translate(
			-float64(255-R.ToInt())*(1.0/255), 
			-float64(255-G.ToInt())*(1.0/255), 
			-float64(255-B.ToInt())*(1.0/255), 
			-float64(A.ToInt())*(1.0/255),
		)
	}
	
	.java MainActivity . paint . setColor ( MainActivity . rgb ( R.intValue() , G.intValue() , B.intValue(), 255 - A.intValue() ) ) ;

	.qml context.fillStyle = "rgba("+R+", "+G+", "+B+", "+(255-A.toJSNumber())+")"
}*/
