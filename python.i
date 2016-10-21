.python import pygame
.python import sys
.python from pygame.locals import *

function left() n {
	.python {
		keys=pygame.key.get_pressed()
		if keys[K_LEFT] or keys[K_a]:
		\t stack.push(1)
		\t return
	}
	return false
}

function right() n {
	.python {
		keys=pygame.key.get_pressed()
		if keys[K_RIGHT] or keys[K_d]:
		\t stack.push(1)
		\t return
	}
	return false
}

function space() n {
	.python {
		keys=pygame.key.get_pressed()
		if keys[K_SPACE]:
		\t stack.push(1)
		\t return
	}
	return false
}

function down() n {
	.python {
		keys=pygame.key.get_pressed()
		if keys[K_DOWN] or keys[K_s]:
		\t stack.push(1)
		\t return
	}
	return false
}

function up() n {
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
	return n
}

function height() n {
	var n = 0
	.python n = pygame.display.get_surface().get_height()*10
	return n

}

function grate({}game) {
	.python {
		pygame.init()
		windowSurface = pygame.display.set_mode((800, 600), 0, 32)
		pygame.display.set_caption("Grate Game")
		
		# run the game loop
		while True:
			\t windowSurface.fill((0, 0, 0))
			\t stack.share(game)
			\t update_m_Game(stack)
			\t stack.share(game)
			\t draw_m_Game(stack)
			\t pygame.display.update()
		
			\t for event in pygame.event.get():
				\t\t if event.type == QUIT:
				    \t\t\t pygame.quit()
				    \t\t\t sys.exit()
	}
}
