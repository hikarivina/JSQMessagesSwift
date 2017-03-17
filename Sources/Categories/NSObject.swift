//
//  NSObject.swift
//  JSQMessagesSwift
//
//  Created by NGUYEN HUU DANG on 2017/03/17.
//
//

import UIKit

extension NSObject {
    
    class var jsq_className: String {
        return String(describing: self)
    }
    
    var jsq_className: String {
        return type(of: self).jsq_className
    }
    
}
