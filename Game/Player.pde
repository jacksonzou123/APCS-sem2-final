class Player extends Character {
  boolean w;
  boolean a;
  boolean s;
  boolean d;
  int fireMode;
  int[] ammos;
  
  Player(float x, float y) {
    super(x, y);
    w = false;
    a = false;
    s = false;
    d = false;
    fireMode = 0;
    maxhealth = 100;
    health = 100;
    ammos = new int[3];
    ammos[1] = 15;
    ammos[2] = 100;
  }
  
  boolean hasAmmo(int index) {
    if (ammos[index] > 0) {
      ammos[index]--;
      return true;
    }
    return false;
  }
  
  
 
  String getWeapon() {
    if (fireMode == 0) {
      return "PISTOL";
    }
    if (fireMode == 1) {
      return "SHOTGUN";
    }
    if (fireMode == 2) {
      return "ASSAULT RIFLE";
    }
    return "blah";
  }
  
  void addAmmo(int gun, int ammo) {
    ammos[gun] += ammo;
  }
  
  String getGun() {
    if (fireMode == 0) {
      return "INFINITE";
    }
    if (fireMode == 1) {
      return "" + ammos[1];
    }
    if (fireMode == 2) {
      return "" + ammos[2];
    }
    return "blah";
  }
  
  void display() {
    rectMode(CORNER);
    if(a && !(x<15) && walls.get(0).checkRight()) x-= 4;
    if(d && !(x>985) && walls.get(0).checkLeft()) x+= 4;
    if(w && !(y<15) && walls.get(0).checkDown()) y-= 4;
    if(s && !(y>615) && walls.get(0).checkUp()) y+= 4;
    fill(0, 0, 255);
    pushMatrix();
    translate(x, y);
    rotate(atan2((mouseY-y),(mouseX-x)));
    ellipse(0,0,20,20);
    fill(255,0,0);
    rect(5,0,20,1);
    popMatrix();
  }

  void move(int num) {
    if (num == 0) { //a
      a = true;
    }
    if (num == 1) { //d
      d = true;
    }
    if (num == 2) { //w
      w = true;
    }
    if (num == 3) { //s
      s = true;

    }
  }
  
  void unmove(int num){
    if (num == 0) { //a
      a = false;
    }
    if (num == 1) { //d
      d = false;
    }
    if (num == 2) { //w
      w = false;
    }
    if (num == 3) { //s
      s = false;
    }
  }

  void changeFireMode(){
   if(fireMode >= 2) fireMode = 0;
   else fireMode++;
  }
}
