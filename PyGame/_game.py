"""
By: Amirhossein Ardalan
Student Number:
Date: 10/11/2014
last Modified: 20/11/2014
Filename: Monster.py
Assignment No.8
"""

from __future__ import print_function
from __future__ import division
import random
import sys
import pygame

RED = (255, 0, 0)
WHITE = (255, 255, 255)


class MyGame(object):
    def __init__(self):

        pygame.init()

        # 30 frames per second
        self.FPS = 30

        pygame.mixer.init()
        # pygame.mixer.pre_init(44100, -16, 2, 2048)

        # setting up screen width and height
        self.WIDTH = 800
        self.HEIGHT = 600

        # loading soundtrack
        # Source: http://downloads.khinsider.com/game-soundtracks/album/4-elements/journey.mp3
        pygame.mixer.music.load('journey.mp3')
        pygame.mixer.music.play(-1, 0.0)

        # loading sound effect
        # Source: gamedemo.zip by Prof. Patrick Morin-COMP1405
        self.SOUND = pygame.mixer.Sound('snap.wav')

        # setting up screen
        self.bg_color = (22, 44, 55, 220)
        self.SCREEN = pygame.display.set_mode((self.WIDTH, self.HEIGHT))
        self.SCREEN_TITLE = pygame.display.set_caption('*** Monster Game ***')
        self.SCREEN_icon = pygame.display.set_icon(pygame.image.load('gameicon.png'))

        # setting up the font
        self.SCREEN_font = pygame.font.Font('Ubuntu-M.ttf', 20)

        # Rendering 'lose' situation
        self.GAMEOVER_Display = self.SCREEN_font.render("You lose!", True, RED)
        # GAMEOVER_rect = GAMEOVER_Display.get_rect()

        # Rendering 'Win' situation
        self.WIN_Display = self.SCREEN_font.render("You Won!", True, WHITE)
        # WIN_rect = WIN_Display.get_rect()

        # Rendering score
        self.SCORE_Display = self.SCREEN_font.render("Score:", True, RED)
        self.LOCATION_Display = self.SCREEN_font.render("Your Position:", True, RED)

        # SCORE_rect = SCORE_Display.get_rect()

        # Loading image
        self.PRE_SCALED_MONSTER_IMG = pygame.image.load('Purple_Monster.png')
        self.MONSTER_IMG = pygame.transform.scale(self.PRE_SCALED_MONSTER_IMG, (100, 100))
        self.MONSTER_FLIPPED = pygame.transform.flip(self.MONSTER_IMG, True, False)

        # loading another image
        self.PRE_SCALED_MONSTER_IMG_2 = pygame.image.load('Green_Monster.png')
        self.MONSTER_IMG_2 = pygame.transform.scale(self.PRE_SCALED_MONSTER_IMG_2, (100, 100))
        self.MONSTER_FLIPPED_2 = pygame.transform.flip(self.MONSTER_IMG_2, True, False)

        # The moving monster
        self.MONSTER_X = 0
        self.MONSTER_Y = 0
        self.MONSTER_SPEED = 10

        # the target monster
        self.MONSTER_2_X = (random.randrange(700))
        self.MONSTER_2_Y = (random.randrange(500))

        # Master event
        self.Master_event = pygame.USEREVENT + 1
        pygame.time.set_timer(self.Master_event, 1000 // self.FPS)

        self.movLeft = False
        self.movRight = False
        self.movUp = False
        self.movDown = False

        self.COLLIDED = False
        self.score = 0
        self.position = 0

        self.run()

    def run(self):

        while True:

            keys = pygame.key.get_pressed()
            event = pygame.event.wait()
            if event.type == pygame.QUIT or event.type == pygame.KEYDOWN and event.key == pygame.K_ESCAPE:
                sys.exit()

            # Go right
            if keys[pygame.K_d]:
                if keys[pygame.K_SPACE]:
                    self.movRight = True
                    self.MONSTER_X += 3 * self.MONSTER_SPEED
                    print("going right")
                else:
                    self.movRight = True
                    self.MONSTER_X += self.MONSTER_SPEED
                    print("slow right")
                self.draw()
            # Go up
            if keys[pygame.K_w]:
                if keys[pygame.K_SPACE]:
                    self.movUp = True
                    self.MONSTER_Y -= 3 * self.MONSTER_SPEED
                    print("going up")
                else:
                    self.movUp = True
                    self.MONSTER_Y -= self.MONSTER_SPEED
                    print("slow up")
                self.draw()

            # Go down
            if keys[pygame.K_s]:
                if keys[pygame.K_SPACE]:
                    self.movDown = True
                    self.MONSTER_Y += 3 * self.MONSTER_SPEED
                    print("going down")
                else:
                    self.movDown = True
                    self.MONSTER_Y += self.MONSTER_SPEED
                    print ("slow down")
                self.draw()

            # Go left
            if keys[pygame.K_a]:
                if keys[pygame.K_SPACE]:
                    self.movLeft = True
                    self.MONSTER_X -= 3 * self.MONSTER_SPEED
                    print("going left")
                else:
                    self.movLeft = True
                    self.MONSTER_X -= self.MONSTER_SPEED
                    print("slow left")
                self.draw()




            # When no user events are created, then draw yourself
            if event.type == self.Master_event:
                self.draw()

    def draw(self):

        # text = self.font.render(str(self.frame), True, (0, 0, 0))
        # rect = text.get_rect()

        # Draw the moving monster
        img = self.MONSTER_IMG
        MONSTER_RECT = img.get_rect()
        MONSTER_RECT.center = (self.WIDTH / 2, self.HEIGHT / 2)
        self.SCREEN.fill(self.bg_color)
        moved_rect = MONSTER_RECT.move(self.MONSTER_X, self.MONSTER_Y)
        self.SCREEN.blit(img, moved_rect)

        # Draw the target
        img2 = self.MONSTER_IMG_2
        MONSTER_RECT_2 = img2.get_rect()


        moved_rect_2 = MONSTER_RECT_2.move(self.MONSTER_2_X, self.MONSTER_2_Y)
        self.SCREEN.blit(img2, moved_rect_2)

        # Returns a boolean if the two images collide:
        if moved_rect.colliderect(moved_rect_2):
            self.score += 1
            self.SOUND.play()
            self.MONSTER_2_X = (random.randrange(700))
            self.MONSTER_2_Y = (random.randrange(500))

        text = self.SCREEN_font.render(str(self.score), True, WHITE)
        rect = text.get_rect()
        rect = rect.move(70, 10)
        self.SCREEN.blit(text, rect)

        rect_txt = self.SCORE_Display.get_rect()
        rect_txt = rect_txt.move(10, 10)
        self.SCREEN.blit(self.SCORE_Display, rect_txt)


        pygame.display.flip()


# Run the game
MyGame()
