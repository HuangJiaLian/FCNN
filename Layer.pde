// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com


class Layer {
  
  int layer_num;
  int nodes_num;
  float x_start; 
  float y_start;
  float y_space;
  float centerY;
  float buttomY;
  String[] name_ = new String[2];
  String name;
  
  // Neuron has a list of connections
  ArrayList<Neuron> neurons;
  Neuron temp_n;
  
  Layer(int l_num, int n_num, float x_s, float y_s, float y_sp) {
    layer_num = l_num;
    if (layer_num == 0){
      name_[0] = "  Input Layer∈R";
      name_[1] = str(n_num);
      name = join(name_,"");
      //println(name);
    }else
    if(layer_num == -1){
      name_[0] = "Output Layer∈R";
      name_[1] = str(n_num);
      name = join(name_,""); 
      //println(name);
    }else
    {
      name_[0] = "Hidden Layer∈R";
      name_[1] = str(n_num);
      name = join(name_,"");   
      //println(name);
    }
    
    nodes_num = n_num;
    x_start = x_s;
    y_start = y_s;
    y_space = y_sp;
    centerY = y_s + (n_num-1)*y_sp/2;
    buttomY = y_s + (n_num)*y_sp;
    neurons = new ArrayList<Neuron>();
    
    for(int i=0; i < nodes_num; i++){
      temp_n = new Neuron(x_start, y_start + i*y_space);
      addNeuron(temp_n);
     };
  }
  
  
  // Add a Neuron
  void addNeuron(Neuron n) {
     neurons.add(n);
  } 

  // Draw Layers
  void display() {
      if (nodes_num <= 10){
         for (Neuron n : neurons) {
        n.display(); 
      }
        
    }
    //String[] list = split(name, '-');
    //println(list[1]);
    textSize(10);
    text(name, x_start - 50, buttomY + 10); 
    //textAlign(RIGHT,TOP);
    //text(list[1], x_start - 50 , buttomY + 10); 
    //textAlign(BASELINE);
  }
}
