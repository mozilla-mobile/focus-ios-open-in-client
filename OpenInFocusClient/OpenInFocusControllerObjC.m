/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#import <UIKit/UIKit.h>
#import "OpenInFocusControllerObjC.h"

static NSString *const focusScheme = @"firefox-focus:";

@implementation OpenInFocusControllerObjC

// Creates a shared instance of the controller.
+ (OpenInFocusControllerObjC *)sharedInstance {
    static OpenInFocusControllerObjC *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

// Custom function that does complete percent escape for constructing the URL.
static NSString *encodeByAddingPercentEscapes(NSString *string) {
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
    kCFAllocatorDefault,
    (CFStringRef)string,
    NULL,
    (CFStringRef)@"!*'();:@&=+$,/?%#[]",
    kCFStringEncodingUTF8));
    return encodedString;
}

// Checks if Focus is installed.
- (BOOL)isFocusInstalled {
    NSURL *url = [NSURL URLWithString:focusScheme];
    return [[UIApplication sharedApplication] canOpenURL:url];
}

// Opens the URL in Focus.
- (BOOL)openInFocus:(NSURL *)url {
    if (![self isFocusInstalled]) {
        return NO;
    }

    NSString *scheme = [url.scheme lowercaseString];
    if (![scheme isEqualToString:@"http"] && ![scheme isEqualToString:@"https"]) {
        return NO;
    }

    NSString *urlString = [url absoluteString];
    NSMutableString *focusURLString = [NSMutableString string];
    [focusURLString appendFormat:@"%@//open-url?url=%@", focusScheme, encodeByAddingPercentEscapes(urlString)];
    NSURL *focusURL = [NSURL URLWithString: focusURLString];

    // Open the URL with Focus.
    return [[UIApplication sharedApplication] openURL:focusURL];
}

@end
