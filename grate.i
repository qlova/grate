.go import "github.com/hajimehoshi/ebiten"
.go import "github.com/hajimehoshi/ebiten/ebitenutil"
.go import "github.com/hajimehoshi/ebiten/examples/common"
.go import "image/color"

import shapes
import images
import text
import colors
import mouse

.python import pygame
.python import sys
.python import math
.python import pygame.gfxdraw
.python from pygame.locals import *

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
	.python {
		keys=pygame.key.get_pressed()
		if keys[K_LEFT] or keys[K_a]:
		\t stack.push(1)
		\t return
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
	.python {
		keys=pygame.key.get_pressed()
		if keys[K_RIGHT] or keys[K_d]:
		\t stack.push(1)
		\t return
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
	.python {
		keys=pygame.key.get_pressed()
		if keys[K_SPACE]:
		\t stack.push(1)
		\t return
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
	.python {
		keys=pygame.key.get_pressed()
		if keys[K_DOWN] or keys[K_s]:
		\t stack.push(1)
		\t return
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
	.python {
		keys=pygame.key.get_pressed()
		if keys[K_UP] or keys[K_w]:
		\t stack.push(1)
		\t return
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
	
	.python n = pygame.display.get_surface().get_width()*10
	
	.java n = new Stack.Number(MainActivity.canvas.getWidth()*10);
	
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
	
	.python n = pygame.display.get_surface().get_height()*10
	
	.java n = new Stack.Number(MainActivity.canvas.getHeight()*10);
	
	.lua n = bigint(love.graphics.getHeight()*10)
	
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
	
	.python global grate_dt
	.python n = int(grate_dt*10)
	
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
		game = Game(stack)
	end
	
	function love.update()
		game_m_update(stack)
	end
	
	function love.draw()
		game_m_draw(stack)
	end
}

.python grate_dt = 0

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

function grate() {

	.go {
	
		Game(stack)
		new_m_Game(stack)
		var game = stack.Grab()
	
		ebiten.Run(func (screen *ebiten.Image) error {
			Screen = screen
			
			stack.Share(game)
			update_m_Game(stack)
			if ebiten.IsRunningSlowly() {
				return nil
			}
			stack.Share(game)
			draw_m_Game(stack)
			
			return nil
		}, 800, 600, 1, "Game")
	}

	.javascript {
		canvas = document.createElement("canvas");
		canvas.id     = "Game";
		canvas.width  = window.innerWidth;
		canvas.height = window.innerHeight;
		context = canvas.getContext("2d");
		document.body.appendChild(canvas);
		grate_height = canvas.height*10
		grate_width  = canvas.width*10

		window.onkeydown=function(e){
			 e = e
			 grate_keys[e.keyCode] = true;
		}

		window.onkeyup=function(e){
			 e = e
			 delete grate_keys[e.keyCode];
		}
		
		Game(stack)
		new_m_Game(stack)
		game = stack.grab()
		
		var prevTime = curTime;
		var curTime = (new Date()).getTime();
		
		var FPS = 60
		setInterval(function() {
			//context.fillStyle = "rgb( 0 , 0 , 0 ) "
			context.fillRect(0, 0, canvas.width, canvas.height);
			
			prevTime = curTime;
			curTime = (new Date()).getTime();
			grate_dt = curTime - prevTime;
			
			stack.share(game)
			update_m_Game(stack)
			stack.share(game)
			draw_m_Game(stack)
		}, 1000/FPS)
	}

	.python {
		global grate_dt
		global grate_font
		
		pygame.init()
		pygame.font.init()
		windowSurface = pygame.display.set_mode((800, 600), 0, 32)
		pygame.display.set_caption("Grate Game")
		
		grate_font = pygame.font.SysFont("monospace", 20)
		
		Game(stack)
		new_m_Game(stack)
		game = stack.grab()
		
		clock = pygame.time.Clock()
		
		# run the game loop
		while True:
			\t pygame.display.get_surface().fill(grate_color)
			\t stack.share(game)
			\t update_m_Game(stack)
			\t stack.share(game)
			\t draw_m_Game(stack)
			\t pygame.display.update()
			\t grate_dt = clock.tick(60)
		
			\t for event in pygame.event.get():
				\t\t if event.type == QUIT:
				    \t\t\t pygame.quit()
				    \t\t\t sys.exit()
	}
}
