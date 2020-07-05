void mazeGen(){
  for(int n = 0; n < genIter; n++){//repeat
    genCurrent.visited = true;
    Spot neighbor = genCurrent.getNeighbor2();
    if(neighbor != null){
      genStack.add(neighbor);
      betWallBreak(genCurrent, neighbor);
      genCurrent = neighbor;
    }
    else if(genStack.size() > 0){
      genCurrent = genStack.remove(genStack.size()-1);
    }
    else{
      mazeBuilding = false;
      println("GENERATE DONE");
    }
  }
}
