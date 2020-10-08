// Robin B
class AnimationManager{
	
	int zLayers = 1;

	ArrayList<Animation> animations;

	AnimationManager(){

		animations = new ArrayList<Animation>();
	}


	void update(){

		for(int z = 0; z <= zLayers; z++){

			for (int i = 0; i < animations.size(); i++){

				Animation animation = animations.get(i);

				if(animation.zLayer == z){

					if(animation.playLock || animation.loopLock){

						animation.update();	
					}
				}
			}
		}
	}

	void register(Animation animation){

		if(animation.zLayer > zLayers){

			zLayers = animation.zLayer;
		}

		animations.add(animation);
	}


	void unregister(Animation animation){

		animations.remove(animation);
	}
}