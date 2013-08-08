// robert stuart-smith | kokkugia | www.kokkugia.com | 2012
// this code is distributed for purpose of Strelka workshop only. Special written persmission from the author required for any other use.

void kExport() {

  
  //create agents export file---------------------------------------------------------
  //exports a line per agent:  posx,posy,posz velx,vel.y,vel.z rangeofvision indexconnectedagent1,indexconnectedagent2,indexconnectedagent3,etc
  //-----------------------------------------------------------------------------------
  ArrayList agentPos = new ArrayList();
  ArrayList agentVel = new ArrayList();
  ArrayList agentRange = new ArrayList();
  ArrayList agentConnections = new ArrayList();

  output = createWriter("exports/"+ "agents" + frameCount + ".txt"); 

  for (int i=0;i<agentPop.size();i++) {
    kAgent a = (kAgent) agentPop.get(i);

    //get and store position in array
    Vec3D pt = a.pos.copy();
    agentPos.add(pt);

    //get and store velocity in array
    Vec3D v = a.vel.copy();
    agentVel.add(v);

    //get and store range of vision in array (circle radius)
    float r = (float) a.rangeOfVis;
    agentRange.add(r);

    //get and store integers of agents i'm connected to
    String tempList = "";
    for (int j = 0; j < a.springAgentList.size(); j++) {
      kAgent a2 = (kAgent) a.springAgentList.get(j);
      if (j == 0) {
        tempList = tempList +  str(a2.agentIndex);
      }
      else {
        tempList = tempList + "," + str(a2.agentIndex);
      }
    }
    //println(tempList);
    agentConnections.add(tempList);
  }


  for (int i=0;i<agentPos.size();i++) {
    String tempStr = "";
    Vec3D pA = (Vec3D) agentPos.get(i);
    Vec3D pB = (Vec3D) agentVel.get(i);

    tempStr = tempStr + pA.x + "," + pA.y + "," + pA.z + " " + pB.x + "," + pB.y + "," + pB.z;

    float rA = (Float) agentRange.get(i);

    tempStr = tempStr + " " + str(rA);

    String st = (String) agentConnections.get(i);

    tempStr = tempStr + " " + st;

    output.println(tempStr);
  }



  output.flush();
  output.close();



  //create springs export file---------------------------------------------------------
    //exports a line per spring:  pos1x,pos1y,pos1z pos2x,pos2y,pos2z
  //-----------------------------------------------------------------------------------

  if (springPop.size() > 0) {

    ArrayList springLinesA = new ArrayList();
    ArrayList springLinesB = new ArrayList();

    output = createWriter("exports/"+ "springs" + frameCount + ".txt"); 

    for (int i=0;i<springPop.size();i++) {
      spring s = (spring) springPop.get(i);
      Vec3D p1 = s.agent1.pos.copy();
      Vec3D p2 = s.agent2.pos.copy();

      springLinesA.add(p1);
      springLinesB.add(p2);
    }


    for (int i=0;i<springLinesA.size();i++) {

      Vec3D p1 = (Vec3D) springLinesA.get(i);
      Vec3D p2 = (Vec3D) springLinesB.get(i);

      output.println(p1.x + "," + p1.y + "," + p1.z + " " + p2.x + "," + p2.y + "," + p2.z);
    }


    output.flush();
    output.close();
  }
}

