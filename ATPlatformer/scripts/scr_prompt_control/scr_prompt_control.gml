// Scripts for controlling the prompt

function make_prompt(_object,_x,_y){ //To make a prompt for object given x and y of that object
    if(instance_exists(_object)){ //check if object exists
        if(!instance_exists(obj_prompt)){ //check if there isnt already a prompt for that object
            iii = instance_create_depth(_x,_y,-10000,obj_prompt); //make prompt very close to camera
            return iii;
        }
    }
}
    
function dismiss_prompt(_whichPrompt){ //choose which prompt to dismiss
    if (_whichPrompt != undefined){ //check if that prompt exists
        if(instance_exists(_whichPrompt)){ 
            with (_whichPrompt){
                fadeMe = "fadeOut"; //fade out that prompt
            }
            if (instance_exists(obj_player)){
                npcPrompt = noone //change prompt back to false as no prompt dismissed
            }
        }
    }
}