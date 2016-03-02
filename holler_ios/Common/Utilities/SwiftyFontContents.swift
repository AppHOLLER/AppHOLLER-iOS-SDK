//
//  SwiftyFontContents.swift
//  Holler
//
//  Created by Phong Le on 8/12/15.
//  Copyright © 2015 Rainmaker-labs. All rights reserved.
//
//  var label = UILabel(frame: CGRectMake(0, 0, 200, 35))
//  label.font = Fonts.AlertTitle.font
//  label.textColor = UIColor.whiteColor()
//  label.text = "Title Text"
//  var bodyLabel = UILabel(frame: CGRectMake(0, 0, 200, 35))
//  label.font = Fonts.Body.font
//  label.textColor = UIColor.whiteColor()
//  label.text = "Body Text"


import UIKit
import CoreText

//: Fonts
enum Fonts : String {
    case Title =        "Montserrat-Bold, 25"
    case Body =         "Montserrat-Light, 15"
    case Description =  "Montserrat-UltraLight, 12"
    case Footer     =   "Helvetica-Regular, 10"
    case AlertTitle =   "Montserrat-Regular, 25"
    case SmallTitle =   "Montserrat-Bold, 12"

    var font : UIFont {
        var strings = rawValue.componentsSeparatedByString(", ")
        var size = Int(strings[1])!
        if Device.isSize(Device.Heights.Inches_3_5) {
            size -= 5
        }

        return UIFont(name: strings[0], size: CGFloat(size))!
    }
    

//    typealias Feature = (type: Int, selector: Int)
//    struct Features {
//        static var ProportionalNumbers: Feature = (kNumberSpacingType, kProportionalNumbersSelector)
//        static var AlternatePunctuation: Feature = (kCharacterAlternativesType, 1) // Magic!
//    }
//    
//    func fontByAddingFeatures(features: [Feature]) -> UIFont {
//        typealias FeatureDictionary = [String: Int]
//        
//        let attributes = self.fontDescriptor().fontAttributes()
//        let attribute: AnyObject! = attributes[UIFontDescriptorFeatureSettingsAttribute]
//        
//        var featureDictionaries: [FeatureDictionary] = []
//        if let existingFeatureDictionaries = attribute as? [FeatureDictionary] {
//            featureDictionaries = existingFeatureDictionaries
//        }
//        
//        for feature in features {
//            featureDictionaries += [
//                UIFontFeatureTypeIdentifierKey: feature.type,
//                UIFontFeatureSelectorIdentifierKey: feature.selector,
//            ]
//        }
//        
//        let descriptor = self.fontDescriptor().fontDescriptorByAddingAttributes([
//            UIFontDescriptorFeatureSettingsAttribute: featureDictionaries,
//            ])
//        return UIFont(descriptor: descriptor, size: 0)
//    }
}

