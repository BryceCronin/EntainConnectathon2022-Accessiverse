function syncPlayerMovement()
	if GetTextInputState()=1
		if GetRawKeyPressed(87) or getVirtualJoyStickY(stick)>0 //up W
			setPlayerSpriteDirection(char_u)
		elseif GetRawKeyPressed(83) or getVirtualJoyStickY(stick)<0 //down S
			setPlayerSpriteDirection(char_d)
		elseif GetRawKeyPressed(65) or getVirtualJoyStickX(stick)<0 //left A
			setPlayerSpriteDirection(char_l)
		elseif GetRawKeyPressed(68) or getVirtualJoyStickX(stick)>0 //right D
			setPlayerSpriteDirection(char_r)
		endif	
	endif
	
	//Move player (i.e. the world behind the player)
	movePlayer()
	
	//Pause walking animation when not walking
	if getPlayerMoving() = 0
		stopSprite(playerSprite)
		setSpriteFrame(playerSprite,1)
	endif
	
	SetSpriteDepth(playerSprite,2)
	
	//Centre sprite on screen
	setSpritePosition(playerSprite,(GetWindowWidth()/2)-24,(GetWindowHeight()/2)-48)
	
endFunction

function setPlayerSpriteDirection(direction)
	setSpriteImage(playerSprite,direction)
	SetSpriteAnimation(playerSprite,50,96,7)
	PlaySprite (playerSprite, speed + 2, 1, 1, 6 )
endfunction

function movePlayer()
	if GetRawKeyState(16)
		speed = 10
	else
		speed = 5
	endif
	
	if GetTextInputState()=1
		if GetRawKeyState(87) or getVirtualJoyStickY(stick)>0//up W
			SetSpritePosition(worldSprite,getSpriteX(worldSprite),getSpriteY(worldSprite)+speed)
		elseif GetRawKeyState(83) or getVirtualJoyStickY(stick)<0 //down S
			SetSpritePosition(worldSprite,getSpriteX(worldSprite),getSpriteY(worldSprite)-speed)
		elseif GetRawKeyState(65) or getVirtualJoyStickX(stick)<0 //left A
			SetSpritePosition(worldSprite,getSpriteX(worldSprite)+speed,getSpriteY(worldSprite))
		elseif GetRawKeyState(68) or getVirtualJoyStickX(stick)>0//right D
			SetSpritePosition(worldSprite,getSpriteX(worldSprite)-speed,getSpriteY(worldSprite))
		endif
	endif
endfunction

function getPlayerMoving()
	x as integer
	if GetRawKeyState(87) or getVirtualJoyStickY(stick)>0 //up W
		x= 1
	elseif GetRawKeyState(83) or getVirtualJoyStickY(stick)<0 //down S
		x= 1
	elseif GetRawKeyState(65) or getVirtualJoyStickX(stick)<0 //left A
		x= 1
	elseif GetRawKeyState(68) or getVirtualJoyStickX(stick)>0 //right D
		x= 1
	else
		x= 0
	endif	
endfunction x

function loadPlayerSprite()
	global char_u
	global char_d
	global char_l
	global char_r
	char_u = loadImage("player/u.png")
	char_d = loadImage("player/d.png")
	char_l = loadImage("player/l.png")
	char_r = loadImage("player/r.png")
	global playerSprite
	global speed
	playerSprite = createSprite(char_d)
	setPlayerSpriteDirection(char_d)
	setSpriteFrame(playerSprite,1)
	
endfunction