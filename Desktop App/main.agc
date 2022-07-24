// Proof of concept "Accessiverse" game by Bryce Cronin
// Very poorly coded in a few hours for the 2022 Entain Connnectathon
// Using the AppGameKit Engine

SetVirtualResolution ( 1920, 1080 )
SetWindowTitle("Accessiverse Demo by Bryce Cronin")
SetWindowAllowResize(1)
SetClearColor(60,163,178)

#include "player.agc"
#include "world.agc"
#include "controls.agc"
#include "reactions.agc"

loadPlayerSprite()
loadWorld()
loadControls()
loadReactions()

global stick
	stick=1
	AddVirtualJoystick(stick,GetWindowWidth()/2,GetWindowHeight()-250,150)
	SetVirtualJoystickDeadZone(0)
	SetVirtualJoystickImageOuter(1,loadImage("joystick_outer.png"))
	SetVirtualJoystickImageInner(1,loadImage("joystick_inner.png"))
	SetVirtualJoystickVisible(stick,0)

do
	syncPlayerMovement()
	syncWorld()
	syncControls()
	syncReactions()
	
	SetVirtualResolution(GetWindowWidth(),GetWindowHeight())
	
	SetVirtualJoystickPosition(stick,GetWindowWidth()/2,GetWindowHeight()-250)
    Sync()
loop

