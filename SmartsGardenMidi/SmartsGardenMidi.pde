import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

void setup() {
	size(400,400);
	background(0);

	MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

	// Either you can
	//                   Parent In Out
	//                     |    |  |
	//myBus = new MidiBus(this, 0, 1); // Create a new MidiBus using the device index to select the Midi input and output devices respectively.

	// or you can ...
	//                   Parent         In                   Out
	//                     |            |                     |
	//myBus = new MidiBus(this, "IncomingDeviceName", "OutgoingDeviceName"); // Create a new MidiBus using the device names to select the Midi input and output devices respectively.

	// or for testing you could ...
	//                 Parent  In        Out
	//                   |     |          |
//	myBus = new MidiBus(this, -1, "Java Sound Synthesizer"); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
//        myBus = new MidiBus(this, -1, "Real Time Sequencer");
        myBus = new MidiBus(this, 0, 0);
}

void draw() {
	int channel = 1;
	int pitch = 64;
	int velocity = 127;
	myBus.sendNoteOn(10, 50, 127);
	myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
	delay(200);
	myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff
        myBus.sendNoteOff(10, 50,127);
	
	int number = 0;
	int value = 90;
	
	myBus.sendControllerChange(channel, number, value); // Send a controllerChange
	delay(2000);
}

void noteOn(int channel, int pitch, int velocity) {
	// Receive a noteOn
	println();
	println("Note On:");
	println("--------");
	println("Channel:"+channel);
	println("Pitch:"+pitch);
	println("Velocity:"+velocity);
}

void noteOff(int channel, int pitch, int velocity) {
	// Receive a noteOff
	println();
	println("Note Off:");
	println("--------");
	println("Channel:"+channel);
	println("Pitch:"+pitch);
	println("Velocity:"+velocity);
}

void controllerChange(int channel, int number, int value) {
	// Receive a controllerChange
	println();
	println("Controller Change:");
	println("--------");
	println("Channel:"+channel);
	println("Number:"+number);
	println("Value:"+value);
}

void delay(int time) {
	int current = millis();
	while(millis() < current+time) Thread.yield();
}
