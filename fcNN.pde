import processing.svg.*;
Network network;
Layer[] layers;

void setup() {
  size(550, 400); 
  //size(400, 400);
  float x_start = width / 20. + 30 ;
  float y_start = height / 2. - 20 - 70;
  float x_space = 110;
  float y_space = 30;
  
  
  //float x_start = width / 20. + 60;
  //float y_start = height / 2. - 20;
  //float x_space = 110;
  //float y_space = 30;
  
  
  //int nn_stru[] = {2,10,10,10,10,10,10,10,10,10,10,1};
  //int nn_stru[] = {2,10,9,10,9,10,9,10,9,10,9,1};
  int nn_stru[] = {5,10,10,10,4};
  int l_length = nn_stru.length;
  

  // Create the Network object
  network = new Network(0,0);
  
  // Create a bunch of Neurons
  layers = new Layer[l_length];
  layers[0] = new Layer(0, nn_stru[0], 30, 30,  40);
  
  float temp_y_start = y_start;
  for (int i = 0; i < l_length; i++){
    if(i > 0){
      temp_y_start = layers[i-1].centerY - (nn_stru[i]-1)*y_space/2;
    }
    if(i == l_length-1){
      layers[i] = new Layer(-1, nn_stru[i], x_start+i*x_space, temp_y_start, y_space); 
    }else{
      layers[i] = new Layer(i, nn_stru[i], x_start+i*x_space, temp_y_start, y_space); 
    }
     
  }
  
  
  // Connect them
  for(int i = 0; i < l_length - 1; i++){
    network.connectLayer(layers[i],layers[i+1]);
  }
  
  // Add them to the Network
  for(int i =0; i < l_length; i++){
    network.addLayer(layers[i]);
  }
  noLoop();
  beginRecord(SVG, "fcNN.svg");
}

void draw() {
  //background(255,1.0);
  // Draw the Network
  network.display();
  endRecord();
  save("fcNN.png");
}
