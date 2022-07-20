import os
import sys
import pygame

# centered screen
os.environ["SDL_VIDEO_CENTERED"] = "1"

pygame.init()
pygame.display.set_caption("pysnake")

game_clock = pygame.time.Clock()
game_speed = 120

game_screen_width, game_screen_height = 640, 480
game_screen = pygame.display.set_mode((game_screen_width, game_screen_height))

game_running = True
game_bgcolor = 33, 66, 33

# square initial color
square_color = 33, 255, 33
square_color2 = 33, 192, 33

CELL_SIZE = 20
# a rectangle object by pygame module
square_rect = pygame.Rect(0, 0, CELL_SIZE, CELL_SIZE)
# relative movement direction
UP, DOWN, LEFT, RIGHT = (0, -1), (0, 1), (-1, 0), (1, 0)
square_direction = RIGHT

while game_running:

    # user control
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            game_running = False
        elif event.type == pygame.KEYDOWN:
            # up,down,left,right control
            if event.key == pygame.K_UP:
                square_direction = UP
            elif event.key == pygame.K_DOWN:
                square_direction = DOWN
            elif event.key == pygame.K_LEFT:
                square_direction = LEFT
            elif event.key == pygame.K_RIGHT:
                square_direction = RIGHT

    # update data

    square_rect = square_rect.move(square_direction)

    if square_rect.left < 0:
        square_rect.left = 0
    elif square_rect.right > game_screen_width:
        square_rect.right = game_screen_width
    if square_rect.top < 0:
        square_rect.top = 0
    elif square_rect.bottom > game_screen_height:
        square_rect.bottom = game_screen_height

    print(
        "coord: (%3d,%3d), speed: (%2d,%2d)"
        % (square_rect.x, square_rect.y, square_direction[0], square_direction[1])
    )

    # update graph
    game_screen.fill(game_bgcolor)
    # pygame.draw.rect(game_screen, square_color, square_rect)
    game_screen.fill(square_color, square_rect)
    pygame.display.flip()
    game_clock.tick(game_speed)


pygame.quit()
sys.exit(0)
