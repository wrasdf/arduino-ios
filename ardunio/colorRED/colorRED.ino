
int redPin = 10;
int greenPin = 9;
int bluePin = 8;

int black[3]  = { 0, 0, 0 };
int white[3]  = { 255, 255, 255 };
int red[3]    = { 255, 0, 0 };
int green[3]  = { 0, 255, 0 };
int blue[3]   = { 0, 0, 255 };
int yellow[3] = { 255, 255, 0 };

// Set initial color
int redVal = black[0];
int greenVal = black[1]; 
int blueVal = black[2];

int prevR = redVal;
int prevG = greenVal;
int prevB = blueVal;

int fadeSteps = 1024;
int wait = 2;
 
void setup()
{
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);  
}
 
void loop()
{
  crossFade(white);
  crossFade(red);
  crossFade(green);
  crossFade(blue);
  crossFade(yellow);
  crossFade(black);
}
 
void setColor(int red, int green, int blue)
{
  analogWrite(redPin, red);
  analogWrite(greenPin, green);
  analogWrite(bluePin, blue);  
}

int calculateStep(int prevValue, int endValue) {
  int step = endValue - prevValue; 
  if (step) {                      
    step = fadeSteps/step;              
  } 
  return step;
}

int calculateVal(int step, int val, int i) {

  if ((step) && i % step == 0) { // If step is non-zero and its time to change a value,
    if (step > 0) {              //   increment the value if step is positive...
      val += 1;           
    } 
    else if (step < 0) {         //   ...or decrement it if step is negative
      val -= 1;
    } 
  }
  // Defensive driving: make sure val stays in the range 0-255
  if (val > 255) {
    val = 255;
  } 
  else if (val < 0) {
    val = 0;
  }
  return val;
}


void crossFade(int color[3]) {
  
  int R = color[0];
  int G = color[1];
  int B = color[2];

  int stepR = calculateStep(prevR, R);
  int stepG = calculateStep(prevG, G); 
  int stepB = calculateStep(prevB, B);

  for (int i = 0; i <= fadeSteps; i++) {

    redVal = calculateVal(stepR, redVal, i);
    greenVal = calculateVal(stepG, greenVal, i);
    blueVal = calculateVal(stepB, blueVal, i);

    analogWrite(redPin, redVal);   // Write current values to LED pins
    analogWrite(greenPin, greenVal);      
    analogWrite(bluePin, blueVal); 

    delay(wait); // Pause for 'wait' milliseconds before resuming the loop
  }
  // Update current values for next loop
  prevR = redVal; 
  prevG = greenVal; 
  prevB = blueVal;
}





