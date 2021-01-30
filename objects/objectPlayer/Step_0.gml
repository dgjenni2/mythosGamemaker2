/// @description Insert description here
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));

keyActivate = keyboard_check_pressed(vk_enter);
keyMenu = keyboard_check_pressed(vk_shift);

inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
inputMagnitude = (keyRight - keyLeft != 0 || keyDown - keyUp != 0);

//Movement
movePlayer(keyRight - keyLeft, keyDown - keyUp)
//hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
//vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

//x+= hSpeed;
//y+= vSpeed;

// Sprite Update
var vPreviousSprite = sprite_index;
if(inputMagnitude != 0) {
	direction = inputDirection;
	sprite_index = spriteWalk;
} else {
	sprite_index = spriteIdle;	
}

if(vPreviousSprite != sprite_index){
	localFrame = 0;	
}

//Update Animation Index
animatePlayer2();