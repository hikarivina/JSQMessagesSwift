//
//  JSQMessagesCollectionViewCellOutgoing.swift
//  JSQMessagesViewController
//
//  Created by Sylvain FAY-CHATELARD on 20/08/2015.
//  Copyright (c) 2015 Dviance. All rights reserved.
//

import UIKit

open class JSQMessagesCollectionViewCellOutgoing: JSQMessagesCollectionViewCell {
    
    open override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.messageBubbleTopLabel.textAlignment = .right
        self.cellBottomLabel.textAlignment = .right
    }
    
    open override class func nib() -> UINib {
        
        return UINib(nibName: JSQMessagesCollectionViewCellOutgoing.jsq_className, bundle: Bundle(for: JSQMessagesCollectionViewCellOutgoing.self))
    }
    
    open override class func cellReuseIdentifier() -> String {
        
        return JSQMessagesCollectionViewCellOutgoing.jsq_className
    }
    
    open override class func mediaCellReuseIdentifier() -> String {
        
        return JSQMessagesCollectionViewCellOutgoing.jsq_className + "_JSQMedia"
    }
}
