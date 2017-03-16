//
//  NSBundle.swift
//  JSQMessagesViewController
//
//  Created by Sylvain FAY-CHATELARD on 19/08/2015.
//  Copyright (c) 2015 Dviance. All rights reserved.
//

import Foundation

extension Bundle {
    
    public class func jsq_messagesBundle() -> Bundle? {
        
        return Bundle(for: JSQMessagesViewController.self)
    }
    
    public class func jsq_messagesAssetBundle() -> Bundle? {

        let bundlePath = Bundle.jsq_messagesBundle()!.path(forResource: "JSQMessagesAssets", ofType: "bundle")
        return Bundle(path: bundlePath!)
    }
    
    public class func jsq_localizedStringForKey(_ key: String) -> String {
        
        if let bundle = Bundle.jsq_messagesAssetBundle() {
        
            return NSLocalizedString(key, tableName: "JSQMessages", bundle: bundle, comment: "")
        }
        return key
    }
}
