void MakeInterface(boolean create){

if(create){
	step = sliderHeight;

  slInPop = cp5.addSlider("initialPopulation").setPosition(sliderX, step)
    .setSize(sliderWidth, sliderHeight).setMin(50).setMax(4500).setValue(initialPopulation);
  step += sliderHeight+sliderSpacing ;

  slGlVis = cp5.addSlider("globalVision").setPosition(sliderX, step)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(globalVision);
  step += sliderHeight+sliderSpacing ;

  slGlMaxForse = cp5.addSlider("globalMaxForce").setPosition(sliderX, step)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(globalVision);
  step += sliderHeight+sliderSpacing ;

  slGlMaxVel = cp5.addSlider("globalMaxVel").setPosition(sliderX, step)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(globalMaxForce);
  step += sliderHeight+sliderSpacing ;

  slSepS1 = cp5.addSlider("SepScale1").setPosition(sliderX, step)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(SepScale1);
  step += sliderHeight+sliderSpacing ;

  slSepS2 = cp5.addSlider("SepScale2").setPosition(sliderX, step)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(SepScale2);
  step += sliderHeight+sliderSpacing ;

  slSepS3 = cp5.addSlider("SepScale3").setPosition(sliderX, step)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(SepScale3);
  step += sliderHeight+sliderSpacing ;

  slSepS4 = cp5.addSlider("SepScale4").setPosition(sliderX, step)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(SepScale4);
  step += sliderHeight+sliderSpacing ;

  slSepS5 = cp5.addSlider("SepScale5").setPosition(sliderX, step)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(SepScale5);
  step += sliderHeight+sliderSpacing ;



  stepInGroup = 0 ;
  g1 = cp5.addGroup("g1").setPosition(sliderX, step+sliderSpacing*2)
    .setSize(groupWidth, sliderHeight).close();   
  elemInGr++;


  slWanScale1 = cp5.addSlider("wanScale1").setGroup(g1).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(wanScale1);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  slSprScale1 = cp5.addSlider("springscale1").setGroup(g1).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(springscale1);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  cslCohScale1 = cp5.addSlider("cohscale1").setGroup(g1).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(cohscale1);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  slAliScale1 = cp5.addSlider("aliscale1").setGroup(g1).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(aliscale1);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  slCohRange1 = cp5.addSlider("cohrange1").setGroup(g1).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(cohrange1);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  slSepRange1 = cp5.addSlider("seprange1").setGroup(g1).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(seprange1);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  slAliRange1 = cp5.addSlider("alirange1").setGroup(g1).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(alirange1);
  elemInGr++;


  stepInGroup = 0 ;
  g2 = cp5.addGroup("g2").setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr)
    .setSize(groupWidth, sliderHeight).close();   

  slWanScale2 = cp5.addSlider("wanScale2").setGroup(g2).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(wanScale2);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  slSprScale2 = cp5.addSlider("springscale2").setGroup(g2).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(springscale2);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  cslCohScale2 = cp5.addSlider("cohscale2").setGroup(g2).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(cohscale2);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++; 

  slAliScale2 = cp5.addSlider("aliscale2").setGroup(g2).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(aliscale2);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  slCohRange2 = cp5.addSlider("cohrange2").setGroup(g2).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(cohrange2);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  slSepRange2 = cp5.addSlider("seprange2").setGroup(g2).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(seprange2);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  slAliRange2 = cp5.addSlider("alirange2").setGroup(g2).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(alirange2);
  elemInGr++;


  stepInGroup = 0 ;
  g3 = cp5.addGroup("g3").setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr)
    .setSize(groupWidth, sliderHeight).close();   

  slWanScale3 = cp5.addSlider("wanScale3").setGroup(g3).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(wanScale3);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  slSprScale3 = cp5.addSlider("springscale3").setGroup(g3).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(springscale3);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  cslCohScale3 = cp5.addSlider("cohscale3").setGroup(g3).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(cohscale3);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++; 

  slAliScale3 = cp5.addSlider("aliscale3").setGroup(g3).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(aliscale3);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  slCohRange3 = cp5.addSlider("cohrange3").setGroup(g3).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(cohrange3);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  slSepRange3 = cp5.addSlider("seprange3").setGroup(g3).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(seprange3);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;

  slAliRange3 = cp5.addSlider("alirange3").setGroup(g3).setPosition(0, stepInGroup)
    .setSize(sliderWidth, sliderHeight).setMin(0.1).setMax(10).setValue(alirange3);
  elemInGr++;


  butMakeIA = cp5.addButton("Make Initial Agents", 10).setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;

  butMakeG1 = cp5.addButton("Make G1", 10).setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;

    butMakeG2 = cp5.addButton("Make G2", 10).setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;

    butMakeG3 = cp5.addButton("Make G3", 10).setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;

      butMakeAttr = cp5.addButton("Make Attractors", 10).setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  
  
  butMakeSA = cp5.addButton("Make Seed Agents", 10).setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  
  butPause = cp5.addButton("Pause", 10).setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  
  butExport = cp5.addButton("Export", 10).setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  
  butImgBeh = cp5.addButton("ImageBehaviour", 10).setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  
  butImgDisp = cp5.addButton("ImageDisplay", 10).setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  
  butRest = cp5.addButton("Restart", 10).setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  elemInGr = 0;
  
  cp5.setAutoDraw(false);
}
else{
  step = sliderHeight;

  slInPop.setPosition(sliderX, step);
  step += sliderHeight+sliderSpacing ;

  slGlVis.setPosition(sliderX, step);
  step += sliderHeight+sliderSpacing ;

  slGlMaxForse.setPosition(sliderX, step);
  step += sliderHeight+sliderSpacing ;

  slGlMaxVel.setPosition(sliderX, step);
  step += sliderHeight+sliderSpacing ;

  slSepS1.setPosition(sliderX, step);
  step += sliderHeight+sliderSpacing ;

  slSepS2.setPosition(sliderX, step);
  step += sliderHeight+sliderSpacing ;

  slSepS3.setPosition(sliderX, step);
  step += sliderHeight+sliderSpacing ;

  slSepS4.setPosition(sliderX, step);
  step += sliderHeight+sliderSpacing ;

  slSepS5.setPosition(sliderX, step);
  step += sliderHeight+sliderSpacing ;

//////////////////////////////////////////////////////////////////////////////////////// GROUP1
  stepInGroup = 0 ;
  g1.setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);   
  elemInGr++;
  prevGrCntr++;

  slWanScale1.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;

  slSprScale1.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;

  cslCohScale1.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;


  slAliScale1.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;


  slCohRange1.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;


  slSepRange1.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;


  slAliRange1.setPosition(0, stepInGroup);
  elemInGr++;
  prevGrCntr++;




//////////////////////////////////////////////////////////////////////////////////////// GROUP2
  if(!g1.isOpen())elemInGr-=prevGrCntr-1;
  prevGrCntr = 0;


  stepInGroup = 0 ;
  g2.setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);   

  slWanScale2.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;

  slSprScale2.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;

  cslCohScale2.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;

  slAliScale2.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;

  slCohRange2.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;

  slSepRange2.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;

  slAliRange2.setPosition(0, stepInGroup);
  elemInGr++;
  prevGrCntr++;



  //////////////////////////////////////////////////////////////////////////////////////// GROUP3


  if(!g2.isOpen())elemInGr-=prevGrCntr-1;
  else elemInGr++;
    
  prevGrCntr = 0;
  stepInGroup = 0 ;


  g3.setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);   

  slWanScale3.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;

  slSprScale3.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;

  cslCohScale3.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;

  slAliScale3.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;

  slCohRange3.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;

  slSepRange3.setPosition(0, stepInGroup);
  stepInGroup += sliderHeight+sliderSpacing ;
  elemInGr++;
  prevGrCntr++;

  slAliRange3.setPosition(0, stepInGroup);
  elemInGr++;
  prevGrCntr++;





//////////////////////////////////////////////////////////////////////////////////////// BUTTONS
    if(!g3.isOpen())elemInGr-=prevGrCntr-1;
  prevGrCntr = 0;


  butMakeIA.setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;

    butMakeG1.setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  
    butMakeG2.setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;

    butMakeG3.setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;

  butMakeAttr.setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  
  butMakeSA.setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  
  butPause.setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  
  butExport.setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  
  butImgBeh.setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  
  butImgDisp.setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  
  butRest.setPosition(sliderX, step+sliderSpacing*2+(sliderHeight+sliderSpacing) *elemInGr);
  step += sliderHeight+sliderSpacing ;
  elemInGr = 0;
  prevGrCntr = 0;

}

}
