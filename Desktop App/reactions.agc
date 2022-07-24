function loadReactions()
	global emojiHeartImg
	global emojiLaughImg
	global emojiSadImg
	global emojiWowImg
	
	global emojiSprite
	emojiSprite = createSprite(loadImage("emojis.png"))
	SetSpriteVisible(emojiSprite,0)
	
	global playerEmoji
	playerEmoji = createSprite(loadImage("emoji_heart.png"))
	setSpriteVisible(playerEmoji,0)
	
	global emojiImgSad
	global emojiImgWow
	global emojiImgHaha
	global emojiImgHeart
	
	emojiImgSad = loadImage("emoji_sad.png")
	emojiImgWow = loadImage("emoji_wow.png")
	emojiImgHaha = loadImage("emoji_laugh.png")
	emojiImgHeart = loadImage("emoji_heart.png")
	
	//create reaction buttons
	global btnSad=4
	global btnWow=5
	global btnHaha=6
	global btnHeart=7
	addVirtualButton(btnSad,0,0,70)
	addVirtualButton(btnWow,0,0,70)
	addVirtualButton(btnHaha,0,0,70)
	addVirtualButton(btnHeart,0,0,70)
	SetVirtualButtonVisible(btnSad,0)
	SetVirtualButtonVisible(btnWow,0)
	SetVirtualButtonVisible(btnHaha,0)
	SetVirtualButtonVisible(btnHeart,0)
	
	global resetEmoji
    resetEmoji = 0
    global resetEmojiCounter
    resetEmojiCounter = getUnixTime()
	
endFunction

function syncReactions()
	setSpritePosition(emojiSprite,(GetWindowWidth()/2)+(GetSpriteWidth(emojiSprite)-63),getWindowHeight()-getSpriteHeight(emojiSprite)-104)
	setSpriteDepth(emojiSprite,1)
	
	//player emoji
	setSpritePosition(playerEmoji,GetWindowWidth()/2-GetSpriteWidth(playerEmoji)/2,GetWindowHeight()/2-150)
	setSpriteSize(playerEmoji,80,-1) 
	if GetSpriteVisible(emojiSprite)
		if GetVirtualButtonPressed(btnSad)
			setSpriteImage(playerEmoji,emojiImgSad)
			setSpriteVisible(playerEmoji,1)
			resetEmojiCounter = getUnixTime()
		elseif GetVirtualButtonPressed(btnWow)
			setSpriteImage(playerEmoji,emojiImgWow)
			setSpriteVisible(playerEmoji,1)
			resetEmojiCounter = getUnixTime()
		elseif GetVirtualButtonPressed(btnHaha)
			setSpriteImage(playerEmoji,emojiImgHaha)
			setSpriteVisible(playerEmoji,1)
			resetEmojiCounter = getUnixTime()
		elseif GetVirtualButtonPressed(btnHeart)
			setSpriteImage(playerEmoji,emojiImgHeart)
			setSpriteVisible(playerEmoji,1)
			resetEmojiCounter = getUnixTime()
		endif
	endif
	
	if resetEmoji = 1
		resetEmoji = 0
		setSpriteVisible(playerEmoji,0)
		resetEmojiCounter = getUnixTime()
	else
		if resetEmojiCounter = getUnixTime() - 3
			resetEmoji = 1
		endif
	endif
	
	
	//position react buttons
	if GetSpriteVisible(emojiSprite)
		SetVirtualButtonPosition(btnSad,(GetWindowWidth()/2)+(GetSpriteWidth(emojiSprite)-10),getWindowHeight()-getSpriteHeight(emojiSprite)-30)
		SetVirtualButtonPosition(btnWow,(GetWindowWidth()/2)+(GetSpriteWidth(emojiSprite)-10),getWindowHeight()-getSpriteHeight(emojiSprite)+50)
		SetVirtualButtonPosition(btnHaha,(GetWindowWidth()/2)+(GetSpriteWidth(emojiSprite)-10),getWindowHeight()-getSpriteHeight(emojiSprite)+130)
		SetVirtualButtonPosition(btnHeart,(GetWindowWidth()/2)+(GetSpriteWidth(emojiSprite)-10),getWindowHeight()-getSpriteHeight(emojiSprite)+210)
	endif

endFunction