

// robert stuart-smith | copyright kokkugia | www.kokkugia.com | 2010
// this code is distributed for purposes of Strelka workshop only. Special persmission from the author required for any other use.



void keyPressed() {
    // default properties load/save key combinations are 
  // alt+shift+l to load properties
  // alt+shift+s to save properties
  if (key=='1') {
    cp5.saveProperties(("hello.properties"));
  } 
  else if (key=='2') {
    cp5.loadProperties(("hello.properties"));
  }

  //export 
  if (key == 'e') {
    kExport();
  }

  //exports current frame as jpg
  if (key == 'i') {
    saveFrame("exports/"+ "frame" + frameCount + ".jpg");
  }


  //pause simulation
  if (key == 'p') {
    if (pause == true) {
      pause = false;
    }
    else {
      pause = true;
    }
  }

  //reset simulation
  if (key == 'r') {
    setup();
  }

  //reset simulation
  if (key == 's') {
    if ( showSprings == true) {
      showSprings = false;
    }
    else {
      showSprings = true;
    }
  }



  //background image display toggle
  if (key == 'b') {
    if (showBackgroundImage == true) {
      showBackgroundImage = false;
    }
    else {
      showBackgroundImage = true;
    }
  }
}




Vec3D vecLimit(Vec3D vec1, float maxMag) {
  if (vec1.magnitude() > maxMag) {
    vec1 = vec1.getNormalizedTo(maxMag);
  }
  return vec1;
}







public void controlEvent(ControlEvent theEvent) {
 
  println(theEvent.controller().name());

  if (theEvent.controller().name() == "Make Initial Agents") {
    if (initialAgents == false) {
      initialAgents = true;
    }
    else {
      initialAgents = false;
    }
  }
  
    if (theEvent.controller().name() == "Make G1") {
    if (G1 == false) {
      G1 = true;
    }
    else {
      G1 = false;

    }
  }
  
      if (theEvent.controller().name() == "Make G2") {
    if (G2 == false) {
      G2 = true;
    }
    else {
      G2 = false;
    }
  }

      if (theEvent.controller().name() == "Make G3") {
    if (G3 == false) {
      G3 = true;
    }
    else {
      G3 = false;
    }
  }

    if (theEvent.controller().name() == "Make Attractors") {
    if (makeAttr == false) {
      makeAttr = true;
    }
    else {
      makeAttr = false;
    }
  }
<<<<<<< HEAD
  if (theEvent.controller().name() == "Make Attractors 2") {
=======
  
    if (theEvent.controller().name() == "Make Attractors 2") {
>>>>>>> aa329671745100d575054a2bd4695eaca8babd35
    if (makeAttr2 == false) {
      makeAttr2 = true;
    }
    else {
      makeAttr2 = false;
    }
  }
  

  if (theEvent.controller().name() == "Pause") {
    if (pause == false) {
      pause = true;
    }
    else {
      pause = false;
    }
  }

  if (theEvent.controller().name() == "Export")  kExport();

  if (theEvent.controller().name() == "ImageBehaviour") {
    if (imageToggle == false) {
      imageToggle = true;
    }
    else {
      imageToggle = false;
    }
  }

  if (theEvent.controller().name() == "ImageDisplay") {
    if (showBackgroundImage == false) {
      showBackgroundImage = true;
    }
    else {
      showBackgroundImage = false;
    }
  }

  if (theEvent.controller().name() == "Debug") {
    if (isDebug == false) {
      isDebug = true;
    }
    else {
      isDebug = false;
    }
  }

  if (theEvent.controller().name() == "Restart") setup();
}

