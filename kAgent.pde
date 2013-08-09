
//XXXXX agentclass
// robert stuart-smith | copyright kokkugia | www.kokkugia.com | 2013
// based on kAgent - roland snooks | kokkugia | www.kokkugia.com  | 2007
// this code is distributed for purpose of Strelka workshop only. Special written persmission from the author required for any other use.

class kAgent {

  Vec3D pos;
  Vec3D vel;
  Vec3D acc;

  float maxVel;
  float maxForce;
  float rangeOfVis;
  float Bounce;
  boolean active;
  int agentIndex;

  ArrayList neighborList;
  ArrayList neighborListClosest;
  ArrayList neighborListBig2;
  ArrayList neighborListBig3;
  ArrayList myTrailPos;
  ArrayList springList;
  ArrayList springAgentList;

  int type;
  int type1neighbourCount = 0;
  int type2neighbourCount = 0;
  int type3neighbourCount = 0;
  int type4neighbourCount = 0;
  int type1closestNeighbourCount = 0;
  int type2closestNeighbourCount = 0;
  int type3closestNeighbourCount = 0;
  int type4closestNeighbourCount = 0;
  int lifeSpan = 0;

  int highestCpt[] = new int[2];

  // constructor---------------
  kAgent(Vec3D _pos, Vec3D _vel, float _maxVel, float _maxForce, int _type, boolean _active) {

    neighborList = new ArrayList(); 
    neighborListClosest = new ArrayList(); 
    neighborListBig2 = new ArrayList(); 
    neighborListBig3 = new ArrayList(); 
    agentPop.add(this); //add agent to global agent arraylist
    active = _active;
    pos = _pos;
    acc = new Vec3D(0, 0, 0);
    vel = _vel;


    agentIndex = agentNum;//stores position in global countt
    agentNum++;//global count of agents 

    maxVel = globalMaxVel;//_maxVel;
    maxForce = globalMaxForce;// _maxForce;
    type = _type;
    springList = new ArrayList(); 
    springAgentList = new ArrayList();

    //-------THIS CAN CHANGE-----------------------
    Bounce = 0.1;
    rangeOfVis = 40;
    lifeSpan = 140;
    //-------------------------------------------------
  }


  void update() {
    /*
    //ranges of vision per agent type
     if (type == 1) rangeOfVis = 20 * globalVision;
     if (type == 2) rangeOfVis = 25 * globalVision;
     if (type == 3)  rangeOfVis = 15 * globalVision;
     if (type == 4)  rangeOfVis = 10 * globalVision;
     if (type == 5)  rangeOfVis = 30 * globalVision;
     */
    /*
    //example of type changes
     if (type4neighbourCount > 4) type = 1;
     if ((type1neighbourCount > 4) && (type == 3 )) type = 4;
     // if ((type2neighbourCount > 1) && (type == 3 )) lifeSpan+= 200;
     if ((type4neighbourCount > 5) && (type == 4 )) type = 2;
     if ((type2neighbourCount > 4) && (type == 2 )) type = 3;
     if ((type3neighbourCount > 6) && (type == 3 )) type = 5;
     if ((type3neighbourCount > 4) && (type == 2 )) type = 4;
     if ((type1neighbourCount > 6) && (type == 1 )) type = 5;
     if ((type4neighbourCount > 4) && (type == 4 )) type = 3;
     */





    if (active == true) {
      //create zero length vectors for each behavioural method
      acc = new Vec3D();  
      Vec3D coh = new Vec3D();
      Vec3D sep = new Vec3D();
      Vec3D sep1 = new Vec3D();
      Vec3D sep2 = new Vec3D();
      Vec3D ali = new Vec3D();
      Vec3D wan = new Vec3D();

      //--GET AGENT NEIGHBOURS-------------------------------------
      neighborList = getNeighbours(agentPop, rangeOfVis * 1);
      neighborListClosest = getNeighboursClosest(agentPop, rangeOfVis * 0.01);
      neighborListBig2 = getNeighboursBig(agentPop, rangeOfVis * 5, 2);
      neighborListBig3 = getNeighboursBig(agentPop, rangeOfVis * 10, 3);
      //example of rule to kill cells if density is too high
      //if (neighborList.size() > 20) terminate();

      if ((type2closestNeighbourCount > 1) && (type == 1)) {
        type = 1; active = false;
      }
      if ((type1closestNeighbourCount > 10) && (type == 1) && (active == true)) {
        type = 4; active = false; rangeOfVis = type4closestNeighbourCount*0.5;
      }

      if ((type4closestNeighbourCount > 5) && (type == 4) && (active == false)) {
        type = 4; 
        active = false;
        rangeOfVis = type4closestNeighbourCount;
      }

      if ((type3closestNeighbourCount > 1) && (type == 1)) terminate();

      //example of conditional rule to break spring
      //if (type == 1)  breakSpringNum(2);





      //example of simple agent behaviour
      // behaviours (0.0, 0.3, 0.3, 1.4, 0.0, 1.0, 10.0, 1.0 );//wanScale, cohscale, sepscale,aliscale, cohrange,seprange,alirange

      ///*
      //example of behavioural rules based on agent type
      if (type == 1)behaviours (wanScale1, springscale1, cohscale1, SepScale1, aliscale1, cohrange1, seprange1, alirange1);//wanScale, springscale, cohscale, sepscale,aliscale, cohrange,seprange,alirange
      if (type == 2)behaviours (wanScale2, springscale2, cohscale2, SepScale2, aliscale2, cohrange2, seprange2, alirange2);//wanScale, springscale, cohscale, sepscale,aliscale, cohrange,seprange,alirange
      if (type == 3)behaviours (wanScale3, springscale3, cohscale3, SepScale3, aliscale3, cohrange3, seprange3, alirange3);//wanScale, springscale, cohscale, sepscale,aliscale, cohrange,seprange,alirange
      /* if (type == 4)behaviours (0.2, 0.1, 0.3, SepScale4, 0.2, 1.0, 8.0, 1.0 );//wanScale, springscale, cohscale, sepscale,aliscale, cohrange,seprange,alirange
       if (type == 5)behaviours (0.2, 0.1, 0.3, SepScale5, 0.2, 1.0, 8.0, 1.0 );//wanScale, springscale, cohscale, sepscale,aliscale, cohrange,seprange,alirange
       */


      //wan = wander();
      //wan.scaleSelf(0.6);
      //acc.addSelf(wan);

      if (imageToggle == true) {
        //example of image attraction/repulsion behaviour
        //seekImage("green", 2, true);//string Colour, int imgRange, boolean attract
        //seekImage("blue", 2, false);
      }

      //---UPDATE POSITION WITH NEW VECTORS-------------------------------------------------
      vel.addSelf(acc);//add accelleration to velocity  
      vel = vecLimit(vel, maxVel);//limit velocity

      //example of fixing location of an agent based on type



      pos.addSelf(vel);//add this velocity to agent current position

      //----UPDATE POSITION IN ENVIRONMENT---------
      checkBoxCollision();//bounce off box boundary   
      //torusSpace();

      //--make or break temporary springs
      breakSpringDist();

      // breakSpring(rangeOfVis);  
      //makeSpring(neighborList,rangeOfVis);

      /*
      if ((lifeSpan < 50) && (type == 3)) { 
       // seedAgentSprings(50, 4);
       }
       else {
       
       if ((lifeSpan < 100) && (type == 3)) { 
       active = true;
       }
       
       else {
       if ((lifeSpan > 100) && (type == 3)) {
       active = false;
       }
       else {
       vel = new Vec3D();
       }
       }
       }
       }
       
       */
    }


    //  lifeSpan--;

    //  if ((lifeSpan == 0) && (springList.size() == 0)) terminate();

    render();
  }


  void behaviours(float wanScale, float sprScale, float cohScale, float sepScale, float aliScale, float cohRange, float sepRange, float aliRange) {

    Vec3D coh = new Vec3D();
    Vec3D coh1 = new Vec3D();
    Vec3D coh2 = new Vec3D();
    Vec3D coh3 = new Vec3D();
    Vec3D sep = new Vec3D();
    Vec3D sep1 = new Vec3D();
    Vec3D sep3 = new Vec3D();
    Vec3D ali = new Vec3D();
    Vec3D wan = new Vec3D();
    Vec3D spr = new Vec3D();

    //calculate forces
    if ((type==1)&&(active==true)) {
      coh1 = cohesion(neighborList, rangeOfVis * cohRange);
      coh2 = cohesionType(neighborListBig2, rangeOfVis * 2, 2);
      coh3 = cohesionType(neighborListBig3, rangeOfVis * 10, 3);
      
      coh1.scaleSelf(cohScale);
      coh2.scaleSelf(cohscale2);
      coh3.scaleSelf(cohscale3);
    
      coh = coh1.copy();
      coh.addSelf(coh2);
      coh.addSelf(coh3);
    } else {
      coh = cohesion(neighborList, rangeOfVis * cohRange);
    }

    if ((type==10)&&(active==true)) {
      sep = separation(neighborList, rangeOfVis * sepRange);
      sep3 = separationType(neighborListBig3, rangeOfVis * sepRange*10, 3);
      
      sep1.scaleSelf(sepScale);
      sep3.scaleSelf(sepScale);
    
      sep = sep1.copy();
      sep.addSelf(sep3);
    } else {
      sep = separation(neighborList, rangeOfVis * sepRange);
    }
    
    ali = align(neighborList, rangeOfVis * aliRange);
    wan = wander();
    spr = springForce(vel); 

    //scale forces
    coh.scaleSelf(cohScale);
    sep.scaleSelf(sepScale);
    ali.scaleSelf(aliScale);
    wan.scaleSelf(wanScale);
    spr.scaleSelf(sprScale);


    //add forces to accelleration
    acc.addSelf(coh);
    acc.addSelf(sep);
    acc.addSelf(ali);
    acc.addSelf(wan);
    acc.addSelf(spr);


    //----SPRING BEHAVIOURS-------------

    if (frameCount > 90) {

      if (type == 1) makeSpring(5, 3, 6, neighborList, sepRange*2.7);//int otherAgentType, int mySpringLimit, int otherSpringLimit, ArrayList pop, float connectDist
      //if (type == 1) makeSpring(1, 3, 3, neighborList, sepRange*1.7);//int otherAgentType, int mySpringLimit, int otherSpringLimit, ArrayList pop, float connectDist
      //if (type == 1) makeSpring(3, 3, 3, neighborList, sepRange*1.7);//int otherAgentType, int mySpringLimit, int otherSpringLimit, ArrayList pop, float connectDist
      //if (type == 2) makeSpring(1, 2, 2, neighborList, sepRange*1.7);//int otherAgentType, int mySpringLimit, int otherSpringLimit, ArrayList pop, float connectDist
      //if (type == 3) makeSpring(3, 3, 3, neighborList, sepRange*1.7);//int otherAgentType, int mySpringLimit, int otherSpringLimit, ArrayList pop, float connectDist
      //if (type == 4) makeSpring(2, 1, 2, neighborList, sepRange*1.7);//int otherAgentType, int mySpringLimit, int otherSpringLimit, ArrayList pop, float connectDist
      //if (type == 5) makeSpring(3, 6, 3, neighborList, sepRange*1.9);//int otherAgentType, int mySpringLimit, int otherSpringLimit, ArrayList pop, float connectDist

      // if (type == 5) makeSpring(5, 6, 2, neighborList, sepRange*1.9);//int otherAgentType, int mySpringLimit, int otherSpringLimit, ArrayList pop, float connectDist
    }
  }



  ArrayList getNeighbours(ArrayList pop, float range) {

    ArrayList neigh = new ArrayList();
    type4neighbourCount = 0;
    float clstDist = 999999999;

    for (int i = 0 ; i < pop.size(); i++) {
      kAgent a = (kAgent) pop.get(i);
      if (a != this) {
        float d = pos.distanceTo(a.pos);
        if ( (d < range) && (d > 0) ) {
          //  if (checkifinList(neigh, a) == false) {
          neigh.add(a);
          
          if (a.type == 1) type1neighbourCount++;
          if (a.type == 2) type2neighbourCount++;
          if (a.type == 3) type3neighbourCount++;
          if (a.type == 4) type4neighbourCount++;

          //   }
        }
      }
    }
    return neigh;
  }

ArrayList getNeighboursClosest(ArrayList pop, float range) {

    ArrayList neigh = new ArrayList();
    type4neighbourCount = 0;
    float clstDist = 999999999;

    for (int i = 0 ; i < pop.size(); i++) {
      kAgent a = (kAgent) pop.get(i);
      if (a != this) {
        float d = pos.distanceTo(a.pos);
        if ( (d < range) && (d > 0) ) {
          //  if (checkifinList(neigh, a) == false) {
          neigh.add(a);
          
          if (a.type == 1) type1closestNeighbourCount++;
          if (a.type == 2) type2closestNeighbourCount++;
          if (a.type == 3) type3closestNeighbourCount++;
          if (a.type == 4) type4closestNeighbourCount++;

          //   }
        }
      }
    }
    return neigh;
  }

ArrayList getNeighboursBig(ArrayList pop, float range, int otherAgentType) {

    ArrayList neigh = new ArrayList();

    float clstDist = 999999999;

    for (int i = 0 ; i < pop.size(); i++) {
      kAgent a = (kAgent) pop.get(i);
      if (a != this) {
        if (a.type == otherAgentType) 
        {
          float d = pos.distanceTo(a.pos);
          if ( (d < range) && (d > 0) ) {
            //  if (checkifinList(neigh, a) == false) {
            neigh.add(a);
            //   }
          }
        }
      }
    }
    return neigh;
  }    

 void seekImage(String Colour, int imgRange, boolean attract) {

    //get closest pixel position of agent
    int indexX = int(pos.x); 
    int indexY = int(pos.y); 
    //set up variables
    int highestC = 0;
    
    highestCpt[0] = 0;
    highestCpt[1] = 0;

    //loop through pixel neighbourhood range and find highest colour value in range
    for (int i =  indexX - imgRange; i < indexX + imgRange; i ++ ) {
      for (int j =  indexY - imgRange; j < indexY + imgRange; j ++ ) {
        if ((i != 0) && (j != 0) && i != boxWidth && i != boxHeight) {
          int x = i;
          int y = j;

          if (x < 0) x = boxWidth + x;
          if (y < 0) y = boxHeight + y;

          if (x > boxWidth) x =  x - boxWidth;
          if (y > boxHeight) y = y - boxHeight;

          x = max(min(0, x), boxWidth - 1);
          y = max(min(0, y), boxHeight - 1);

          ArrayList<Integer> col = imageMap[x][y];
          int C = 0;

          if (col != null) {
            if (Colour == "red") {
              C = col.get(0);
            }
            if (Colour == "green") {
              C = col.get(1);
            }
            if (Colour == "blue") {
              C = col.get(2);
            }

            if (C > highestC) {

              highestC = C;
              highestCpt[0] = x;
              highestCpt[1] = y;
            }
          }
        }
      }
    }
/*
    //make colour pixel location a vector
    Vec3D Rvec = new Vec3D(int(highestCpt[0]), int(highestCpt[1]), 0);

    //make a gradient falloff attractor function to pixel location
    float rDist = Rvec.distanceTo(pos);
    if ((rDist > 0) && (highestC > 100)) {
      Vec3D attR = Rvec.copy();
      Vec3D seekR = steer(attR);

      if (attract == true) {
        seekR.scaleSelf(-(highestC - 100)*0.01 * (1-( (rDist/imgRange)) * (1-(rDist/imgRange))));
      }
      else {
        seekR.scaleSelf((highestC - 100)*0.01 * (1-( (rDist/imgRange)) * (1-(rDist/imgRange))));
      }
      seekR = vecLimit(seekR, maxForce); 
      //update agent accelleration
      acc.subSelf(seekR);
    */  }


  void makeSpring(int otherAgentType, int mySpringLimit, int otherSpringLimit, ArrayList pop, float connectDist) {

    for (int i = 0 ; i < pop.size(); i++) {
      kAgent other = (kAgent) pop.get(i);

      int testconnection = 0;
      for (int j = 0; j < springAgentList.size();j++) {
        if (springAgentList.get(j) ==  other) {
          testconnection = 1;
        }
      }

      if (testconnection == 0) {
        if (other.type == otherAgentType) {
          if ((springList.size() < mySpringLimit) && (other.springList.size() < otherSpringLimit)) { 
            float  dist = pos.distanceTo(other.pos);
            if ((dist > 0) && (dist < connectDist)) {
              spring s = new spring(this, other, dist*1.1, 1.0, 1);

              //event based rules when spring is made
              if (type == 1) type = 1;
              if ((type == 5) && (other.type == 5)) other.type = 2;

              /*
             
               if ((type == 3) && (other.type == 3)) {
               if (random(1) > 0.98) {
               Vec3D p = new Vec3D(pos.x + other.pos.x, pos.y + other.pos.y, pos.z + other.pos.z);
               Vec3D v = new Vec3D(random(1) * -random(1), random(1) * -random(1), 0);
               kAgent b = new kAgent ( p, v, 3, 1.5, 4, true);//position, velocity, maxVel, maxForce, type, active
               if ((type4neighbourCount > 3) && (type == 4 )) {
               terminate();
               break;
               }
               
               
               
               //check if this will be created ontop of others
               for (int j = 0 ; j < neighborList.size(); j++) {
               kAgent a = (kAgent) neighborList.get(j);
               if (a != b) {
               float d = b.pos.distanceTo(a.pos);
               if ( d < 20 ) {
               b.terminate();
               break;
               }
               }
               }
               
               
               //b.lifeSpan = 50;
               }
               
               
               }
               
               */



              break;
            }
          }
        }
      }
    }
  }


  /*

   // breakSpring
   void breakSpringForce(float snapMultiplier) {
   kAgent other;
   for (int i = 0; i < springList.size(); i++) {
   Vec3D sForce = pos.copy(); 
   spring s = (spring) springList.get(i);
   // get a vector to the agent at the other end of the spring
   if (this == s.agent1) {
   other = s.agent2;
   }
   else {
   other = s.agent1;
   }
   
   sForce.subSelf(other.pos);
   
   // adjust vector basd on the springs restlength and force
   if ((snapMultiplier*s.restLength/110 > sForce.magnitude()) && (sForce.magnitude() < snapMultiplier*s.restLength/150)) {
   
   
   for (int j =0; j<s.agent1.springList.size();j++) {
   
   spring tempSpring = (spring) s.agent1.springList.get(j); 
   springPop.remove(tempSpring);
   }
   springPop.remove(s);
   springList.remove(s);
   agentPop.remove(s.agent1);
   springAgentList.remove(s);
   }
   }
   }
   */

  // breakSpring
  void breakSpringDist() {

    for (int i = 0; i < springList.size(); i++) {
      spring s = (spring) springList.get(i);
      kAgent a = s.agent1;
      kAgent b = s.agent2;
      float distance = a.pos.distanceTo(b.pos);
      if (distance > (boxHeight*0.4)) {
        s.removeSpring(s);
      }
    }
  }




  // breakSpring
  void breakSpringNum(int maxSprings) {

    for (int i = springList.size()-1; i > maxSprings ; i--) {
      if ( i > maxSprings) {
        spring s = (spring) springList.get(i);
        s.removeSpring(s);
      }
    }
  }


  void terminate() {

    for (int i = 0; i < springList.size(); i++) {
      spring s = (spring) springList.get(i);
      s.removeSpring(s);
    }


    agentPop.remove(this);
    agentNum--;

    for (int i = agentIndex; i < agentPop.size(); i++) {
      kAgent a = (kAgent) agentPop.get(i);

      a.agentIndex-=1;
    }
  }


  void seedAgentSprings(float springLength, int seedNumber) {

    for (int i = 0; i < seedNumber ; i++) {

      Vec3D    v = (Vec3D) new Vec3D((random(1) -random(1)) * springLength*100, (random(1) -random(1)) * springLength*100, 0);
      kAgent a = new kAgent ( pos, new Vec3D(0, 0, 0), 1, 1, 4, true);
      a.pos.addSelf(v);
      //a.torusSpace();
      float dist = a.pos.distanceTo(pos);
      spring s = new spring(this, a, dist, 1.0, 1);
    }
    lifeSpan = 300;
  }





  Vec3D springForce(Vec3D vel) {
    Vec3D sum = new Vec3D();
    int count = 0;

    // loop through this agents springs
    for (int i = 0; i < springList.size(); i++) {
      Vec3D sForce = pos.copy(); 
      spring s = (spring) springList.get(i);

      // get a vector to the agent at the other end of the spring with a length
      if (this == s.agent1) {
        sForce.subSelf(s.agent2.pos);
      }
      else {
        sForce.subSelf(s.agent1.pos);
      }

      // get difference in spring length to rest length
      float diff = (sForce.magnitude() - s.restLength);
      sForce.normalize();
      //adjust vector based on spring stiffness, displacement and dampening constant in relation to spring velocity
      sForce.x = sForce.x*(diff*s.stiffness - vel.x*s.dampening); // LOOK AT HOOKES LAW
      sForce.y = sForce.y*(diff*s.stiffness - vel.y()*s.dampening);
      sForce.z = sForce.z*(diff*s.stiffness - vel.z()*s.dampening);
      //invert force to propel spring in oppposite direction
      sForce.invert();

      //add this spring value to a vector that will add all spring influences on this agent
      sum.addSelf(sForce);
      count++;
    }

    if (springList.size() > 0) {
      sum.scaleSelf(1/(float)count);
    }
    return sum;
  }


  Vec3D cohesion(ArrayList pop, float cohRangeOfVis) {
    //create a new vector called sum
    Vec3D sum = new Vec3D(0, 0, 0);
    int count = 0;
    //loop through all agents in pop
    for (int i = 0; i < pop.size(); i++) {
      //get other agent
      kAgent other = (kAgent) pop.get(i);
      //  check distance to other agent
      float dist = pos.distanceTo(other.pos);
      //  if within range: add their position to sum
      if ((dist > 0) && (dist < cohRangeOfVis)) {
        if(isDebug==true) {
          strokeWeight(1);
          stroke(150,0,0);
          line(pos.x, pos.y, other.pos.x, other.pos.y);
        }   
        sum.addSelf(other.pos);
        count++;
      }
    }
    //scale sum based on number of agents in range
    if (count > 0) {
      sum.scaleSelf(1/(float)count);
      //work out direction to sum from my current postion
      sum.subSelf(pos);
      //limit this vector by max force
      sum = vecLimit(sum, maxForce);
    }
    //return vector
    return sum;
  }


  Vec3D cohesionType(ArrayList pop, float cohRangeOfVis, int otherAgentType) {
    //create a new vector called sum
    Vec3D sum = new Vec3D(0, 0, 0);
    int count = 0;
    //loop through all agents in pop
    for (int i = 0; i < pop.size(); i++) {

      //get other agent
      kAgent other = (kAgent) pop.get(i);
      if (other.type == otherAgentType) 
      {  
        //  check distance to other agent
        float dist = pos.distanceTo(other.pos);

        //  if within range: add their position to sum
        if ((dist > 0) && (dist < cohRangeOfVis)) {

          // if points are very close
          if ((dist >0) && (dist < (cohRangeOfVis * 0.3))) {
            Vec3D vec = other.pos.sub(pos);
            vec.scaleSelf(pow(100/dist, 2));
            sum.addSelf(vec);
            count++;
          } else {
            Vec3D vec = other.pos.sub(pos);
            vec.scaleSelf(1 / dist);
            sum.addSelf(vec);
            count++;
          }

          if(isDebug==true) {
            strokeWeight(1);
            stroke(min((500/dist)*255,255),0,0);
            line(pos.x, pos.y, other.pos.x, other.pos.y);
          }
        } 
      }
    }
    //scale sum based on number of agents in range
    if (count > 0) {
      sum.scaleSelf(1/(float)count);
      //work out direction to sum from my current postion
      //sum.subSelf(pos);
      //limit this vector by max force
      sum = vecLimit(sum, maxForce);
    }
    //return vector
    return sum;
  }

  Vec3D separation(ArrayList pop, float sepRangeOfVis) {
    //create a new vector called sum
    Vec3D sum = new Vec3D(0, 0, 0);
    int count = 0;
    //loop through all agents in pop
    for (int i = 0; i < pop.size(); i++) {
      //get other agent
      kAgent other = (kAgent) pop.get(i);
      //  check distance to other agent
      float dist = pos.distanceTo(other.pos);
      //  if within range: add their position to sum
      if ((dist > 0) && (dist < sepRangeOfVis)) {
        Vec3D vec = pos.sub(other.pos);
        vec.scaleSelf(1/dist);
        sum.addSelf(vec);
        count++;
        if(isDebug==true) {
          strokeWeight(1);
          stroke(0,150,0);
          line(pos.x, pos.y, other.pos.x, other.pos.y);
        }
      }
    }
    //scale sum based on number of agents in range
    if (count > 0) {
      sum.scaleSelf(1/(float)count);
      //limit this vector by max force
      sum = vecLimit(sum, maxForce);
    }
    //return vector
    return sum;
  }


  Vec3D separationType(ArrayList pop, float sepRangeOfVis, int otherAgentType) {
    //create a new vector called sum
    Vec3D sum = new Vec3D(0, 0, 0);
    int count = 0;
    //loop through all agents in pop
    for (int i = 0; i < pop.size(); i++) {
      //get other agent
      kAgent other = (kAgent) pop.get(i);


      if (other.type == otherAgentType) 
      {
        //  check distance to other agent
        float dist = pos.distanceTo(other.pos);

        //  if within range: add their position to sum
        if ((dist > 0) && (dist < sepRangeOfVis)) 
        {          
          Vec3D vec = pos.sub(other.pos);
          vec.scaleSelf(dist);
          sum.addSelf(vec);
          count++;
          if(isDebug==true) {
            strokeWeight(1);
            stroke(0,255,0);
            line(pos.x, pos.y, other.pos.x, other.pos.y);
          }
        }
      }
    }
    //scale sum based on number of agents in range
    if (count > 0) {
      sum.scaleSelf(1/(float)count);
      //limit this vector by max force
      sum = vecLimit(sum, maxForce);
    }
    //return vector
    return sum;
  }


  Vec3D align(ArrayList pop, float cohRangeOfVis) {
    //create a new vector called sum
    Vec3D sum = new Vec3D(0, 0, 0);
    int count = 0;
    //loop through all agents in pop
    for (int i = 0; i < pop.size(); i++) {
      //get other agent
      kAgent other = (kAgent) pop.get(i);
      //  check distance to other agent
      float dist = pos.distanceTo(other.pos);
      //  if within range: add their position to sum
      if ((dist > 0) && (dist < cohRangeOfVis)) {
        sum.addSelf(other.vel);
        count++;
      }
    }
    //scale sum based on number of agents in range
    if (count > 0) {
      sum.scaleSelf(1/(float)count);
      //limit this vector by max force
      sum = vecLimit(sum, maxForce);
    }
    //return vector
    return sum;
  }



  Vec3D steer(Vec3D target) {
    Vec3D steer;  // The steering vector
    target.subSelf(pos); 
    float distance = target.magnitude();
    if (distance > 0) {
      target.normalize();
      target.scaleSelf(maxVel);
      target.subSelf(vel); 
      target = vecLimit(target, maxForce);
    } 
    else {
      target = new Vec3D(0, 0, 0);
    }
    return target;
  }


  Vec3D wander() {
    float wanderR = 16;         // Radius for our "wander circle"
    float wanderD = 60;         // Distance for our "wander circle"
    float change = 60.25;
    float wandertheta = 0;
    wandertheta += random(-change, change);     // Randomly change wander theta
    //println("wandertheta = " + wandertheta);
    // Now we have to calculate the new location to steer towards on the wander circle
    Vec3D circleloc = vel.copy();// Start with velocity
    circleloc.normalize();
    circleloc.scaleSelf(wanderD);          // Multiply by distance
    circleloc.addSelf(pos);               // Make it relative to agent's location

    Vec3D circleOffSet = new Vec3D(wanderR*cos(wandertheta), wanderR*sin(wandertheta), 0);
    circleOffSet.addSelf(circleloc);
    return steer(circleOffSet);  // Steer towards it
  }  


  void checkBoxCollision() {

    if (pos.x < 0) {
      vel.x = vel.x*-1;
      vel.x *= Bounce;
    }
    if (pos.y < 0) {
      vel.y = vel.y*-1; 
      vel.y *= Bounce;
    }
    if (pos.z < 0) { 
      vel.z = vel.z*-1;
      vel.z *= Bounce;
    } 
    if (pos.x > boxWidth) {
      vel.x = vel.x*-1;
      vel.x *= Bounce;
    }
    if (pos.y > boxHeight) {
      vel.y = vel.y*-1; 
      vel.y *= Bounce;
    }
    if (pos.z > boxDepth) {
      vel.z = vel.z*-1; 
      vel.z *= Bounce;
    }

    if (pos.x < 0) pos.x = 0;
    if (pos.y < 0) pos.y = 0; 
    if (pos.z < 0) pos.z = 0; 
    if (pos.x > boxWidth) pos.x = boxWidth;
    if (pos.y > boxHeight) pos.y = boxHeight; 
    if (pos.z > boxDepth) pos.z = boxDepth;
  }


  /* void torusSpace() {
   //if ((springList.size()< 2) && (type == 2 )) acc.scaleSelf(10.0);
   
   if(springList.size()==0){
   if (pos.x > boxWidth) pos.x = pos.x - boxWidth;
   if (pos.x < 0) pos.x = pos.x + boxWidth;
   if (pos.y > boxHeight) pos.y = pos.y - boxHeight;
   if (pos.y < 0) pos.y = pos.y + boxHeight;
   if (pos.z > boxDepth) pos.z = pos.z - boxDepth;
   if (pos.z < 0) pos.z = pos.z + boxDepth;
   }
   else {
   if (pos.x<=0) {
   vel.x=-vel.x;
   }
   if (pos.x>=width) {
   vel.x=-vel.x;
   }
   if (pos.y<=0) {
   vel.y=-vel.y;
   }
   if (pos.y>=height) {
   vel.y=-vel.y;
   }
   
   }
   }*/

  void render() {
    float lineScale = 5.0;


    ///////////////////////////////////DRAW ATTRACTOR CROSS

    if (type == 3) {
      pushStyle();
      stroke(255, 30);
      strokeWeight(5);
      //line(pos.x,0,pos.x,height);
      //line(0,pos.y,width,pos.y);
      popStyle();
    }


    ///////////////////////////////////DRAW ATTRACTOR CROSS


    if (type == 1) {
      stroke(255, 0, 0);
    }
    if (type == 2) {
      stroke(0, 255, 0);
    }
    if (type == 3) {
      strokeWeight(5.0);
      stroke(0, 0, 255);
    }
    if (type == 4) {
      stroke(186, 85, 211);
      noFill();
      ellipse(pos.x, pos.y, rangeOfVis*.75, rangeOfVis*.75);
    }
    if (type == 5) {
      stroke(238, 130, 238);
    }

    //strokeWeight(2.0);
    //

    //strokeWeight(20.1);
    point(pos.x, pos.y, pos.z);
    strokeWeight(3.1);
    line(pos.x, pos.y, pos.z, pos.x - lineScale*vel.x, pos.y - lineScale*vel.y, pos.z - lineScale*vel.z);
  }
}


