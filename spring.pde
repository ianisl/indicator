
// kokkugia |  www.kokkugia.com  |  2010
// this code is distributed for purpose of Strelka workshop only. Special written persmission from the author required for any other use.

class spring {


  //states
  kAgent agent1;
  kAgent agent2;
  float restLength;
  float stiffness;
  float dampening;

  // constructor---- (agent1,agent2, restlength, true or false, index, stiffness, dampening)
  spring(kAgent _agent1, kAgent _agent2, float _restLength, float _stiffness, float _dampening) {

    agent1 = _agent1;  
    agent2 = _agent2;
    restLength = _restLength;
    stiffness = _stiffness;
    dampening = _dampening;

    addSpring ();
  }

  void update() {
    render();
  }


  void addSpring () {
    agent1.springList.add(this);
    agent2.springList.add(this);
    springPop.add(this);
    agent1.springAgentList.add(agent2);
    agent2.springAgentList.add(agent1);
  }

  void removeSpring (spring s) {
    s.agent1.springList.remove(s);
    s.agent2.springList.remove(s);
    springPop.remove(s);
    s.agent1.springAgentList.remove(s.agent2);
    s.agent2.springAgentList.remove(s.agent1);
  }



  // render - renders all springs
  void render() {

    if ( showSprings == true) {
      stroke(89, 198, 251);
      strokeWeight(0.7); 
      line(agent1.pos.x, agent1.pos.y, agent1.pos.z, agent2.pos.x, agent2.pos.y, agent2.pos.z);
    }
  }
}

