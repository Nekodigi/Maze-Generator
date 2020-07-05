void keyPressed(){
  if(key == 's'){
    solving = true;
  }
  if(key=='r'){
    routeReset();
  }
  if(key=='m'){
    reset();
  }
  if(key=='h'){
    heurType++;
    if(heurType >= 4){
      heurType = 0;
    }
  }
  if(key=='d'){
    debugMode++;
    if(debugMode >= 3){
      debugMode = 0;
    }
  }
}

void mousePressed(){
  mazeErode();
}
