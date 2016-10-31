#Grate Engine
Grate engine is a game engine made for the "I" programming [language](http://github.com/Qlova/ilang).

## Supported targets:
**Pygame** (Windows/Linux/Mac)
**HTML5** (Web)
**Android**
**QML/QT** (Ubuntu Touch)

Development status:  
**EXPERIMENTAL STAGE**

The only features the game currently has are:

* Drawing Circles, Images and Text.
* Left,Right,Up,Down and Action input.
* Mouse input.

Please wait until development matures!

##Biting the bullet:
If you still want to try this out, you will need Python3, Pygame, The I programming language and UCT.

### Android
In order to get the android target working, you need Android Studio, create a new Blank Activity and replace the MainActivity file with:  
```
android/MainActivity.java
```
Just copy this in, run a build of your game with "it build -java" and then paste Stack.java and Game.java in your Android studio project.  
For images to work you need to put them in the android "assets" directory.

### HTML5
Add a main.html to your "it build -js" output which includes both scripts in the body of the HTML, stack.js needs to before your game.

### QML/QT
Open QT creator (Ubuntu SDK IDE), create a new qml application. Replace Main.qml with:
```
touch/Main.qml
```
Copy in your javascript game files (it build -qml), place your images in a folder called "assets".
