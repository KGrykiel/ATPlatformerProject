//---You can update variables here!---//
reset_dialogue_defaults();


switch(choice_variable){
	case -1:
	#region First Dialogue
		//Line 0
		var i = 0;
		myText[i]		= "Come check out this dialogue system I have stolen myself";
		mySpeaker[i]	= id;
		
		//Line 1
		i++;
		myText[i]		= "You can change colours, add a bunch of effects, and even give the player dialogue choice";
		myEffects[i]	= [39,1, 47,0];
		myTextCol[i]	= [15, c_lime, 23, c_white];
		mySpeaker[i]	= id;
		
		//Line 2
		i++;
		myText[i]		= ["Based", "Cringe"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myNextLine[i]	= [3,4];
		
		//Line 3
		i++;
		myText[i]		= "I know right?";
		mySpeaker[i]	= id;
		myNextLine[i]	= 5
		
		//Line 4
		i++;
		myText[i]		= "Ok make a better one then shitter";
		myEffects[i]	= [26,1, 33,0];
		mySpeaker[i]	= id;
		myTextCol[i]	= [26, c_maroon, 34, c_white];
		myNextLine[i]	= 5

		//Line 5
		i++;
		myText[i]		= "Anyway, I also took the opportunity to make a quick level";
		myEmotion[i]	= 1;
		myEmote[i]		= 0;
		mySpeaker[i]	= id;
		myScripts[i]	= [change_variable, id, "choice_variable", "well"]

		#endregion
	break;
	
	case "well":
	#region If you chose green
		var i = 0;
		//Line 0
		myText[i]		= "Well, what are you waiting for? get on with it.";
		myTextSpeed[i]	= [0,1, 31, 0.1, 32,1];
		mySpeaker[i]	= id;
		
		//uncommenting this will make the first conversation begin again
		//choice_variable	= -1;
	#endregion
	
	break;

}