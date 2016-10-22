import shapes
import images
import text
import colors

.python import pygame
.python import sys
.python import pygame.gfxdraw
.python from pygame.locals import *

function draw() {

}

function update() {

}

function left() n {
	.java {
		if (MainActivity.getInput(-1)) {
			stack.push(new Stack.Number(1));
			return;
		}
	}
	.python {
		keys=pygame.key.get_pressed()
		if keys[K_LEFT] or keys[K_a]:
		\t stack.push(1)
		\t return
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
	.python {
		keys=pygame.key.get_pressed()
		if keys[K_RIGHT] or keys[K_d]:
		\t stack.push(1)
		\t return
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
	.python {
		keys=pygame.key.get_pressed()
		if keys[K_SPACE]:
		\t stack.push(1)
		\t return
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
	.python {
		keys=pygame.key.get_pressed()
		if keys[K_DOWN] or keys[K_s]:
		\t stack.push(1)
		\t return
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
	.python {
		keys=pygame.key.get_pressed()
		if keys[K_UP] or keys[K_w]:
		\t stack.push(1)
		\t return
	}
	return false
}

function width() n {
	var n = 0
	
	.python n = pygame.display.get_surface().get_width()*10
	
	.java n = new Stack.Number(MainActivity.canvas.getWidth()*10);
	
	.lua n = bigint(love.graphics.getWidth()*10)
	
	return n
}

function height() n {
	var n = 0
	
	.python n = pygame.display.get_surface().get_height()*10
	
	.java n = new Stack.Number(MainActivity.canvas.getHeight()*10);
	
	.lua n = bigint(love.graphics.getHeight()*10)
	
	return n

}

function delta() n {
	var n = 0
	
	.python global grate_dt
	.python n = int(grate_dt*10)
	
	.java n = new Stack.Number(MainActivity.delta());
	
	return n
}

.lua {
	local game;

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

function grate() {

	.python {
		global grate_dt
		global grate_font
		
		pygame.init()
		pygame.font.init()
		windowSurface = pygame.display.set_mode((800, 600), 0, 32)
		pygame.display.set_caption("Grate Game")
		
		grate_font = pygame.font.SysFont("monospace", 20)
		
		Game(stack)
		game = stack.grab()
		
		clock = pygame.time.Clock()
		
		# run the game loop
		while True:
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
