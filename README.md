# Opening links in Focus for iOS #
This open-source project provides support for opening links in Focus for iOS. There are classes (for Objective-C and Swift), along with a sample project that uses them, available for reference and use. 

### Using OpenInFocusControllerSwift or OpenInFocusControllerObjC to open links ###
The `OpenInFocusControllerSwift` and `OpenInFocusControllerObjC` classes provide methods that handle the making of custom URI schemes, checking if Focus is installed on the device and opening the URL in Focus. We have provided Swift and Objective-C implementations of these classes to accommodate your language of choice.

### Methods ###
* `isFocusInstalled`: returns true if Focus is installed
* `openInFocus`: opens the specified URL in Focus; used with or without the following:

### The Custom Focus URL ###
Focus uses a single URI scheme, `firefox-focus://`. This scheme can accepts the following query parameter:
* `url`: (required) the URL to open in Focus.

For Example: 
```
firefox-focus://open-url?url=https%253A%252F%252Fwww.mozilla.org%252Fen-US%252Fnewsletter%252Fios%252F
```
### Walkthrough ###
1. Download the class file in the language of your choice:
  * Swift: [OpenInFocusControllerSwift.swift](https://github.com/mozilla/focus-ios-open-in-client/blob/master/OpenInFocusClient/OpenInFocusControllerSwift.swift)
  * Objective-C: [OpenInFocusControllerObjC.m](https://github.com/mozilla/focus-ios-open-in-client/blob/master/OpenInFocusClient/OpenInFocusControllerObjC.m), [OpenInFirefoxControllerObjC.h](https://github.com/mozilla/focus-ios-open-in-client/blob/master/OpenInFocusClient/OpenInFocusControllerObjC.h)
2. Whitelist the Focus URL scheme in Info.plist, under the LSApplicationQueriesSchemes key:
  * In depth example on how to do that [here](http://useyourloaf.com/blog/querying-url-schemes-with-canopenurl.html)
  * If LSApplicationQueriesSchemes isn't already in your app's Info.plist, you can just manually add it
  * Add `firefox-focus` to LSApplicationQueriesSchemes
3. Call methods to open links in Focus:
  * [Example in Swift](https://github.com/mozilla/focus-ios-open-in-client/blob/master/OpenInFocusClient/ViewController.swift#L38-41)

### Contribute to Focus for iOS ###
Learn more about how to contribute to this project: [Focus for iOS official repo](https://github.com/mozilla-mobile/focus-ios)
