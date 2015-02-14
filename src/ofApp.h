#pragma once

#include "ofMain.h"
#include "ofxLibsndFileRecorder.h"
#include "ofxTesseract.h"
#include "CvUtils.h"
#include "ofxTransparentWindow.h"
#include "ofxKeylogger.h"
#include "ofxXmlSettings.h"

#define NUM_CHANNELS 1
#define SAMPLE_RATE 44100
#define BUFFER_SIZE 1024

class ofApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();

		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
        void lightUpKey(int key);
        void audioReceived(float * input, int bufferSize, int nChannels);
        void readScreen();
        void onKeyloggerEvent(ofxKeyloggerEvent& ev);
        void playScreen();
        void playKey(int key);
		
        ofxTransparentWindow transparent;
        ofxLibsndFileRecorder recorder;
        ofTrueTypeFont font;
        ofxTesseract tess;
        ofImage screen;
        ofImage sequesterImg;
        ofSoundPlayer player[26];
        ofVec2f lastWindowPos;
        float recordingStartTime;
        unsigned long long lastBeat;
        unsigned long long tempo = 150;
        int currentKey = -1;
        int maxSoundTime = 1;
        int currentBeat = 0;
        bool recording = false;
        string text = "";
};
