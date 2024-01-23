class Snake {
  PVector pos;
  PVector vel;
  ArrayList<PVector> hist;
  int len;
  int moveX = 0;
  int moveY = 0;

  Snake() {
    pos = new PVector(0, 0);
    vel = new PVector();
    hist = new ArrayList<PVector>();
    len = 0;
    setSize(len);
  }

  void setSize(int size) {
    len = size;
    for (int i = 0; i < size; i++) {
      update();
    }
  }


  void update() {
  hist.add(pos.copy());
  pos.x += vel.x * grid;
  pos.y += vel.y * grid;
  moveX = int(vel.x);
  moveY = int(vel.y);
  
  if(pos.x == rock.x && pos.y == rock.y){
    dead = true;
    if (len > highscore) highscore = len;
    return;
    }
  // Check for border collision
  if (pos.x < 0 || pos.x >= width || pos.y < 0 || pos.y >= height) {
    dead = true;
    if (len > highscore) highscore = len;
    return; // Exit the method early if collision occurs
  }

  if (hist.size() > len) {
    hist.remove(0);
  }

  for (PVector p : hist) {
    if (p.x == pos.x && p.y == pos.y) {
      dead = true;
      if (len > highscore) highscore = len;
      return; // Exit the method early if collision occurs
    }
  }
}
  void eat() {
    if (pos.x == cat.x && pos.y == cat.y) {
      len++;
      if (speed > 5) speed--;
      newCat();
      newRock();   
      
      
    }        
  }
  
  

  void show() {
    fill(125);
    imageMode(CORNER);
    //rect(pos.x, pos.y, grid, grid);
    image(kucing,pos.x, pos.y, grid, grid); 
    for (PVector p : hist) {
      //rect(p.x, p.y, grid, grid);
      image(kucing,p.x, p.y, grid, grid);
    }
  }
}

void keyPressed() {
  if (keyCode == LEFT && snake.moveX != 1) {
    snake.vel.x = -1;
    snake.vel.y = 0;
  } else if (keyCode == RIGHT && snake.moveX != -1) {
    snake.vel.x = 1;
    snake.vel.y = 0;
  } else if (keyCode == UP && snake.moveY != 1) {
    snake.vel.y = -1;
    snake.vel.x = 0;
  } else if (keyCode == DOWN && snake.moveY != -1) {
    snake.vel.y = 1;
    snake.vel.x = 0;
  }
  
  if (keyCode == 65 && snake.moveX != 1) {
    snake.vel.x = -1;
    snake.vel.y = 0;
  } else if (keyCode == 68 && snake.moveX != -1) {
    snake.vel.x = 1;
    snake.vel.y = 0;
  } else if (keyCode == 87 && snake.moveY != 1) {
    snake.vel.y = -1;
    snake.vel.x = 0;
  } else if (keyCode == 83 && snake.moveY != -1) {
    snake.vel.y = 1;
    snake.vel.x = 0;
  }
}
