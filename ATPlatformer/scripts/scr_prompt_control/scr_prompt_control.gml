// Scripts for controlling the prompt

function make_prompt(_object,_x,_y){ //To make a prompt for object given x and y of that object
    if(instance_exists(_object)){ //check if object exists
        if(!instance_exists(obj_prompt)){ //check if there isnt already a prompt for that object
            iii = instance_create_depth(_x,_y,-10000,obj_prompt); //make prompt very close to camera
            return iii;
        }
    }
}


function pop_up_prompt(_object){ //to make the prompt show for that object
    if (prompt==false || prompt==undefined){ //double check if prompt isnt already showing
        prompt = make_prompt(_object, _object.x, _object.y-300); //place prompt above object
		return prompt;
    }
}
    
function dismiss_prompt(_whichPrompt){ //choose which prompt to dismiss
    if (_whichPrompt != undefined){ //check if that prompt exists
        if(instance_exists(_whichPrompt)){ 
            with (_whichPrompt){
                fadeMe = "fadeOut"; //fade out that prompt
            }
            if (instance_exists(obj_player)){
                prompt = false //change prompt back to false as no prompt dismissed
            }
        }
    }
}

function detect_nearby_interactible(){ //detect if interactible obj nearby
	prompt = false;
    nearbyInteractible = collision_rectangle(x-30, y-30, x+30, y+30, obj_interactable, false,true) //look range is 30
	if nearbyInteractible {
		// Pop up prompt
		prompt = pop_up_prompt(nearbyInteractible); //pop up prompt for that object
	}
	if !nearbyInteractible {
		// Get rid of prompt if it exists
		if(prompt){
			scr_dismissPrompt(prompt); //can dismiss that prompt else
		}
	}
}