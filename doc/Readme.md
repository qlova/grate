# API
This document outlines various features  
that the grate engine should support.  
Check the specific subfolders for in-depth documentation.

## Inputs
* **Keyboard**  

```
	if key.a()
		//The 'A' key is down.  
	end
	
	if key.shift()
		//The 'shift' key is down.
	end

	var pressed = keys.pressed() //List of key strings that have been pressed this frame.
```

* **Mouse**  

```
	if mouse.down(1)
		//The left mouse button is down. 
	end
	
	//Get the location of the mouse.
	var x = mouse.x() 
	var y = mouse.y()
```

* **Gamepads**  
	-- Buttons  
	-- Axises  
	-- Touchpad? (PS4)  
* **Touchscreen**  
	-- Singletouch  
	-- Multitouch  
* **Camera?**  
	-- Images  
	-- Video  
* **Accelerometer?**  
	
## Outputs
* **Shapes** (2D)  

```
	set.color(r, g, b)
	set.opacity(a)
	set.scale(w, h)
	set.offset(x, y)
	set.angle(r)

	circle(x, y, r)
	rectangle(x, y, w, h)
	oval(x, y, w, h)
	square(x, y, r)
	triangle(x, y, w, h, t)
```

* **Images**  

```
	//Images are loaded from the data directory.
	var test = image.load("test.png")
	
	set.color(r, g, b)
	set.opacity(a)
	set.scale(w, h)
	set.offset(x, y)
	set.angle(r)
	
	image.draw(test, x, y)

```

* **Sound**  
	-- Importing  
	-- Volume  
	-- Playing  
	-- Pausing  
	-- Stopping  
	
* **Video?**  
	-- Importing  
	-- Display  
		
	
## Logic
* **Collisions** (2D)  
	-- Rectangles  
	-- Squares  
	-- Circles  
	-- Ovals  
	-- Triangles  
	-- Polygons  

* **Motion**  
	-- Smooth.move  
		
* **Save/Load files**  
	-- Exporting  
	-- Loading  

* **Networking**  
	-- Lock-Step  




	
