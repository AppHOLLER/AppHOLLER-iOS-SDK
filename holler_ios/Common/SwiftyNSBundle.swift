//
//  SwiftyNSBundle.swift
//  Holler
//
//  Created by Phong Le on 16/12/15.
//  Copyright © 2015 Rainmaker-labs. All rights reserved.
//

import Foundation

extension NSBundle {
    var bundleDisplayName: NSString {
        return infoDictionary?["CFBundleDisplayName"] as? NSString ?? "Unknown"
    }
    
    var bundleShortVersionString: NSString {
        return infoDictionary?["CFBundleShortVersionString"] as? NSString ?? "Unknown version"
    }
    
    var bundleVersion: NSString {
        return infoDictionary?["CFBundleVersion"] as? NSString ?? "Unknown version"
    }
}