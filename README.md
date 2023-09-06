# swift_tips

### A better way to keep track of 3rd party privacy practices in Xcode.
Use Privacy Manifests to identify privacy practices of 3rd party dependencies you use in your app. In Xcode 15, you can collect all privacy manifests by:
1. Archive your app.
2. Go to your Xcode Organizer and highlight the archived app.
3. Then open the context menu, and select “Generate Privacy Report”.
This is a healthy way to view and reference your app’s privacy details. 


### How to make it easier to access your asset catalogs in Xcode 15.
Xcode 15 makes it easier to access your asset catalog with static properties. Instead of typing the name of your asset (which can be error-prone), Xcode will automatically generate a static property under ColorResource and ImageResource types.
 
For example, if you add an image to your Assets folder called myCat, you can access it in your View because Xcode already generates the resource for you. Check out how to do that below: 
```
struct ContentView: View {
    var body: some View {
      Image(.myCat)
    }
}

#Preview {
  ContentView()
}
```
This makes your work to reference assets that much more convenient (and efficient!).


### A workaround for when your frameworks just won't cooperate.
What to do if your frameworks in the iOS SDK aren't applying (and when you might be affected) 👇

Many frameworks in the iOS SDK don't apply to the platforms or if the hardware is not available. If you're unable to isolate the code to separate source files, you can use a conditional statement to offer a different code path for visionOS and iOS.
```
#if os(xrOS)
   // visionOS code
#elseif os(iOS)
   // iOS code 
#endif
```
This is useful if you are working on a cross-platform project and wanted to check availability of a specific platform. You could add it within a function or as an extension of your class as well.

Just as good general knowledge, the following frameworks are not available in the visionsOS SDK:
* ActivityKit
* AutomatedDeviceEnrollment
* CarPlay
* CoreTelephony
* DriverKit
* ManagedSettings
* MLCompute
* RoomPlan
* SensorKit
* Twitter
* Messages
* ProximityReader
* SCSIPeripheralsDriverKit
* Social
* AdSupport
* BusinessChat
* CoreLocationUI
* DeviceActivity
* ExposureNotification
* ManagedSettingsUI
* OpenAL
* SafetyKit
* ServiceManagement
* WidgetKit
* AppClip
* CarKey
* CoreNFC
* DockKit
* FamilyControls
So if you're working with these frameworks, be sure to revisit our tip on your next work session.



### Easily add a little animation to your symbols in iOS17.

In iOS17, you can animate SF Symbols using the symbolEffect( ) modifier. In this example, we can animate a cloud by having it move up and down with a bounce effect.
```
struct ContentView: View {
    @State private var cloudCount = 0

    var body: some View {
        Button {
            cloudCount += 1
        } label: {
            Label("Move the cloud", systemImage: "cloud.fill")
        }
        .symbolEffect(.bounce, value: cloudCount)
        .font(.extraLargeTitle2)
    }
}
```
This can help add that extra umph to your code in a quick way for the added user experience.



### Avoid running repetitive code during run time with Swift Macros.
In Xcode 15 and Swift 5.9 you can use new Swift Macros to avoid the creation of repetitive code during run time. In this example you can use the #preview macro to create a preview of your SwiftUI view and the #URL macro to validate a URL. 
```
// #URL Macro 
let kodecoURL = #URL("https://www.kodeco.com/home")
// #preview Macro
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello World!")
        }
    }
}
#Preview {
    ContentView()
}
```
This shortcut helps shorten your development for a speedier runtime.



### How to use use numbers with decimal points in Swift. 
Floating-point numbers, also known as floats, are numbers with decimal points. In Swift, there are two types of floating-point numbers: Float and Double. Float is a 32-bit number, whereas Double is a 64-bit number.

To declare a floating-point variable, use the keyword var or let followed by the variable name and assign it a value.
```
var pi: Float = 3.14
let e: Double = 2.71828
let rating = 2.5 // Using type inference
print(type(of: rating)) // Prints Double
```
You can also perform mathematical operations with floating-point numbers such as addition, subtraction, multiplication, and division.
```
var x = 3.14
var y = 2.71
var sum = x + y  //5.85
var difference = x - y  //0.43
var product = x * y //8.51
var quotient = x / y //1.15
```
It’s worth noting that, due to the nature of floating-point numbers, the results of certain operations may not always be completely accurate. This could lead to unexpected results when comparing or rounding floating-point numbers.



### Using optional chaining in Swift and learn to fail gracefully.
Optional chaining is a process for querying and calling properties, methods and subscripts on an optional that might currently be nil. If the optional contains a value, the property, method, or subscript call succeeds; if the optional is nil, the property, method or subscript call returns nil.

Multiple queries can be chained together and the entire chain fails gracefully if any link in the chain is nil.
```
// Classes for testing
class Person {
  var residence: Residence?
}
class Residence {
  var numberOfRooms = 1
}
// Example 1: Create a person, with the residence nil
let john = Person()
if let roomCount = john.residence?.numberOfRooms {
  print("John's residence has \(roomCount) room(s).")
} else {
  print("Unable to retrieve the number of rooms.")
}
// Prints "Unable to retrieve the number of rooms."
// Example 2: Create a person, with the residence set
john.residence = Residence()
if let roomCount = john.residence?.numberOfRooms {
  print("John's residence has \(roomCount) room(s).")
} else {
  print("Unable to retrieve the number of rooms.")
}
// Prints "John's residence has 1 room(s)."
```
In the example above, the residence property of the john object is nil, so the call to numberOfRooms returns nil and the if-let statement’s condition is false.

Just keep in mind that the returned value will always be an optional, even if the property, method, or subscript you're querying returns a non-optional value. 



### Creating your own dictionary to further customize your program.
Dictionaries, also known as hash maps or associative arrays, are a powerful collection type in Swift for storing key-value pairs. The keys in a dictionary must be unique and can be of any hashable type, such as String or Int. The values can be of any type.

Here’s an example of creating and using a dictionary in Swift:
```
// Declare a dictionary of type [String: Int]
var ages = ["Alice": 25, "Bob": 30, "Charlie": 35]
// Add a new key-value pair to the dictionary
ages["Dave"] = 40
// Update the value for a key
ages["Bob"] = 32
// Access the value for a key
let bobAge = ages["Bob"] // 32
// Remove a key-value pair
ages.removeValue(forKey: "Charlie")
// Iterate over the key-value pairs
for (name, age) in ages {
  print("\(name) is \(age) years old.")
}
```
Expected Output:
```
Alice is 25 years old.
Dave is 40 years old.
Bob is 32 years old.
```
As you can see from the output above, Dictionaries are unordered collections, meaning that the order of the key-value pairs may not be the same as the order in which they were added. If you need to maintain the order of the items, you may use an Array and a Tuple.



### Property observers for writing responsive code
Swift supports property observers, which are a useful feature to observe and respond to changes in property values. Utilize property observers (willSet and didSet) to add custom code that gets executed before or after the value of a property is changed.
```
// Property observer example
class TemperatureConverter {
	var celsius: Double = 0.0 {
    	willSet {
        	print("Updating celsius value to \(newValue)")
    	}
    	didSet {
        	print("celsius value updated from \(oldValue) to \(celsius)")
    	}
	}
}
let converter = TemperatureConverter()
converter.celsius = 25.0
// Output:
// Updating celsius value to 25.0
// celsius value updated from 0.0 to 25.0
converter.celsius = 30.0
// Output:
// Updating celsius value to 30.0
// celsius value updated from 25.0 to 30.0
 ```
In the example above, we have a TemperatureConverter class with a celsius property. We utilize property observers to execute custom code before and after the celsius value is changed. The willSet observer is triggered just before the value is set, and the didSet observer is triggered immediately after the value is set. In this example, we print messages indicating the old and new values of celsius using these observers.