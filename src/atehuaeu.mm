#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    sequesterImg.loadImage("sequester.png");
    ofSetWindowShape(sequesterImg.getWidth(), sequesterImg.getHeight());
    
    tess.setup();
    tess.setWhitelist("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");
    tess.setAccuracy(ofxTesseract::FAST);
    tess.setMode(ofxTesseract::AUTO);
    
    ofSetDataPathRoot("../Resources/data/");
    font.loadFont("Nitti.otf", 8);
    ofxKeylogger::addListener(this, &ofApp::onKeyloggerEvent);
    ofSoundStreamSetup(0,NUM_CHANNELS,this, SAMPLE_RATE,BUFFER_SIZE,4);
    transparent.afterMainSetup(ofxTransparentWindow::NORMAL);
    
    for(int i = 0; i < 26; i++) player[i].setMultiPlay(true);
    
    void * window = (NSWindow *) ofGetWindowPtr()->getCocoaWindow();
    [(NSWindow *) window setLevel:NSFloatingWindowLevel];
}

//--------------------------------------------------------------
void ofApp::update(){
    transparent.update();
    
    if(recording && (ofGetElapsedTimef() - recordingStartTime) > maxSoundTime) {
        recorder.finalize();
        recording = false;
    }
    if(text == "") {
        ofVec2f thisPos = ofVec2f(ofGetWindowPositionX(),ofGetWindowPositionY());
        if(thisPos != lastWindowPos && !ofGetMousePressed()) {
            lastWindowPos = thisPos;
            readScreen();
            currentKey = -1;
        }
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    transparent.update();
    
    ofPushStyle();
        ofSetColor(0);
        font.drawString(text, 43, 57);
        ofSetColor(255);
        font.drawString(text, 45, 55);
    ofPopStyle();
    
    sequesterImg.draw(0,0);
    if(currentKey != -1) {
        lightUpKey(currentKey);
    }
    
    if(ofGetElapsedTimeMillis() - lastBeat > tempo) {
        playScreen();
        lastBeat = ofGetElapsedTimeMillis();
    }
}

//--------------------------------------------------------------
void ofApp::onKeyloggerEvent(ofxKeyloggerEvent &ev) {
    int key = ev.key;
    
    if(key >= 'a' && key <= 'z') {
        currentKey = key;
        
        if(recording)  {
            recorder.finalize();
        }
        
        string filename = ofToString(char(key)) + ".wav";
        
        char rmcommand[100];
        std::sprintf(rmcommand, "rm ../Resources/data/%s", filename.c_str());
        std::system(rmcommand);
        
        recordingStartTime = ofGetElapsedTimef();
        recorder.setup(filename);
        recorder.setFormat(SF_FORMAT_WAV | SF_FORMAT_PCM_16);
        recording = true;
        
        int i = key - 'a';
    }
}

//--------------------------------------------------------------
void ofApp::playScreen() {
    int key = char(text[0]);
    cout << char(key) << endl;
    if(key >= 'a' && key <= 'z') playKey(key);
    text = &text[1];
    currentBeat += 1;
}

//--------------------------------------------------------------
void ofApp::playKey(int key) {
    currentKey = key;
    int i = key - 'a';
    if(player[i].loadSound(ofToString(char(key)) + ".wav")) {
        player[i].setVolume(1.0);
        player[i].play();
    }
}


//--------------------------------------------------------------
void ofApp::readScreen() {
    int w = 163; int h = 124;
    int sequesterStartX = 36; int sequesterStartY = 40;
    
    int screenStartX = ofGetWindowPositionX()+sequesterStartX;
    int screenStartY = ofGetWindowPositionY()+sequesterStartY;
    
    char command[100];
    string filename = "shot.jpg";
    std::sprintf(command, "screencapture -x ../Resources/data/%s", filename.c_str());
    std::system(command);
    
    ofImage img; img.loadImage("shot.jpg");
    img.crop(screenStartX, screenStartY, w, h);
    img.resize(img.getWidth()*3,img.getHeight()*3);
    cv::medianBlur(img, 2);
    
    text = ofToLower(tess.findText(img));
    cout<<text;
}


//--------------------------------------------------------------
void ofApp::lightUpKey(int key) {
    int startX = 43; int startY = 230;
    int keySize = 25;
    int cols = 6;
    int index = key - 'a';
    int c = index % cols; int r = index / cols;
    int x = c * keySize + startX; int y = r * keySize + startY;
    ofPushStyle();
        ofSetColor(255,153,70,170);
        ofFill();
        ofRect(x,y,keySize-1,keySize-1);
    ofPopStyle();
}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){
    int newX = ofGetWindowPositionX() + x - (ofGetWidth() / 2);
    int newY = ofGetWindowPositionY() + y - (ofGetHeight() / 2);
    ofSetWindowPosition(newX, newY);
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){
    int startX = 43; int startY = 230;
    int keySize = 25;
    int cols = 6;
    
    int pindex = 28;
    int pc = pindex % cols; int pr = pindex / cols;
    int px = pc * keySize + startX; int py = pr * keySize + startY;
    
    int mindex = 29;
    int mc = mindex % cols; int mr = mindex / cols;
    int mx = mc * keySize + startX; int my = mr * keySize + startY;
    
        tempo = (tempo <= 50) ? 50 : tempo -= 50;
    if(x > px && x < px+keySize && y > py && y < py+keySize) {
        tempo = (tempo <= 50) ? 50 : tempo -= 50;
        currentKey = 'z' + 3;
    }
    
    else if(x > mx && x < mx+keySize && y > my && y < my+keySize) {
        tempo = (tempo >= 500) ? 500 : tempo + 50;
        currentKey = 'z' + 4;
    }
}

//--------------------------------------------------------------
void ofApp::audioReceived(float * input, int bufferSize, int nChannels){
    if(recording)
        recorder.addSamples(input,bufferSize*nChannels);
}

