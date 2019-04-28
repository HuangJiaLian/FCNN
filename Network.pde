class Network {
  
  // The Network has a list of neurons
  ArrayList<Neuron> neurons;
  ArrayList<Layer> layers;
  PVector position;

  Network(float x, float y) {
    position = new PVector(x,y);
    neurons = new ArrayList<Neuron>();
    layers = new ArrayList<Layer>();
  }
  
  // We can add a Neuron
  void addNeuron(Neuron n) {
    neurons.add(n);
  }
  
  void addLayer(Layer l){
    layers.add(l);
  }
  
  // We can connection two Neurons
  void connect(Neuron a, Neuron b) {
    Connection c = new Connection(a, b, random(1));
    //Connection c = new Connection(a, b, 0.1);
    a.addConnection(c);
  } 

  void connectLayer(Layer a, Layer b) {
    for(int j=0; j < a.nodes_num; j++){
      for(int i = 0; i < b.nodes_num; i++){
        Connection c = new Connection(a.neurons.get(j) , b.neurons.get(i) , random(1));
        a.neurons.get(j).addConnection(c);
      }
    }
  }

  // We can draw the network
  void display() {
    pushMatrix();
    translate(position.x, position.y);
    for (Layer l : layers){
      l.display();
    }
    popMatrix();
  }
}
