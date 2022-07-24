function loadControls()
	global worldSpriteControls
	worldSpriteControls = createSprite(loadImage("world_2.png"))
	
	global hoverControls
	hoverControls = createSprite(loadImage("controls_micon.png"))
	
	global ctrlsMicOn
	global ctrlsMicOff
	ctrlsMicOn = loadImage("controls_micon.png")
	ctrlsMicOff= loadImage("controls_micoff.png")
	
	//create buttons on top of hover controls sprite
	global btnMic=1
	global btnChat=2
	global btnReact=3
	addVirtualButton(btnMic,0,0,70)
	addVirtualButton(btnChat,0,0,70)
	addVirtualButton(btnReact,0,0,70)
	SetVirtualButtonVisible(btnMic,0)
	SetVirtualButtonVisible(btnChat,0)
	SetVirtualButtonVisible(btnReact,0)
	
	global overlay
	overlay=1
	global overlayAnimation
	overlayAnimation = 1
	
	global mute = 0
//~	SetVideoVolume(mute)
	
	createText(1,"")
	SetTextSize(1,25)
    SetTextColor(1,255,255,255,200)
    SetTextAlignment(1,1)
    LoadFont(1,"Daydream.ttf")
    settextfont(1,1)
    
    global resetChat
    resetChat = 0
    global resetChatCounter
    resetChatCounter = getUnixTime()
	
endfunction

function syncControls()
	//load Video
	if GetTextInputState()=1
		if GetRawKeyPressed(86)
			DeleteVideo()
			loadVideo(ChooseRawFile( "*.mp4"))
			PlayVideoToImage(55)
			SetSpriteImage(cinemaSprite,55)
		endif	
	endif
	
	//position video controls
	SetSpritePosition(worldSpriteControls,getSpriteX(worldSprite),getSpriteY(worldSprite))
	SetSpriteDepth(WorldSpriteControls,0)
	
	//position hover controls
	SetSpritePosition(hoverControls,(GetWindowWidth()/2)-GetSpriteWidth(hoverControls)/2,getWindowHeight()-getSpriteHeight(hoverControls)-10)

	//position hover controls virtual buttons
	SetVirtualButtonPosition(btnChat,(GetWindowWidth()/2),getWindowHeight()-getSpriteHeight(hoverControls)+35)
	SetVirtualButtonPosition(btnMic,(GetWindowWidth()/2)-100,getWindowHeight()-getSpriteHeight(hoverControls)+35)
	SetVirtualButtonPosition(btnReact,(GetWindowWidth()/2)+100,getWindowHeight()-getSpriteHeight(hoverControls)+35)

	//fade out controls when pressing key_O
	if overlayAnimation = 1
		if GetRawKeyState(79) = 1
			if overlay = 1 //fade out
				if GetSpriteColorAlpha(worldSpriteControls) < 256 and GetSpriteColorAlpha(worldSpriteControls) > -1
					SetSpriteColorAlpha(worldSpriteControls,GetSpriteColorAlpha(worldSpriteControls)-5)
				endif
			else //fade in
				if GetSpriteColorAlpha(worldSpriteControls) < 256 and GetSpriteColorAlpha(worldSpriteControls) > -1
					SetSpriteColorAlpha(worldSpriteControls,GetSpriteColorAlpha(worldSpriteControls)+5)
				endif
			endif
			
			if GetSpriteColorAlpha(worldSpriteControls) < 1
				overlay = 0
				overlayAnimation = 0
			elseif GetSpriteColorAlpha(worldSpriteControls) > 254
				overlay = 1
				overlayAnimation = 0
			endif
		endif
	endif
	if getRawKeyState(79)=0
		overlayAnimation =1
	endif
	
	//mute video button
	if GetTextInputState()=1
		if GetRawKeyPressed(77)
			if mute = 1
				SetVideoVolume(100)
				mute = 0
			else
				SetVideoVolume(0)
				mute = 1
			endif
		endif
	endif
		
	//get hover controls actions
	if GetVirtualButtonPressed(btnMic)	
		if GetSpriteImageID(hoverControls) = ctrlsMicOn
			setSpriteImage(hoverControls,ctrlsMicOff)
		else
			setSpriteImage(hoverControls,ctrlsMicOn)
		endif
	endif
	
	if GetVirtualButtonPressed(btnChat)
		StartTextInput()
	endif
	
	
	if GetVirtualButtonPressed(btnReact)
		if GetSpriteVisible(emojiSprite)
			SetSpriteVisible(emojiSprite,0)
		else
			SetSpriteVisible(emojiSprite,1)
		endif
	endif
	
	//player text stuff
	SetTextPosition(1,GetWindowWidth()/2,((getWindowHeight()/2)-70))
	SetTextDepth(1,0)
	if GetTextInputCompleted()=1
		SetTextString(1,getTextInput())
		resetChatCounter = getUnixTime()
	endif
	
	
	
	//reset chat after x seconds
	if resetChat = 1
		resetChat = 0
		setTextString(1,"")
		resetChatCounter = getUnixTime()
	else
		if resetChatCounter = getUnixTime() - 3
			resetChat = 1
		endif
	endif

endFunction