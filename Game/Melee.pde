class Melee extends Monster{
  Melee(float x, float y) {
    super(x,y);
  }
  
  void display() {
    pushMatrix();
    translate(x,y);
    rotate(atan2(player.y - this.y, player.x - this.x));
    fill(100,100,0);
    ellipse(0,0,10,10);
    rect(0,4,10,0.5);
    rect(0,-5,10,0.5);
    popMatrix();
  }
  
  void move(int i) {
    float scale = 2 * sqrt(pow((player.y-this.y),2)+pow((player.x-this.x),2));
    x+= (player.x-this.x)/scale;
    y+= (player.y-this.y)/scale;
  }
}