function loadWorld()
	global worldSprite
	global worldSpriteTop
	worldSprite = createSprite(loadImage("world_0.png"))
	worldSpriteTop = createSprite(loadImage("world_1.png"))

	global cinemaSprite
	cinemaSprite=createSprite(0)
	setSpriteSize(cinemaSprite,682,283)
	setSpriteColor(cinemaSprite,255,255,0,255)
	setSpriteImage(cinemaSprite,LoadImage("screen.png"))
	
	global testvid
	testvid = LoadVideo("sampleVideo.mp4")
	
	PlayVideoToImage(55)
	SetSpriteImage(cinemaSprite,55)
	SetVideoDimensions(1,1,5,5)
	SetVideoDimensions(getSpriteX(cinemaSprite),getSpriteY(cinemaSprite),685,283)
endfunction

function syncWorld()
	//Set world sprites
	SetSpritePosition(worldSpriteTop,getSpriteX(worldSprite),getSpriteY(worldSprite))
	SetSpriteDepth(WorldSpriteTop,1)

	//Position cinema screen
	SetSpritePosition(cinemaSprite,getSpriteX(worldSprite)+1650,getSpriteY(worldSprite)+628)
	SetSpriteDepth(cinemaSprite,1)
endFunction