/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation
import UIKit

open class OpenInFocusControllerSwift {
    let focusScheme = "firefox-focus:"
    let basicURL = URL(string: "firefox-focus://")!

    // This would need to be changed if used from an extension… but you
    // can't open arbitrary URLs from an extension anyway.
    let app = UIApplication.shared

    fileprivate func encodeByAddingPercentEscapes(_ input: String) -> String {
        return NSString(string: input).addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[]"))!
    }

    open func isFocusInstalled() -> Bool {
        return app.canOpenURL(basicURL)
    }

    @discardableResult
    open func openInFocus(_ url: URL) ->  Bool {
        if !isFocusInstalled() {
            return false
        }

        let scheme = url.scheme
        if scheme == "http" || scheme == "https" {
            let escaped = encodeByAddingPercentEscapes(url.absoluteString)
            if let focusURL = URL(string: "firefox-focus://open-url?url=\(escaped)") {
                return app.openURL(focusURL)
            }
        }
        return false
    }
}
