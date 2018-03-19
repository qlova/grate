# Grate Engine
An engine for creating collaborative creative environments.

## Supported targets:
**Pygame** (Windows/Linux/Mac)  
**Ebiten** (Windows/Linux/Mac/Web/Android/IOS)  
**HTML5** (Web)  
**Android**  
**QML/QT**  

Development status:  
**EXPERIMENTAL STAGE**

The only features the game currently has are:

* Drawing Circles, Images and Text.
* Left,Right,Up,Down and Action input.
* Mouse input.

Please wait until development matures!

## Biting the bullet:
If you still want to try this out, you will need Python3, Pygame, The I programming language and UCT.

### Android
In order to get the android target working, you need Android Studio, create a new Blank Activity and replace the MainActivity file with:  
```
android/MainActivity.java
```
Just copy this in, run a build of your game with "it build -java" and then paste Stack.java and Game.java in your Android studio project.  
For images to work you need to put them in the android "assets" directory.

### QML/QT
Open QT creator (Ubuntu SDK IDE), create a new qml application. Replace Main.qml with:
```
touch/Main.qml
```
Copy in your javascript game files (it build -qml), place your images in a folder called "assets".
