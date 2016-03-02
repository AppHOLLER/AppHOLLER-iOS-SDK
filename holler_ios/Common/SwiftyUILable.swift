//
//  SwiftyUILable.swift
//  Holler
//
//  Created by Phong Le on 8/12/15.
//  Copyright © 2015 Rainmaker-labs. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func printFonts() {
        for family: String in UIFont.familyNames()
        {
            print("\(family)")
            for names: String in UIFont.fontNamesForFamilyName(family)
            {
                print("== \(names)")
            }
        }
    }
    
    func makeSubstringsBold(text: [String]) {
        text.forEach { self.makeSubstringBold($0) }
    }
    
//    func heightForView(text:String, #font:UIFont, #width:CGFloat) -> CGFloat{
//        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
//        label.numberOfLines = 0
//        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
//        label.font = font
//        label.text = text
//        
//        label.sizeToFit()
//        return label.frame.height
//    }
    
   
    
    func makeSubstringBold(text: String) {
        let attributedText = self.attributedText!.mutableCopy() as! NSMutableAttributedString
        
        let range: NSRange! = (self.text ?? NSString()).rangeOfString(text)
        if range.location != NSNotFound {
            attributedText.setAttributes([NSFontAttributeName: Fonts.Body.font], range: range)
        }
        
        self.attributedText = attributedText
    }
    
    func makeSubstringsItalic(text: [String]) {
        text.forEach { self.makeSubstringItalic($0) }
    }
    
    func makeSubstringItalic(text: String) {
        let attributedText = self.attributedText!.mutableCopy() as! NSMutableAttributedString
        
        let range: NSRange! = (self.text ?? NSString()).rangeOfString(text)
        if range.location != NSNotFound {
            attributedText.setAttributes([NSFontAttributeName: Fonts.Body.font], range: range)
        }
        
        self.attributedText = attributedText
    }
    
    func setLineHeight(lineHeight: Int) {
        let displayText = text ?? ""
        let attributedString = NSMutableAttributedString(string: displayText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = CGFloat(lineHeight)
        paragraphStyle.alignment = textAlignment
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, displayText.characters.count))
        
        attributedText = attributedString
    }
    
    func makeTransparent() {
        opaque = false
        backgroundColor = .clearColor()
    }
}