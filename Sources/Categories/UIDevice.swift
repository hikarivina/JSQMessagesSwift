//
//  UIDevice.swift
//  JSQMessagesViewController
//
//  Created by Sylvain FAY-CHATELARD on 19/08/2015.
//  Copyright (c) 2015 Dviance. All rights reserved.
//

import UIKit

extension UIDevice {
    
    class func jsq_isCurrentDeviceBeforeiOS8() -> Bool {
        
        return UIDevice.current.systemVersion.compare("8.0", options: NSString.CompareOptions.numeric) == ComparisonResult.orderedAscending
    }
}
