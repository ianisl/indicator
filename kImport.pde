void loadVecData(String dataPath, ArrayList collection) {
  String[] data= loadStrings(dataPath);  
  for (int i=0;i<data.length;i++) {
    data[i]=data[i].replace("{", "");
    data[i]=data[i].replace("}", ""); 
    String[]fields = split(data[i], ",");
    float x = float (fields[0]);
    float y = float (fields[1]);
    float z = 0;
    //if(float (fields[2])>0) { z = float (fields[2]);}
    Vec3D pointLoc = new Vec3D(x, y, z); 
    collection.add(pointLoc);
  }
}
