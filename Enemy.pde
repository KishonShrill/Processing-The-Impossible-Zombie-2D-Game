class Enemy{
  // Initialize Variables
  float x,y,w,h,r,g,b;
  float Zleft, Zright, Ztop, Zbottom;
  
  boolean isDead;
       
  Enemy(float enemyPlaceX, float enemyPlaceY, float Width, float Height, float Red, float Green, float Blue){
    x = enemyPlaceX;
    y = enemyPlaceY;
    w = Width;
    h = Height;
    r = Red;
    g = Green;
    b = Blue;
    
    Zleft = x - w/2;
    Zright = x + w/2;
    Ztop = y - w/2;
    Zbottom = y + w/2;
    
    isDead = false;
  }
  
  void render(){
    rectMode(CENTER);
    float targetX = positionX;
    float dx = targetX - x;
    x += dx * easing;
    
    float targetY = positionY;
    float dy = targetY - y;
    y += dy * easing;

    if ((abs(dy) <= 55.5) && (abs(dx) <= 46)){easing = 0; playerisDead = true;}
    if (isDead == true) enemyList.remove(0);     
    if (playerisDead == true) {easing = 0;}
    
    Zleft = x - w/2;
    Zright = x + w/2;
    Ztop = y - w/2;
    Zbottom = y + w/2;
    
    stroke(0,0,0);
    fill(r,g,b);
    rect(x,y,w,h);
  }
}
