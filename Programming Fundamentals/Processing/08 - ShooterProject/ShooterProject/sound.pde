// Robin B
class Sound{
	
	SoundFile sound;

	boolean playLock = false;
	boolean loopLock = false;

	boolean setup = false;
	String file;

	Sound(String fileName){

		file = fileName;
	}

	void prepare(){

		//sound = new SoundFile(ShooterProject.this, "data/sounds/" + file);
	}

	void update(){

		if(!setup){

			prepare();
			setup = true;
		}

		if(!sound.isPlaying()){

			playLock = false;
			loopLock = false;
		}
	}

	void play(){

		if(playLock == false && sound != null){

			sound.play();
			playLock = true;
		}
	}

	void loop(){

		if(loopLock == false && sound != null){

			sound.loop();
			loopLock = true;
		}
	}

	void stop(){

		sound.stop();
		playLock = false;
		loopLock = false;
	}

	boolean isPlaying(){

		return sound.isPlaying();
	}
}