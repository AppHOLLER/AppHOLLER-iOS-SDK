//
//  SwiftyArray.swift
//  Holler
//
//  Created by Phong Le on 29/12/15.
//  Copyright © 2015 Rainmaker-labs. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return Int(index) < count ? self[Int(index)] : nil
    }
    
    func containsObject(object: Any) -> Bool
    {
        if let anObject: AnyObject = object as? AnyObject
        {
            for obj in self
            {
                if let anObj: AnyObject = obj as? AnyObject
                {
                    if anObj === anObject { return true }
                }
            }
        }
        return false
    }
    
//    func indexOfObject(object : AnyObject) -> NSInteger {
//        return self.indexOfObject(object)
//    }
//    
//    mutating func removeObject(object : AnyObject) {
//        for var index = self.indexOfObject(object); index != NSNotFound; index = self.indexOfObject(object) {
//            self.removeAtIndex(index)
//        }
//    }
}

//extension Array where Element: Equatable{
//    mutating func removeObject(object: Element) {
//        if let index = self.indexOf(object){
//            self.removeAtIndex(index)
//        }
//    }
//    
//    
//}
