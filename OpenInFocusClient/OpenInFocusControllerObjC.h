/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#import <Foundation/Foundation.h>

// This class is used to check if Focus is installed in the system and
// to open a URL in Focus either with or without a callback URL.
@interface OpenInFocusControllerObjC : NSObject

// Returns a shared instance of the OpenInFocusControllerObjC.
+ (OpenInFocusControllerObjC *)sharedInstance;

// Returns YES if Focus is installed in the user's system.
- (BOOL)isFocusInstalled;

// Opens a URL in Focus.
- (BOOL)openInFocus:(NSURL *)url;

@end
