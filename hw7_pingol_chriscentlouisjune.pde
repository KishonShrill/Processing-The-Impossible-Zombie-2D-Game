/**
  * Background Music Set up
  *
  * Change the music according to mood
  */
 
import processing.sound.*;
// put background music here
SoundFile backgroundMusic, gameplay ,gameFail, gameFail2, gameFail3;
boolean sound1 = false, sound2 = false, sound3 = false;

/**
  * Character 2d
  *
  * Moving my character like a DVD Logo
  */
 
/* Character */
  boolean up, down, left, right;
  int positionX;//character horizontal position
  int positionY;//character vertical position
    
/* Intro */
  int timer = 0;
  /* Animation */
    int introchase1X = 0; int introchase1Y = 00;
    int introchase2X = 0; int introchase2Y = 00;
    int introchase3X = 0; int introchase3Y = 00;
  /* Sine, Cosine, and Tangent Animation */
    float tCharacter = 0.0, t1 = 0.0, t2 = 0.0, t3 = 0.0;
    float dt = .1;
    float amplitude = 25.0;
    float easing = 0.005;
    
/* Bullets */
  ArrayList<BulletUP> bulletListUP;
  ArrayList<BulletDOWN> bulletListDOWN;
  ArrayList<BulletLEFT> bulletListLEFT;
  ArrayList<BulletRIGHT> bulletListRIGHT;
  
/* Enemies */
  ArrayList<Enemy> enemyList;
  Enemy [] zombiesTOP, zombiesLEFT, zombiesRIGHT, zombiesBOTTOM;
  Enemy [] zombiesTOPHard, zombiesLEFTHard, zombiesRIGHTHard, zombiesBOTTOMHard;

/* Booleans */
  /* Game Starter Package */
    int startGame = 0; // Game Starter
    boolean playerisDead = false ;
    boolean oneTime = false;
  /* Stages */
    boolean Round = false;
    boolean stage2 = true;
    boolean stage3 = true;
    boolean stage4 = true;
    boolean stage5 = true;
    boolean stage6 = true;
    boolean stage7 = true;
    boolean stage8 = true;
    boolean stage9 = true;
    boolean stage10 = true;
    
/* Display */
  /* Score */
    boolean scoreMe;
    int Score = 0;
  /* Stage Number */
    int stageNumber = 1;

/**
  * Above is the messy initializations of variables
  * This is the start of the game code
  * Below is the beautiful piece of art that made me crazy :)
  */
  
PFont f, fbig, fbigger, fbiggest;
PImage img1, img2, responsive;
  
void setup () {           /* Set Up */
  surface.setResizable(true);
  size(800,500);
  noStroke();
  
  /* Background */
  img1 = loadImage("gameBackground.png");
  img2 = loadImage("gamePlay.png");
  responsive = loadImage("responsiveWallpaper.png");
  
  /* Character Starting Position */
  positionX = 0; //character horizontal position
  positionY = 0; //character vertical position
  
  /* Fonts */
    f = createFont("Arial", 25, true); // Initializing a font and its size
    fbig = createFont("Arial", 40, true);
    fbigger = createFont("Arial", 50, true); // Initializing a font and its size
    fbiggest = createFont("Arial", 80, true);
  
  /* Music */
    backgroundMusic = new SoundFile(this, "gameMenu.mp3");
    gameplay = new SoundFile(this, "RogueLegacyOST.mp3");
    gameFail = new SoundFile(this, "Emotional_Damage.mp3");
    gameFail2 = new SoundFile(this, "I_will_send_you_to_Jesus.mp3");
    gameFail3 = new SoundFile(this, "RoastedDream(1).mp3");
    
  // Initialize de Variables
    bulletListUP = new ArrayList<BulletUP>();
    bulletListDOWN = new ArrayList<BulletDOWN>();
    bulletListLEFT = new ArrayList<BulletLEFT>();
    bulletListRIGHT = new ArrayList<BulletRIGHT>();
  
  /* Enemies */
    enemyList = new ArrayList<Enemy>();
    zombiesTOP = new Enemy[10];
    zombiesLEFT = new Enemy[10];
    zombiesRIGHT = new Enemy[10];
    zombiesBOTTOM = new Enemy[10];
    zombiesTOPHard = new Enemy[20];
    zombiesLEFTHard = new Enemy[20];
    zombiesRIGHTHard = new Enemy[20];
    zombiesBOTTOMHard = new Enemy[20];
        
    for (int i = 0; i < 10; i++){zombiesTOP[i] = new Enemy(random(0,width), random(0, 10), 50, 50, 245, 0 ,0);}
    for (int j = 0; j < 10; j++){enemyList.add(zombiesTOP[j]);}  
}

void draw() {             /* Costumize */
  background(51);
  
  /* Intro Music */
  if (!backgroundMusic.isPlaying()) {backgroundMusic.play(); backgroundMusic.amp(0.35);}
  if (startGame == 0) {
    if (width == 800) background(img1); else if (width == 1920) background(responsive); else background(51);
    intro(); 
    animation();
  }
  
  /* Start of Game */
  if ((startGame >= 1) && (playerisDead == false)) {
    backgroundMusic.stop();
    if (width == 800) background(img2); else if (width > 800) background(responsive); else background(51);
    if (!gameplay.isPlaying()) {gameplay.play();}
    gameComponentGrouper();
  }
  
  /* When player is dead */
  if (playerisDead == true) {gameplay.stop(); backgroundMusic.stop(); gameoverTexts();}
  if (playerisDead == true){
    
    /* Play audio to discourage */
    if (!gameFail.isPlaying() && (sound1 == false)) {gameFail.play(); sound1 = true;}
    if (!gameFail.isPlaying() && !gameFail3.isPlaying() && (sound3 == false)) {gameFail3.play(); sound3 = true;}
    if (!gameFail.isPlaying() && !gameFail3.isPlaying() && !gameFail2.isPlaying() && (sound2 == false)) {gameFail2.play(); sound2 = true;}

    /* Pressing the restart key */
    if (keyPressed){
      if (key == 'o'){

        
        /* Stop the music */
          gameFail.stop();
          gameFail2.stop();
          gameFail3.stop();
        
        /* Default Animation Values */
        t1 = 0.0; t2 = 0.0; t3 = 0.0;
        introchase1X = 0; introchase1Y = 00;
        introchase2X = 0; introchase2Y = 00;
        introchase3X = 0; introchase3Y = 00;
        
        /* Restart Boolean */
          playerisDead = false;
          oneTime = false;
          sound1 = false;
          sound2 = false;
          sound3 = false;
                
        /* Stages */
          startGame = 0;
          stage2 = true;
          stage3 = true;
          stage4 = true;
          stage5 = true;
          stage6 = true;
          stage7 = true;
          stage8 = true;
          stage9 = true;
          stage10 = true;        
          stageNumber = 1;

        /* Restart to Default Values */
        positionX = 0; //character horizontal position
        positionY = 380; //character vertical position
        timer = 0;
        redraw();
      }
    }
  }
  /* Debug Review */
  //print("I am X: " + width);
  //println("I am Y: " + height);
}

void gameComponentGrouper(){
  NewStage(); // Stages/trials for the player
  StageClear(); // Is game cleared?
  theMovement(); // up,down,left,right
  theBounceSTOPPER(); // Screen Saver
  gameBullets(); // Gun
  character(); // The player
  
  /* Display Stage No. */
  fill(255);
  textFont(f); textAlign(LEFT);
  if (width == 800) {text("Stage " + stageNumber, 20, 40);} else {textFont(fbigger); text("Stage " + stageNumber, 40, 80);}
}

/**
  *Variable Index
  *1. NewStage()
  *2. StageClear()
  *3. intro()
  *4. gameoverTexts()
  *5. animation()
  *6. theMovement()
  *7. theBounceSTOPPER()
  *8. gameBullets()
  *9. character()
  *
  **/

void NewStage(){  
  if (Round == true) stageNumber = stageNumber + 1; // What stage are we on?
/* Stage 2 */
  if (stage2 == false) easing = 0.005; // change difficulty speed
  for (int i = 0; i < 10; i++){zombiesTOP[i] = new Enemy(random(0,width), random(0, 20), 50, 50, 245, 0, 0);} // top
  if ((Round == true) && (stage2 == true)){
    for(int j = 0; j < 10; j++){
      enemyList.add(zombiesTOP[j]);
    }
    stage2 = false;
    Round = false;
  }
/* Stage 3 */
  if (stage3 == false) easing = 0.006; // change difficulty speed
  for (int i = 0; i < 10; i++){zombiesLEFT[i] = new Enemy(random(0, 20), random(0, height), 50, 50, random(0,245), 0, 0);} // left
  for (int i = 0; i < 10; i++){zombiesRIGHT[i] = new Enemy(random(width-20, width), random(0, height), 50, 50, random(0,245), 0, 0);} // right
  if ((Round == true) && (stage3 == true)){
    for(int j = 0; j < 10; j++){enemyList.add(zombiesLEFT[j]);}
    for(int j = 0; j < 10; j++){enemyList.add(zombiesRIGHT[j]);}
    stage3 = false;
    Round = false;
  }
/* Stage 4 */
  if (stage4 == false) easing = 0.0065; // change difficulty speed
  for (int i = 0; i < 10; i++){zombiesTOP[i] = new Enemy(random(0, width), random(0, 20), 50, 50, random(0,245), 0, 0);} // top
  for (int i = 0; i < 10; i++){zombiesBOTTOM[i] = new Enemy(random(0, width), random(height-20, height), 50, 50, random(0,245), 0, 0);} // bottom
  if ((Round == true) && (stage4 == true)){
    for(int j = 0; j < 10; j++){enemyList.add(zombiesTOP[j]);}
    for(int j = 0; j < 10; j++){enemyList.add(zombiesBOTTOM[j]);}
    stage4 = false;
    Round = false;
  }
/* Stage 5 */
  if (stage5 == false) easing = 0.007; // change difficulty speed
  for (int i = 0; i < 10; i++){zombiesTOP[i] = new Enemy(random(0, width), random(0, 20), 50, 50, random(0,245), 0, 0);} // top
  for (int i = 0; i < 10; i++){zombiesBOTTOM[i] = new Enemy(random(0, width), random(height-20, height), 50, 50, random(0,245), 0, 0);} // bottom
  for (int i = 0; i < 10; i++){zombiesLEFT[i] = new Enemy(random(0, 20), random(0,height), 50, 50, random(0,245), 0, 0);} // left
  if ((Round == true) && (stage5 == true)){
    for(int j = 0; j < 10; j++){enemyList.add(zombiesTOP[j]);}
    for(int j = 0; j < 10; j++){enemyList.add(zombiesBOTTOM[j]);}
    for(int j = 0; j < 10; j++){enemyList.add(zombiesLEFT[j]);}
    stage5 = false;
    Round = false;
  }
/* Stage 6 */
  if (stage6 == false) easing = 0.0075; // change difficulty speed
  for (int i = 0; i < 10; i++){zombiesTOPHard[i] = new Enemy(random(0, width), random(0, 20), 50, 50, 0, random(0,245), 0);} // top
  for (int i = 0; i < 20; i++){zombiesBOTTOMHard[i] = new Enemy(random(0, width), random(height-20, height), 50, 50, random(0,245), 0, 0);} // bottom
  //for (int i = 0; i < 10; i++){zombiesRIGHTHard[i] = new Enemy(random(width-20, width), random(0,height), 50, 50);} // right
  if ((Round == true) && (stage6 == true)){
    for(int j = 0; j < 10; j++){enemyList.add(zombiesTOPHard[j]);}
    for(int j = 0; j <20; j++){enemyList.add(zombiesBOTTOMHard[j]);}
    //for(int j = 0; j < 10; j++){enemyList.add(zombiesRIGHTHard[j]);}
    stage6 = false;
    Round = false;
  }
/* Stage 7 */
  if (stage7 == false) easing = 0.008; // change difficulty speed
  //for (int i = 0; i < 10; i++){zombiesTOPHard[i] = new Enemy(random(0, width), random(0, 20), 50, 50);} // top
  //for (int i = 0; i < 10; i++){zombiesBOTTOMHard[i] = new Enemy(random(0, width), random(height-20, height), 50, 50);} // bottom
  for (int i = 0; i < 20; i++){zombiesLEFTHard[i] = new Enemy(random(width-20, width), random(0,height), random(50,70), random(50,70), 0, 0, random(0,245));} // left
  for (int i = 0; i < 10; i++){zombiesRIGHTHard[i] = new Enemy(random(0, 20), random(0,height), random(50,70), random(50,70), random(0,245), 0, 0);} // right
  if ((Round == true) && (stage7 == true)){
    //for(int j = 0; j < 10; j++){enemyList.add(zombiesTOPHard[j]);}
    //for(int j = 0; j < 10; j++){enemyList.add(zombiesBOTTOMHard[j]);}
    for(int j = 0; j < 20; j++){enemyList.add(zombiesLEFTHard[j]);}
    for(int j = 0; j < 10; j++){enemyList.add(zombiesRIGHTHard[j]);}
    stage7 = false;
    Round = false;
  }
/* Stage 8 */
  if (stage8 == false) easing = 0.009; // change difficulty speed
  //for (int i = 0; i < 10; i++){zombiesTOPHard[i] = new Enemy(random(0, width), random(0, 20), 50, 50);} // top
  for (int i = 0; i < 20; i++){zombiesBOTTOMHard[i] = new Enemy(random(0, width), random(height-20, height), random(50,70), random(50,70), random(0,245), 0, 0);} // bottom
  for (int i = 0; i < 20; i++){zombiesLEFTHard[i] = new Enemy(random(width-20, width), random(0,height), random(50,70), random(50,70), 0, random(0,245), 0);} // left
  for (int i = 0; i < 20; i++){zombiesRIGHTHard[i] = new Enemy(random(0, 20), random(0,height), random(50,70), random(50,70), 0, 0, random(0,245));} // right
  if ((Round == true) && (stage8 == true)){
    //for(int j = 0; j < 10; j++){enemyList.add(zombiesTOPHard[j]);}
    for(int j = 0; j < 20; j++){enemyList.add(zombiesBOTTOMHard[j]);}
    for(int j = 0; j < 20; j++){enemyList.add(zombiesLEFTHard[j]);}
    for(int j = 0; j < 20; j++){enemyList.add(zombiesRIGHTHard[j]);}
    stage8 = false;
    Round = false;
  }
/* Stage 9 */
  if (stage9 == false) easing = 0.0125; // change difficulty speed
  boolean wave1 = true, wave2 = false, wave3 = false, wave4 = false; 
  for (int i = 0; i < 10; i++){zombiesTOPHard[i] = new Enemy(random(0, width), random(0, 20), random(50,70), random(50,70), 0, random(0,245), 0);} // top
  for (int i = 0; i < 20; i++){zombiesBOTTOMHard[i] = new Enemy(random(0, width), random(height-20, height), random(50,70), random(50,70), 0, 0, random(0,245));} // bottom
  for (int i = 0; i < 20; i++){zombiesLEFTHard[i] = new Enemy(random(width-20, width), random(0,height), random(50,70), random(50,70), random(0,245), 0, 0);} // left
  for (int i = 0; i < 20; i++){zombiesRIGHTHard[i] = new Enemy(random(0, 20), random(0,height), random(50,70), random(50,70), 245, 0, random(0,245));} // right
  if ((Round == true) && (stage9 == true)){
    if (wave1 == true) for(int j = 0; j < 10; j++){enemyList.add(zombiesTOPHard[j]); wave1 = false; wave2 = true;}
    if (wave2 == true) for(int j = 0; j < 20; j++){enemyList.add(zombiesBOTTOMHard[j]); wave2 = false; wave3 = true;}
    if (wave3 == true) for(int j = 0; j < 20; j++){enemyList.add(zombiesLEFTHard[j]); wave3 = false; wave4 = true;}
    if (wave4 == true) for(int j = 0; j < 20; j++){enemyList.add(zombiesRIGHTHard[j]); wave4 = false; }
    stage9 = false;
    Round = false;
  }
  
  if (stage10 == false) easing = 0.01; // change difficulty speed
  for (int i = 0; i < 10; i++){zombiesTOPHard[i] = new Enemy(random(0, width), random(0, 20), random(50,70), random(50,70), 0, random(0,245), 0);} // top
  for (int i = 0; i < 20; i++){zombiesBOTTOMHard[i] = new Enemy(random(0, width), random(height-20, height), random(50,70), random(50,70), 0, 0, random(0,245));} // bottom
  for (int i = 0; i < 20; i++){zombiesLEFTHard[i] = new Enemy(random(width-20, width), random(0,height), random(50,70), random(50,70), random(0,245), 0, 0);} // left
  for (int i = 0; i < 20; i++){zombiesRIGHTHard[i] = new Enemy(random(0, 20), random(0,height), random(50,70), random(50,70), 245, 0, random(0,245));} // right
  if ((Round == true) && (stage10 == true)){
    if (wave1 == true) for(int j = 0; j < 10; j++){enemyList.add(zombiesTOPHard[j]); wave1 = false; wave2 = true;}
    if (wave2 == true) for(int j = 0; j < 20; j++){enemyList.add(zombiesBOTTOMHard[j]); wave2 = false; wave3 = true;}
    if (wave3 == true) for(int j = 0; j < 20; j++){enemyList.add(zombiesLEFTHard[j]); wave3 = false; wave4 = true;}
    if (wave4 == true) for(int j = 0; j < 20; j++){enemyList.add(zombiesRIGHTHard[j]); wave4 = false;}
    stage10 = false;
    Round = false;
  }
}

/* Boolean Reseter */
void StageClear(){if (enemyList.size() == 0){Round = true;}}

/* Movements and Controls */
void theMovement() {
  if (keyPressed) {
    if (up == true) positionY = positionY - 5;
    if (left == true) positionX = positionX - 5;
    if (down == true) positionY = positionY + 5;
    if (right == true) positionX = positionX + 5;
  }
}

/* Display Game Home Menu */
void intro(){
  if (keyPressed){if (key == ' '){startGame = startGame + 1; playerisDead = false;}} // Key to start the game

  /* Supposed to be a responsive */
  if (width == 800){
    fill(255,0,0);    
    textFont(fbig); textAlign(RIGHT);
    text("ZOMBIE",(width/2)-40,(height/2)-130);
    textAlign(LEFT);
    text("SHOOTING",(width/2)+70,(height/2)-130);
    textFont(f); textAlign(CENTER);
    fill(255);    
    text("THE IMPOSSIBLE 2D GAME", (width/2)-10, (height/2)-170);

    textFont(f); textAlign(CENTER);
    text("Press [SPACE] to Play!", width/2, (height/2)+200);    
  } else {
    fill(255);
    textFont(fbigger); textAlign(RIGHT);
    text("Welcome to...", (width/2)-200, (height/2)-250);
  
    textFont(fbiggest); textAlign(CENTER);
    text("ZOMBIE SHOOTING GAME 2D",width/2,(height/2)-180);
  
    textFont(fbigger); textAlign(CENTER);
    text("Press [SPACE] to Play!", width/2, (height/2)+290);
  }
}

/* Display texts when dead */
void gameoverTexts(){
  if (width == 800){
    fill(255);
    textFont(f); textAlign(RIGHT);
    text("You have failed...", (width/2)-100, (height/2)-125);

    fill(255,0,0);
    textFont(fbig); textAlign(CENTER);
    text("WHO YOU? A FAILURE!",width/2,(height/2)-90);

    fill(200);
    textFont(f); textAlign(CENTER);
    text("[Are you even trying??? It's not even that HARD...]", width/2, (height/2));

    fill(255);  
    textFont(f); textAlign(CENTER);
    text("Press [O] key to play Again!", width/2, (height/2)+120);
  } else {
    fill(255);
    textFont(fbigger); textAlign(RIGHT);
    text("You have failed...", (width/2)-200, (height/2)-250);

    fill(255,0,0);
    textFont(fbiggest); textAlign(CENTER);
    text("WHO YOU? A FAILURE!",width/2,(height/2)-180);

    fill(200);
    textFont(fbigger); textAlign(CENTER);
    text("[Are you even trying??? It's not even that HARD...]", width/2, height/2);

    fill(255);  
    textFont(fbigger); textAlign(CENTER);
    text("Press [O] key to play Again!", width/2, (height/2)+240);
  }  
}

/* The animation that is shown on the menu, the zombie chasing the player */
void animation(){
  int appendY = 115;
  if (height > 500) amplitude = 50.0; else amplitude = 25.0;
    if((width == 800) && (startGame == 0)) positionY = (height/2)+130; else if ((width != 800) && (startGame == 0)) positionY = (height/2)+140; else positionY = 380;
  
  if (startGame < 1) {timer = timer + 1;}
  introchase1Y = (height/2)+appendY; introchase2Y = (height/2)+appendY; introchase3Y = (height/2)+appendY;
  
  /* Animation */
    rectMode(CENTER);
      character();
      if (positionX <= width) positionX = positionX + 2; else positionX = 0;

    if (timer > 100) { // First chaser      
      stroke(0,0,0);
      fill(245,0,0);
      rect(introchase1X, amplitude*sin(t1/1.5)+introchase1Y, 50, 50);
      introchase1X += 2;
      t1 += dt;
      if (introchase1X > width) introchase1X = 0;
    }
    
    if (timer > 150) { // Second chaser
      stroke(0,0,0);
      fill(0,245,0);
      rect(introchase2X, amplitude*cos(t2/1.5)+introchase2Y, 50, 50);
      introchase2X += 2;
      t2 -= dt;
      if (introchase2X > width) introchase2X = 0;
    }
    
    if (timer > 200) { // Third chaser
      stroke(0,0,0);
      fill(0,245,245);
      rect(introchase3X, amplitude*sin(t3/1.5)+introchase3Y, 50, 50);
      introchase3X += 2;
      t3 -= dt;
      if (introchase3X > width) introchase3X = 0;
    }
}

void keyPressed() {  
  /* Player Settings */
  if (playerisDead == false){
    if (key == 'w' || key == 'W') up = true;  
    if (key == 'a' || key == 'A') left = true;
    if (key == 's' || key == 'S') down = true;
    if (key == 'd' || key == 'D') right = true;
  } else {up = false; down = false; left = false; right = false;}
  
  /* Bullets */
  if (key == CODED) {
    if (keyCode == UP){bulletListUP.add( new BulletUP(positionX, positionY) );}
    if (keyCode == DOWN){bulletListDOWN.add( new BulletDOWN(positionX, positionY) );}
    if (keyCode == LEFT){bulletListLEFT.add( new BulletLEFT(positionX, positionY) );}
    if (keyCode == RIGHT){bulletListRIGHT.add( new BulletRIGHT(positionX, positionY) );}
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') up = false;  
  if (key == 'a' || key == 'A') left = false;
  if (key == 's' || key == 'S') down = false;
  if (key == 'd' || key == 'D') right = false;
}

/* Makes it impossible to go over the screen */
void theBounceSTOPPER() { /* Screen Saver */  
  if (positionX > (width-15)) {positionX = positionX - 5;}
  if (positionX < 20) {positionX = positionX + 5;}
  if (positionY > (height-35)) {positionY = positionY - 5;}
  if (positionY < 35) {positionY = positionY + 5;}
}

/* BOOM BOOM BANG BANG */
void gameBullets() {
  for (Enemy anEnemy : enemyList){
    anEnemy.render();
  }
  
  // UP UP UP UP UP UP UP UP UP UP UP UP UP UP UP UP UP UP
  for (BulletUP aBullet : bulletListUP){
    aBullet.renderUPBullet();
    aBullet.moveUPBullet();
    aBullet.checkUPRemove();
    
    for (Enemy anEnemy : enemyList){
      aBullet.shootEnemy(anEnemy);
    }
  }
  // for loop that removes unwanted bullets
  for (int i = bulletListUP.size()-1; i >= 0; i--){
    BulletUP aBullet = bulletListUP.get(i);
    if (aBullet.removeBullet == true){bulletListUP.remove(aBullet);}
  }
  
  // DOWN DOWN DOWN DOWN DOWN DOWN DOWN DOWN DOWN DOWN DOWN
  for (BulletDOWN aBullet : bulletListDOWN){
    aBullet.renderDOWNBullet();
    aBullet.moveDOWNBullet();
    aBullet.checkDOWNRemove();
    
    for (Enemy anEnemy : enemyList){
      aBullet.shootEnemy(anEnemy);
    }
  }
  // for loop that removes unwanted bullets
  for (int i = bulletListDOWN.size()-1; i >= 0; i--){
    BulletDOWN aBullet = bulletListDOWN.get(i);
    
    if (aBullet.removeBullet == true){bulletListDOWN.remove(aBullet);}
  }
  
  // LEFT LEFT LEFT LEFT LEFT LEFT LEFT LEFT LEFT LEFT LEFT
  for (BulletLEFT aBullet : bulletListLEFT){
    aBullet.renderLEFTBullet();
    aBullet.moveLEFTBullet();
    aBullet.checkLEFTRemove();
    
    for (Enemy anEnemy : enemyList){
      aBullet.shootEnemy(anEnemy);
    }
  }
  // for loop that removes unwanted bullets
  for (int i = bulletListLEFT.size()-1; i >= 0; i--){
    BulletLEFT aBullet = bulletListLEFT.get(i);
    
    if (aBullet.removeBullet == true){bulletListLEFT.remove(aBullet);}
  }
  
  // RIGHT RIGHT RIGHT RIGHT RIGHT RIGHT RIGHT RIGHT RIGHT
  for (BulletRIGHT aBullet : bulletListRIGHT){
    aBullet.renderRIGHTBullet();
    aBullet.moveRIGHTBullet();
    aBullet.checkRIGHTRemove();
    
    for (Enemy anEnemy : enemyList){
      aBullet.shootEnemy(anEnemy);
    }
  }
  // for loop that removes unwanted bullets
  for (int i = bulletListRIGHT.size()-1; i >= 0; i--){
    BulletRIGHT aBullet = bulletListRIGHT.get(i);
    
    if (aBullet.removeBullet == true){bulletListRIGHT.remove(aBullet);}
  }
  
  // for loop that removes killed enemies
  for (int i = enemyList.size()-1; i >= 0; i--){
    Enemy anEnemy = enemyList.get(i);
    if (anEnemy.isDead == true){
      enemyList.remove(anEnemy);}
  }
}


int red = 255, green = 0, blue = 0; // Body Color
void character() {
  noStroke();
  //Body
  fill(red,green,blue); 
  rect(positionX,positionY+5,160/4,100/4); // fat
  rect(positionX,positionY+9,120/4,100/4); // belly
  
  // Hair
  fill(147,88,40);
  rect(positionX,positionY-20,160/4,60/4);
  rect(positionX,positionY-29,120/4,20/4);
  
  // Head
  fill(255,216,245); 
  rect(positionX,positionY-9.5,80/4,60/4); // neck
  rect(positionX,positionY-12,120/4,40/4);
  rect(positionX-7.5,positionY-19.5,60/4,20/4);
  
  // Hand
  rect(positionX-17.5,positionY+14.5,20/4,20/4); //left
  rect(positionX+17.5,positionY+14.5,20/4,20/4); //right
  
  // Legs
  fill(129,125,196);
  rect(positionX,positionY+19.5,120/4,20/4); 
  rect(positionX-12.5,positionY+27,20/4,40/4); // left
  rect(positionX+12.5,positionY+27,20/4,40/4); //right
  
  // Shoes
  fill(0,0,0); 
  rect(positionX-12.5,positionY+32,20/4,20/4); //left
  rect(positionX+12.5,positionY+32,20/4,20/4); //right
}
