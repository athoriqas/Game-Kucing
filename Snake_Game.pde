int grid = 60; 
PVector cat;
PVector rock;
int speed = 10;
boolean dead = true;
int highscore = 0;
PImage kucing;
PImage background;
PImage batu;
int score = 0;
PFont font;
Snake snake;

void setup() {
  size(1080, 720, P2D);
  snake = new Snake();
  cat = new PVector();
  rock = new PVector();
  newRock();
  newCat();
  //frameRate(120);
  kucing = loadImage("cat.png");
  background = loadImage("background.png");
  batu = loadImage("rock.png");
  font = createFont("PixelGameFont.ttf", 128);
  }



void draw() {
  imageMode(CENTER);
  //background(0, 255, 128);
  image(background, width/2, height/2, width, height);
  textFont(font);
    fill(255);
    if (!dead) {
    if (frameCount % speed == 0) {
      snake.update();
    }
    snake.show();
    snake.eat();
    fill(255, 0, 0);
    imageMode(CORNER);
    //rect(cat.x, cat.y, grid, grid);
    image(kucing, cat.x , cat.y , grid , grid );
    image(batu, rock.x, rock.y, grid , grid ); 
    textAlign(LEFT);
    textSize(35);
    fill(255);
    text("Score: " + snake.len, 10,35);
  } else {
    
    textAlign(CENTER, CENTER);
    textSize(45);
    text("KUCING MENCARI TEMAN", width/2, height/2-45);
    textSize(40);
    text("HIGHSCORE: " + highscore, width/2, height/2);
  }
  
}

void newCat() {
  for (int i = 0; i < 5000; i++) { 
    cat.x = floor(random(width/grid)) * grid; 
    cat.y = floor(random(height/grid)) * grid; 
    boolean onTail = true; 
    if (cat.x == snake.pos.x && cat.y == snake.pos.y) { 
      onTail = true;
    }   
    if (!onTail) {
      rock = new PVector(cat.x, cat.x);
      break;
    }
  }
}
  

  
void newRock() {
  for (int i = 0; i < 5000; i++) {
    rock.x = floor(random(width/grid)) * grid;
    rock.y = floor(random(height/grid)) * grid;
    boolean onTail = true;
    for (PVector p : snake.hist) {
      if (p.x == rock.x && p.y == rock.y) {
        onTail = true;
        break;
      }
    }
    if (!onTail) {
      rock = new PVector(rock.x, rock.y);
      break;
    }
  }
}
  

void mousePressed() {
  if (dead) {
    snake = new Snake();
    newCat();
    newRock();
    speed = 12;
    dead = false;
  }
}
