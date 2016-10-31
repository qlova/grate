import QtQuick 2.0
import QtQuick.Window 2.2
import QtSensors 5.0
import "Circle.js" as Game
import "stack.js" as Stack

Canvas {
	id: root
	// canvas size
	width: Screen.width; height: Screen.height
	// handler to override for drawing

	property var stack: new Stack.Stack;
	property var game
	property var prevTime: 0
	property var curTime: 0
	property var fillStyle: ""
	property var loaded: false

	property var accelerometer: true

	Timer {
		interval: 35; running: true; repeat: true
		onTriggered: markDirty(Qt.rect(0,0,width,height))
	}

	Accelerometer {
		id: accel
		active: true
		dataRate: 20
	}

	MultiPointTouchArea {
		anchors.fill: parent
		minimumTouchPoints: 1
		maximumTouchPoints: 1
		touchPoints: [
			TouchPoint { id: touch }
		]
	}

	onPaint: {
		if (!loaded) {
			if (Screen.width == 0) {
				return
			}
			Screen.allowedOrientation = Screen.Portrait

			Game.grate_width = width*10
			Game.grate_height = height*10

			Game.Game(stack)
			Game.new_m_Game(stack)
			game = stack.grab()
			console.log("GAME IS")
			console.log(game)

			prevTime = curTime;
			curTime = (new Date()).getTime();
			console.log(width)
			fillStyle = "black"

			loaded = true;
			Game.context = getContext("2d")
		}
		// get context to draw with

		context.fillStyle = fillStyle
		context.fillRect(0,0, width, height)

		stack.share(game)
		Game.draw_m_Game(stack)


		prevTime = curTime;
		curTime = (new Date()).getTime();
		Game.grate_dt = 10*(curTime - prevTime);

		Game.touch = touch

		stack.share(game)
		Game.update_m_Game(stack)

		if (accelerometer) {
				Game.grate_left = (accel.reading.x > 1)
				Game.grate_right = (accel.reading.x < -1)
				Game.grate_up = (accel.reading.y < -1)
				Game.grate_down = (accel.reading.y > 1)
				if (touch.pressed) {
					Game.grate_action = true
				} else {
					Game.grate_action = false
				}
		} else {
			//Update input.
			if (touch.pressed) {
				Game.grate_left = (touch.x < width/3)
				Game.grate_right = (touch.x > (width/3)*2)
				Game.grate_up = (touch.y < height/3)
				Game.grate_down = (touch.y > (height/3)*2)
				if (!Game.grate_left && !Game.grate_right && !Game.grate_up && !Game.grate_down) {
					Game.grate_action = true
				}
			} else {
				Game.grate_left = false
				Game.grate_right = false
				Game.grate_up = false
				Game.grate_down = false
				Game.grate_action = false
			}
		}
		fillStyle = context.fillStyle
	}
}

