//
//  CountryModel.swift
//  Holler
//
//  Created by Phong Le on 17/12/15.
//  Copyright © 2015 Rainmaker-labs. All rights reserved.
//

import Foundation

public func ==(lhs: Country, rhs: Country) -> Bool {
    return lhs.countryCode == rhs.countryCode
}

public class Country: NSObject {
    public static var emptyCountry: Country { return Country(countryCode: "", phoneExtension: "", isMain: true) }
    
    public static var currentCountry: Country {
        if let countryCode = NSLocale.currentLocale().objectForKey(NSLocaleCountryCode) as? String {
            print(NSLocale.languageCode())
            return Countries.countryFromCountryCode(countryCode)
        }
        return Country.emptyCountry
    }
    
    public var countryCode: String
    public var phoneExtension: String
    public var isMain: Bool
    
    public init(countryCode: String, phoneExtension: String, isMain: Bool) {
        self.countryCode = countryCode
        self.phoneExtension = phoneExtension
        self.isMain = isMain
    }
    
    @objc public var name: String {
        return NSLocale.currentLocale().displayNameForKey(NSLocaleCountryCode, value: countryCode) ?? "Invalid country code"
    }
}