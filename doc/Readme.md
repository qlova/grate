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
	-- Rectangles  
	-- Squares  
	-- Circles  
	-- Ovals  
	-- Triangles  
	-- Polygons  

* **Images**  
	-- Importing  
	-- Scaling/Stretching  
	-- Rotation  
	-- Tinting  
	-- Opacity  
	-- Drawing  

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




	
