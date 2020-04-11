## Author: Nikeros La Vecchia (quarantine COVID-19, April 1st 2020)
## this code generates an arcade game
## The code is partially copied by a file available online; Nikeros made several changes


import turtle
import os

wn = turtle.Screen()
wn.title("COVID-19")
wn.bgcolor("green")
wn.setup(width=909, height=800)
wn.tracer(0)

# Score
score_maman = 0
score_papa = 0

# Maman
paddle_maman = turtle.Turtle()
paddle_maman.speed(10)
paddle_maman.shape("turtle")
paddle_maman.color("white")
paddle_maman.shapesize(stretch_wid=4,stretch_len=4)
paddle_maman.penup()
paddle_maman.goto(-350, 0)

# Papa
paddle_papa = turtle.Turtle()
paddle_papa.speed(10)
paddle_papa.shape("turtle")
paddle_papa.color("white")
paddle_papa.shapesize(stretch_wid=6,stretch_len=6)
paddle_papa.penup()
paddle_papa.goto(350, 0)

# Ball
ball = turtle.Turtle()
ball.speed(1)  # change here speed
ball.shape("turtle")
ball.color("orange")
ball.shapesize(stretch_wid=2,stretch_len=2)
ball.penup()
ball.goto(-1, 1)
ball.dx = 1
ball.dy = 1

# Ball2
ball2 = turtle.Turtle()
ball2.speed(1)  # change here speed
ball2.shape("turtle")
ball2.color("yellow")
ball2.shapesize(stretch_wid=2,stretch_len=2)
ball2.penup()
ball2.goto(-5, 5)
ball2.dx = 2
ball2.dy = 2



# Pen
pen = turtle.Turtle()
pen.speed(2)
pen.shape("turtle")
pen.color("white")
pen.penup()
pen.hideturtle()
pen.goto(0, 260)
pen.write("maman: 0  papa: 0", align="center", font=("Courier", 24, "normal"))

# Functions
def paddle_maman_up():
    y = paddle_maman.ycor()
    y += 20
    paddle_maman.sety(y)

def paddle_maman_down():
    y = paddle_maman.ycor()
    y -= 20
    paddle_maman.sety(y)

def paddle_papa_up():
    y = paddle_papa.ycor()
    y += 20
    paddle_papa.sety(y)

def paddle_papa_down():
    y = paddle_papa.ycor()
    y -= 20
    paddle_papa.sety(y)

# Keyboard bindings
wn.listen()
wn.onkeypress(paddle_maman_up, "q")
wn.onkeypress(paddle_maman_down, "a")
wn.onkeypress(paddle_papa_up, "Up")
wn.onkeypress(paddle_papa_down, "Down")

# Main game loop
while True:
    wn.update()
    
    # Move the ball
    ball.setx(ball.xcor() + ball.dx)
    ball.sety(ball.ycor() + ball.dy)


    # Border checking

    # Top and bottom
    if ball.ycor() > 290:
        ball.sety(290)
        ball.dy *= -1
        os.system("afplay bounce.wav&")
    
    elif ball.ycor() < -290:
        ball.sety(-290)
        ball.dy *= -1
        os.system("afplay bounce.wav&")

    # Left and right
    if ball.xcor() > 350:
        score_maman += 1
        pen.clear()
        pen.write("maman: {}  papa: {}".format(score_maman, score_papa), align="center", font=("Courier", 24, "normal"))
        ball.goto(0, 0)
        ball.dx *= -1

    elif ball.xcor() < -350:
        score_papa += 1
        pen.clear()
        pen.write("maman: {}  papa: {}".format(score_maman, score_papa), align="center", font=("Courier", 24, "normal"))
        ball.goto(0, 0)
        ball.dx *= -1

    # Paddle and ball collisions
    if ball.xcor() < -340 and ball.ycor() < paddle_maman.ycor() + 50 and ball.ycor() > paddle_maman.ycor() - 50:
        ball.dx *= -1 
        os.system("afplay bounce.wav&")
    
    elif ball.xcor() > 340 and ball.ycor() < paddle_papa.ycor() + 50 and ball.ycor() > paddle_papa.ycor() - 50:
        ball.dx *= -1
        os.system("afplay bounce.wav&")

#### Commands for Ball2




   # Move the ball2
    ball2.setx(ball2.xcor() + ball2.dx)
    ball2.sety(ball2.ycor() + ball2.dy)

    # Border checking

    # Top and bottom
    if ball2.ycor() > 290:
        ball2.sety(290)
        ball2.dy *= -1
        os.system("afplay bounce.wav&")
    
    elif ball2.ycor() < -290:
        ball2.sety(-290)
        ball2.dy *= -1
        os.system("afplay bounce.wav&")

    # Left and right
    if ball2.xcor() > 350:
        score_maman += 1
        pen.clear()
        pen.write("maman: {}  papa: {}".format(score_maman, score_papa), align="center", font=("Courier", 24, "normal"))
        ball2.goto(-1, 0)
        ball2.dx *= -1

    elif ball2.xcor() < -350:
        score_papa += 1
        pen.clear()
        pen.write("maman: {}  papa: {}".format(score_maman, score_papa), align="center", font=("Courier", 24, "normal"))
        ball2.goto(-1, 0)
        ball2.dx *= -1

    # Paddle and ball collisions
    if ball2.xcor() < -340 and ball2.ycor() < paddle_maman.ycor() + 50 and ball2.ycor() > paddle_maman.ycor() - 50:
        ball2.dx *= -1 
        os.system("afplay bounce.wav&")
    
    elif ball2.xcor() > 340 and ball2.ycor() < paddle_papa.ycor() + 50 and ball2.ycor() > paddle_papa.ycor() - 50:
        ball2.dx *= -1
        os.system("afplay bounce.wav&")






















