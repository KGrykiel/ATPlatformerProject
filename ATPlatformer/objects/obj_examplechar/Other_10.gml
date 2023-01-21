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
		mySpeaker[i]	= id;
		
		//Line 6
		i++;
		myText[i]		= "It's to showcase all the functionalities we have implemented so far";
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
	
	case "jump":
	#region First Dialogue
		//Line 0
		var i = 0;
		myText[i]		= "As with every platformer you can jump. with Space";
		mySpeaker[i]	= id;
		
		//Line 1
		i++;
		myText[i]		= "To be fair you probably figured it out by now";
		mySpeaker[i]	= id;
		
		//Line 2
		i++;
		myText[i]		= "Why am I even here?";
		myEffects[i]	= [1,2];
		mySpeaker[i]	= id;

		#endregion
	break;
	
	case "double_jump":
	#region First Dialogue
		//Line 0
		var i = 0;
		myText[i]		= "Ok jumping is cool, but what if you could jump...";
		mySpeaker[i]	= id;
		
		//Line 1
		i++;
		myText[i]		= "and then jump... AGAIN";
		myEffects[i]	= [17,1];
		myTextCol[i]	= [17, c_red];
		mySpeaker[i]	= id;
		
		//Line 2
		i++;
		myText[i]		= "press Space while in the air";
		mySpeaker[i]	= id;
		myScripts[i]	= [change_variable, obj_player, "max_jump", 2]

		#endregion
	break;
	
	case "wall_jump":
	#region First Dialogue
		//Line 0
		var i = 0;
		myText[i]		= "You've heard of wall jumps before haven't you?";
		mySpeaker[i]	= id;
		
		//Line 1
		i++;
		myText[i]		= "you know what to do...";
		mySpeaker[i]	= id;
		myScripts[i]	= [change_variable, obj_player, "wall_jump_enabled", true]

		#endregion
	break;
	
	case "fall":
	#region First Dialogue
		//Line 0
		var i = 0;
		myText[i]		= "take a dip down there";
		mySpeaker[i]	= id;
		
		i++;
		myText[i]		= "trust :)";
		mySpeaker[i]	= id;
		
	#endregion
	
	break;
	
	case "destructible":
	#region First Dialogue
		//Line 0
		var i = 0;
		myText[i]		= "We have destructible objects. as the name suggests you can destroy them";
		mySpeaker[i]	= id;
		
		i++;
		myText[i]		= "kinda cool innit?";
		mySpeaker[i]	= id;
		
		i++;
		myText[i]		= "you can attack with left mouse button.";
		mySpeaker[i]	= id;
		
	#endregion
	
	break;
	
	case "danger_zone":
	#region First Dialogue
		//Line 0
		var i = 0;
		myText[i]		= "As the images of buzzsaws might suggest, you don't want to fall down there";
		mySpeaker[i]	= id;
		
		i++;
		myText[i]		= "or you know, go ahead, I'm not your mom";
		mySpeaker[i]	= id;
	#endregion
	
	break;
	
	case "enemies":
	#region First Dialogue
		//Line 0
		var i = 0;
		myText[i]		= "Finally, we also have some enemies";
		mySpeaker[i]	= id;
		
		i++;
		myText[i]		= "so far they don't do much, but that's a WIP";
		mySpeaker[i]	= id;
	#endregion
	
	break;

    case "end":
	#region First Dialogue
		//Line 0
		var i = 0;
		myText[i]		= "That's it for now";
		mySpeaker[i]	= id;
		
		i++
		myText[i]		= "Make sure to analyse how everything was set up in this level";
		mySpeaker[i]	= id;
		
		i++;
		myText[i]		= "It will help you design your own";
		mySpeaker[i]	= id;
	#endregion
	
	break;
}