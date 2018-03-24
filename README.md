# Logger

### Background ###
Debugging applications can lead to crammed implementation of print and debug statements within controllers and functions, making it
difficult to realize the crucial bits. This is a super simple logging framework that can be added and applied throughout an iOS application 
to get key information. The framework uses a simple function that provides:
* message
* event
* file name
* line
* column
* function name

### Setup ###
This is a simple Cocoa framework, and can be added to iOS application like others - [Apple docs](https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPFrameworks/Tasks/IncludingFrameworks.html)
do a good job at explaining how to add frameworks. However in a few lines:
* Within your application, navigate to Build Phases -> Link Binaries with Libraries
* Drag the Logger.framework file into the area
* Also add in the embedded binaries section

After these steps, you can simply import Logger in your files and call the Logger.log function:

<img width="389" alt="screen shot 2018-03-23 at 9 42 11 pm" src="https://user-images.githubusercontent.com/19896167/37858983-2e99c314-2ee3-11e8-9e02-b25d292a33eb.png">

### Function Parameters ###
<img width="324" alt="screen shot 2018-03-23 at 9 50 21 pm" src="https://user-images.githubusercontent.com/19896167/37859052-352180ea-2ee4-11e8-83ba-679f6364c119.png">

1. message: whatever you would like to be printed when this logger is encountered.

2. LogEvent: this is an enumeration with several different cases as described below (meant to represent common categories):
* case e - Error
* case i - Information
* case d - Debug
* case v - Verbose
* case w - Warning
* case s - Severe

### Output ###
The output is easy to read with all the necessary information:

<img width="626" alt="screen shot 2018-03-23 at 9 52 44 pm" src="https://user-images.githubusercontent.com/19896167/37859072-9ff50eb4-2ee4-11e8-89cd-8181122a2de4.png">

### Usage ###
The logger works particularly in situations where we might put print statements to test if things are going well, or in case they don't. For example,
the do-catch block in URLSession based networking code, or if-let and guard wrappers for optionals.
