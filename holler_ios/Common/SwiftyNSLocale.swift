//
//  SwiftyNSLocale.swift
//  Holler
//
//  Created by Phong Le on 17/12/15.
//  Copyright © 2015 Rainmaker-labs. All rights reserved.
//

import Foundation

extension NSLocale {
    
    class func languageAvailable() -> Array<String> {
        var array = Array<String>()
        let appleLanguages = NSUserDefaults.standardUserDefaults().objectForKey("AppleLanguages") as! [String]
        
        for language in appleLanguages {
            let path = NSBundle.mainBundle().pathForResource(language, ofType: "lproj")
            
            if path != nil {
                array.append(language)
            }
        }
        
        return array
    }
    
    class func languageCode() -> String {
        let languageAvailable = self.languageAvailable()
        
        let preferredLanguages = NSLocale.preferredLanguages() 
        var currentLanguage = preferredLanguages.first
        //currentCardValues.contains(randomNumber + 1)
        if !languageAvailable.contains(currentLanguage!) {
            currentLanguage = "en"
        }
        
        return currentLanguage!
    }
    
}

extension NSLocale {
    var decimalSeparator: String {
        return objectForKey(NSLocaleDecimalSeparator) as! String
    }
}

