class BulletUP{
  // Variables
  int x, // left and right
      y, // up and down
      s = 10, // bullet speed
      d = 10; // diameter
        
  boolean removeBullet;
        
  int left;
  int right;
  int top;
  int bottom;

  // Constructor
  BulletUP(int playerPlaceX, int playerPlaceY){
    x = playerPlaceX;
    y = playerPlaceY;

    d = 5;
    
    removeBullet = false;
    
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }
  void renderUPBullet(){
    fill(255,255,255);
    circle(x,y,d);
  }
  void moveUPBullet(){
    y -= s;
    
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }
  void checkUPRemove(){
    if (y < 0){
      removeBullet = true;
    }
  }
  
  void shootEnemy(Enemy anEnemy){
    if (top <= anEnemy.Zbottom &&
        bottom >= anEnemy.Ztop && 
        left <= anEnemy.Zright && 
        right >= anEnemy.Zleft){
          anEnemy.isDead = true;
          removeBullet = true;
    }
  }
}






class BulletDOWN{

  // Variables
  int x, // left and right
      y, // up and down
      s = 10, // bullet speed
      d = 10; // diameter
      
  boolean removeBullet;

  
  int left;
  int right;
  int top;
  int bottom;

  // Constructor
  BulletDOWN(int playerPlaceX, int playerPlaceY){
    x = playerPlaceX;
    y = playerPlaceY;
    d = 5;
    
    removeBullet = false;
    
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }
  
  void renderDOWNBullet(){
    fill(255,255,255);
    circle(x,y,d);
  }
  void moveDOWNBullet(){
    y += s;
    
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }
  void checkDOWNRemove(){
    if (y < 0){
      removeBullet = true;
    }
  }
  
  void shootEnemy(Enemy anEnemy){
    // if bullet boom boom enemy
    // enemy dead
    if (top <= anEnemy.Zbottom &&
        bottom >= anEnemy.Ztop && 
        left <= anEnemy.Zright && 
        right >= anEnemy.Zleft){
          anEnemy.isDead = true;
          removeBullet = true;
    }
  }
}







class BulletLEFT{

  // Variables
  int x, // left and right
      y, // up and down
      s = 10, // bullet speed
      d = 10; // diameter
      
  boolean removeBullet;

  
  int left;
  int right;
  int top;
  int bottom;

  // Constructor
  BulletLEFT(int playerPlaceX, int playerPlaceY){
    x = playerPlaceX;
    y = playerPlaceY;
    d = 5;
    
    removeBullet = false;
    
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }
  void renderLEFTBullet(){
    fill(255,255,255);
    circle(x,y,d);
  }
  void moveLEFTBullet(){
    x -= s;
    
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }
  void checkLEFTRemove(){
    if (y < 0){
      removeBullet = true;
    }
  }
  
  void shootEnemy(Enemy anEnemy){
    if (top <= anEnemy.Zbottom &&
        bottom >= anEnemy.Ztop && 
        left <= anEnemy.Zright && 
        right >= anEnemy.Zleft){
          anEnemy.isDead = true;
          removeBullet = true;

    }
  }
}






class BulletRIGHT{

  // Variables
  int x, // left and right
      y, // up and down
      s = 10, // bullet speed
      d = 10; // diameter
      
  boolean removeBullet;
  
  int left;
  int right;
  int top;
  int bottom;

  // Constructor
  BulletRIGHT(int playerPlaceX, int playerPlaceY){
    x = playerPlaceX;
    y = playerPlaceY;
    d = 5;
    
    removeBullet = false;
    
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }
  
  void renderRIGHTBullet(){
    fill(255,255,255);
    circle(x,y,d);
  }
  
  void moveRIGHTBullet(){
    x += s;
    
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }
  
  void checkRIGHTRemove(){
    if (y < 0){
      removeBullet = true;
    }
  }
  
  void shootEnemy(Enemy anEnemy){
    if (top <= anEnemy.Zbottom &&
        bottom >= anEnemy.Ztop && 
        left <= anEnemy.Zright && 
        right >= anEnemy.Zleft){
          anEnemy.isDead = true;
          removeBullet = true;
    }
  }
}
