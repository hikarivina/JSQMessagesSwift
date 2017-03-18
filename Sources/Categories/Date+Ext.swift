//
//  Date+Ext.swift
//  JSQMessagesSwift
//
//  Created by NGUYEN HUU DANG on 2017/03/19.
//
//

import UIKit

extension Date {

    func jsq_Mmdd() -> String {
        
        let string = DateHelper.shared.jsq_HHmmFormat .string(from: self)
        
        return string
    }
    
}
