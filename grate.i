.go import "github.com/hajimehoshi/ebiten"
.go import "github.com/hajimehoshi/ebiten/ebitenutil"
.go import "github.com/hajimehoshi/ebiten/examples/common"
.go import "image/color"

.python import pyglet
.python import sys
.python import math
.python from pyglet.gl import *
.python from pyglet.window import key

.python {
	game = None
	window = pyglet.window.Window(fullscreen=True)
	grate_keys = key.KeyStateHandler()
	window.push_handlers(grate_keys)
	fps_display = pyglet.window.FPSDisplay(window)

	@window.event
	def on_draw():
		\t glClearColor(0, 0, 0, 1)
		\t glClear(GL_COLOR_BUFFER_BIT)
		
		\t glMatrixMode(GL_PROJECTION)
		\t glLoadIdentity()
		\t glOrtho(0.0, window.width, window.height, 1.0, -1.0, 1.0)
		\t glMatrixMode(GL_MODELVIEW)
		\t glLoadIdentity()
		
		\t glMatrixMode(GL_MODELVIEW)
		\t glLoadIdentity()
		\t glScalef(0.1, 0.1, 0.1)
		
		\t glEnable(GL_BLEND)
		\t glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
		
		\t stack.share(game)
		\t draw_m_Graphics(stack)
		
		\t fps_display.draw()
		
	def on_update(value):
		#Probably need to do some connection filtering here.
		\t stack.share(game)
		\t update_m_Graphics(stack)
}

import set
import shapes
import images
import text
import colors
import mouse
import keys
import keyboard
import gamepad

plugin Graphics {
	{Keyboard} keys
}

.qml var grate_left   = false
.qml var grate_right  = false
.qml var grate_up     = false
.qml var grate_down   = false
.qml var grate_action = false

function left() n {
	.java {
		if (MainActivity.getInput(-1)) {
			stack.push(new Stack.Number(1));
			return;
		}
	}
	.javascript {
		if (grate_keys[37]) {
			stack.push(bigInt.one)
			return;
		}
	}
	.qml {
		if (grate_left) {
			stack.push(bigInt.one)
			return
		}
	}
	.go {
		if (ebiten.IsKeyPressed(ebiten.KeyLeft)) {
			stack.Push(NewNumber(1))
			return
		}
	}
	return false
}

function right() n {
	.java {
		if (MainActivity.getInput(1)) {
			stack.push(new Stack.Number(1));
			return;
		}
	}
	.javascript {
		if (grate_keys[39]) {
			stack.push(bigInt.one)
			return;
		}
	}
	.qml {
		if (grate_right) {
			stack.push(bigInt.one)
			return
		}
	}
	.go {
		if (ebiten.IsKeyPressed(ebiten.KeyRight)) {
			stack.Push(NewNumber(1))
			return
		}
	}
	return false
}

function action() n {
	.java {
		if (MainActivity.getInput(0)) {
			stack.push(new Stack.Number(1));
			return;
		}
	}
	.javascript {
		if (grate_keys[32]) {
			stack.push(bigInt.one)
			return;
		}
	}
	.qml {
		if (grate_action) {
			stack.push(bigInt.one)
			return
		}
	}
	.go {
		if (ebiten.IsKeyPressed(ebiten.KeySpace)) {
			stack.Push(NewNumber(1))
			return
		}
	}
	return false
}

function down() n {
	.java {
		if (MainActivity.getInput(2)) {
			stack.push(new Stack.Number(1));
			return;
		}
	}
	.javascript {
		if (grate_keys[40]) {
			stack.push(bigInt.one)
			return;
		}
	}
	.qml {
		if (grate_down) {
			stack.push(bigInt.one)
			return
		}
	}
	.go {
		if (ebiten.IsKeyPressed(ebiten.KeyDown)) {
			stack.Push(NewNumber(1))
			return
		}
	}
	return false
}

function up() n {
	.java {
		if (MainActivity.getInput(-2)) {
			stack.push(new Stack.Number(1));
			return;
		}
	}
	.javascript {
		if (grate_keys[38]) {
			stack.push(bigInt.one)
			return;
		}
	}
	.qml {
		if (grate_up) {
			stack.push(bigInt.one)
			return
		}
	}
	.go {
		if (ebiten.IsKeyPressed(ebiten.KeyUp)) {
			stack.Push(NewNumber(1))
			return
		}
	}
	return false
}

function width() n {
	var n = 0
	
	.java n = new Stack.Number(MainActivity.canvas.getWidth()*10);
	
	.python n = window.width*10
	
	.lua n = bigint(love.graphics.getWidth()*10)
	
	.javascript n = bigInt(grate_width)
	.qml n = bigInt(grate_width)
	
	.go {
		var w, _ = Screen.Size()
		n = NewNumber(w)
	}
	
	return n
}

function height() n {
	var n = 0
	
	.java n = new Stack.Number(MainActivity.canvas.getHeight()*10);
	
	.lua n = bigint(love.graphics.getHeight()*10)
	
	.python n = window.height*10
	
	.javascript n = bigInt(grate_height)
	.qml n = bigInt(grate_height)
	
	.go {
		var _, h = Screen.Size()
		n = NewNumber(h)
	}
	
	return n

}

function delta() n {
	var n = 0
	
	.java n = new Stack.Number(MainActivity.delta());
	.javascript n = bigInt(grate_dt*10)
	.qml n = bigInt(grate_dt)
	
	.go n = NewNumber(166)
	
	return n
}

.lua {
	local game;
	local stack = NewStack();

	function love.load()
		game = Graphics(stack)
	end
	
	function love.update()
		game_m_update(stack)
	end
	
	function love.draw()
		game_m_draw(stack)
	end
}

function clear() {
	.java MainActivity.canvas.drawPaint(MainActivity.paint);
   	.python pygame.display.get_surface().fill(grate_color)
}

.javascript context = null
.javascript grate_width  = 0
.javascript grate_height = 0
.javascript grate_dt = 0
.javascript grate_keys = {}

.qml var context = null
.qml var grate_width = 0
.qml var grate_height = 0
.qml var grate_dt = 0

.go var Screen *ebiten.Image

.javascript grate_fullscreen = false

function fullscreen() {
	.python {
		window.set_fullscreen(True)
	}
	
	.javascript {
		grate_fullscreen = true
	}
}

function windowed() {
	.python {
		window.set_fullscreen(False)
	}
	.javascript {
		grate_fullscreen = false
	}
}

function size(w, h) {
	.python {
		window.width = int(w/10)
		window.height = int(h/10)
	}
	
	.javascript {
		canvas.width  = w.toJSNumber()/10;
		canvas.height = h.toJSNumber()/10;
		grate_height = canvas.height*10;
		grate_width  = canvas.width*10;
	}
}

function grate() {
	
	//Need to globalise the connection.

	.go {
	
		Graphics(stack)
		new_m_Graphics(stack)
		var game = stack.Grab()
	
		ebiten.Run(func (screen *ebiten.Image) error {
			Screen = screen
			
			stack.Share(game)
			update_m_Graphics(stack)
			if ebiten.IsRunningSlowly() {
				return nil
			}
			stack.Share(game)
			draw_m_Graphics(stack)
			
			return nil
		}, 800, 600, 1, "Graphics")
	}

	.javascript {
		(function(){var script=document.createElement("script");script.onload=function(){var stats=new Stats();document.body.appendChild(stats.dom);requestAnimationFrame(function loop(){stats.update();requestAnimationFrame(loop)});};script.src="//rawgit.com/mrdoob/stats.js/master/build/stats.min.js";document.head.appendChild(script);})()
		
		canvas = document.createElement("canvas");
		canvas.id     = "Graphics";
		canvas.width  = window.innerWidth;
		canvas.height = window.innerHeight;
		
		context = canvas.getContext("2d");
		document.body.appendChild(canvas);
		
		grate_height = canvas.height*10
		grate_width  = canvas.width*10
		
		function requestFullScreen(element) {
			// Supports most browsers and their versions.
			var requestMethod = element.requestFullScreen || element.webkitRequestFullScreen || element.mozRequestFullScreen || element.msRequestFullScreen;

			if (requestMethod) { // Native full screen.
				requestMethod.call(element);
			} else if (typeof window.ActiveXObject !== "undefined") { // Older IE.
				var wscript = new ActiveXObject("WScript.Shell");
				if (wscript !== null) {
					wscript.SendKeys("{F11}");
				}
			}
		}

		window.onkeydown=function(e){
			 e = e
			 grate_keys[e.keyCode] = true;
			if (grate_fullscreen) {
				requestFullScreen(canvas)
			}
		}

		window.onkeyup=function(e){
			 e = e
			 delete grate_keys[e.keyCode];
		}
		
		Graphics(stack)
		new_m_Graphics(stack)
		game = stack.grab()
		
		var prevTime = curTime;
		var curTime = (new Date()).getTime();

		var FPS = 60
		setInterval(function() {
			prevTime = curTime;
			curTime = (new Date()).getTime();
			grate_dt = curTime - prevTime;
			
			stack.share(game)
			update_m_Graphics(stack)
			
			scroll_X = 0
			scroll_Y = 0
		}, 1000/FPS)
		
		var draw = function() {
			requestAnimationFrame(draw)
			
			if (grate_fullscreen) {
				canvas.width  = window.innerWidth;
				canvas.height = window.innerHeight;
				grate_height = canvas.height*10
				grate_width  = canvas.width*10
			}
			
			context.fillStyle = " rgba(0, 0, 0, 255) "
			context.fillRect(0, 0, canvas.width, canvas.height);
			context.fillStyle = " rgba(255, 255, 255, 255) "
			
			stack.share(game)
			draw_m_Graphics(stack)

		}
		draw()
	}

	.python {
		global game
		
		Graphics(stack)
		new_m_Graphics(stack)
		game = stack.grab()
		
		pyglet.clock.schedule_interval(on_update, 1/60.0)
		pyglet.app.run()
		
	}
}
