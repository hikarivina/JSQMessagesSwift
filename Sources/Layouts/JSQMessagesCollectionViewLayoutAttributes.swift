//
//  JSQMessagesCollectionViewLayoutAttributes.swift
//  JSQMessagesViewController
//
//  Created by Sylvain FAY-CHATELARD on 20/08/2015.
//  Copyright (c) 2015 Dviance. All rights reserved.
//

import UIKit

open class JSQMessagesCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    
    open var messageBubbleFont: UIFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    open var messageBubbleContainerViewWidth: CGFloat = 0
    open var textViewTextContainerInsets: UIEdgeInsets = UIEdgeInsets.zero
    open var textViewFrameInsets: UIEdgeInsets = UIEdgeInsets.zero
    open var incomingAvatarViewSize: CGSize = CGSize.zero
    open var outgoingAvatarViewSize: CGSize = CGSize.zero
    open var cellTopLabelHeight: CGFloat = 0
    open var messageBubbleTopLabelHeight: CGFloat = 0
    open var cellBottomLabelHeight: CGFloat = 0
    
    // MARK: - NSObject
    
    open override func isEqual(_ object: Any?) -> Bool {
        
        if !(object! as AnyObject).isKind(of: type(of: self)) {
            
            return false
        }
        
        if self.representedElementCategory == .cell {
            
            if let layoutAttributes = object as? JSQMessagesCollectionViewLayoutAttributes {
                
                if !layoutAttributes.messageBubbleFont.isEqual(self.messageBubbleFont)
                    || !UIEdgeInsetsEqualToEdgeInsets(layoutAttributes.textViewFrameInsets, self.textViewFrameInsets)
                    || !UIEdgeInsetsEqualToEdgeInsets(layoutAttributes.textViewTextContainerInsets, self.textViewTextContainerInsets)
                    || !layoutAttributes.incomingAvatarViewSize.equalTo(self.incomingAvatarViewSize)
                    || !layoutAttributes.outgoingAvatarViewSize.equalTo(self.outgoingAvatarViewSize)
                    || layoutAttributes.messageBubbleContainerViewWidth != self.messageBubbleContainerViewWidth
                    || layoutAttributes.cellTopLabelHeight != self.cellTopLabelHeight
                    || layoutAttributes.messageBubbleTopLabelHeight != self.messageBubbleTopLabelHeight
                    || layoutAttributes.cellBottomLabelHeight != self.cellBottomLabelHeight {
                            
                    return false
                }
            }
        }
        
        return super.isEqual(object)
    }
    
    open override var hash:Int {
        
        get {
            
            return (self.indexPath as NSIndexPath).hash
        }
    }
    
    // MARK: - NSCopying
    
    open override func copy(with zone: NSZone?) -> Any {
        
//        let copy: AnyObject = super.copy(with: zone)
        let copy: Any = super.copy(with: zone)
        
        if (copy as AnyObject).representedElementCategory != .cell {
            
            return copy
        }
        
        if let copy = copy as? JSQMessagesCollectionViewLayoutAttributes {
        
            copy.messageBubbleFont = self.messageBubbleFont
            copy.messageBubbleContainerViewWidth = self.messageBubbleContainerViewWidth
            copy.textViewFrameInsets = self.textViewFrameInsets
            copy.textViewTextContainerInsets = self.textViewTextContainerInsets
            copy.incomingAvatarViewSize = self.incomingAvatarViewSize
            copy.outgoingAvatarViewSize = self.outgoingAvatarViewSize
            copy.cellTopLabelHeight = self.cellTopLabelHeight
            copy.messageBubbleTopLabelHeight = self.messageBubbleTopLabelHeight
            copy.cellBottomLabelHeight = self.cellBottomLabelHeight
        }
        
        return copy
    }
}
