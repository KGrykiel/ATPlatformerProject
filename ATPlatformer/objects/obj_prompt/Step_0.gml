/// @description Insert description here
// You can write your code in this editor

switch fadeMe {
    case "fadeIn": {
        if (image_alpha<1){
            image_alpha+= fadeSpeed;
        }
        if (image_alpha>=1){
            fadeMe = "fadeVisible";
        }
    }; break;
    
    case "fadeOut": {
        if (image_alpha>0){
            image_alpha -= fadeSpeed;
        }
        if (image_alpha<=0){
            fadeMe="fadeDone";
            alarm[0]=2;
        }
    }; break;
}