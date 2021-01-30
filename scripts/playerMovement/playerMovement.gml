function movePlayer(dX, dY) {
	if(dX != 0) {
		dY = 0;	
	}
	if(state == moveStates.idle) {
		if !(tilemap_get(collisionMap, xPos + dX, yPos + dY)) {
			xFrom = xPos;
			yFrom = yPos;
		
			xTo = xPos + dX;
			yTo = yPos + dY;
		
			xPos = xTo;
			yPos = yTo;
		
			state = moveStates.walking;
		}
	}
}

function animatePlayer2() {
	if(state == moveStates.walking) {
		walkAnimTime += delta_time / 400000;
		
		var vCardinalDirection = round(direction/90);
		var vTotalFrames = sprite_get_number(sprite_index) / 4;
		image_index = localFrame + (vCardinalDirection * vTotalFrames);
		localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
	
		// If Animation Loop
		if(localFrame >= vTotalFrames) {
			animationEnd = true;
			localFrame -= vTotalFrames;
		}
		else {
			animationEnd = false;	
		}
		
		var t = walkAnimTime / walkAnimLength;
		
		if(t >= 1) {
			walkAnimTime = 0;
			t = 1;
			state = moveStates.idle;
		}
		
		var _x = lerp(xFrom, xTo, t);
		var _y = lerp(yFrom, yTo, t);
		
		x = _x * TILE_WIDTH;
		y = _y * TILE_HEIGHT;
	}
}