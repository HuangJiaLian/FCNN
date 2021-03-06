// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A static drawing of a Neural Network

class Connection {

  // Connection is from Neuron A to B
  Neuron a;
  Neuron b;
  
  // Connection has a weight
  float weight;

  Connection(Neuron from, Neuron to,float w) {
    weight = w;
    a = from;
    b = to;
  }

  // Drawn as a line
  void display() {
    stroke(0);
    strokeWeight(weight*2);
    line(a.position.x, a.position.y, b.position.x, b.position.y);
  }
}
