# Pre-work - *Tipsy*

**Tipsy** is a tip calculator application for iOS.

Submitted by: **Harsh Mehta**

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

* [ ] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [ ] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [ ] User can select how many ways the amoung is going to be split, if at all.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src="http://i.imgur.com/bteqj4n.gif" title="Video walkthrough">

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:**
1. The experience has been quite pleasant. The tooling (Xcode, simulator) just seem to work, that too with blazing speed.
2. Both outlets and actions are ways for view and viewcontroller to communicate with each other. Outlets store any state that a view has and can be get/set by the view controller. An action triggers a function in your viewcontroller when a UI event is performed. For example: an outlet can be used to update the time each second in a clock view, an action can be used to respond to the touch of a button when the user clicks on it.
3. They seem to be stored as just another property in the storyboard xml. Actions specify a selector (example: 'tipCalculate:') to identify which function to call when the event triggers and outlets specify a property to identify which variable to get/set the state from/to.

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:**
1. ARC: automatic reference counting is a way to manage memory. Alternative strategy to manage memory is to use Garbage collection (Java) or maybe just leave the burden up to the programmer (C, C++). ARC keeps a count of active references to an allocated object. When the reference count goes to zero, the object is deinitialized.
2. Strong vs weak reference: any strong reference to an object necessitates that the object does not get deinitialized. But there are cases where the data model can get away with freeing up the memory unless anyone else also wants the object. These cases can be modeled by weak references. When the *strong* reference count goes to zero, the object is deinitialized.
3. Strong reference cycle for closures: This is a case where a class instance stores a closure as a member variable and the member variable itself has a reference to the class instance (or class instance's other member variables or call some of its methods). 

Example:
```
class Printer {
    let text: String?
    
    lazy var print: () -> String = {
        if let text = self.text {
            return text
        }
		return ""
    }
    init(text: String? = nil) {
        self.text = text
    }
}
```


## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

