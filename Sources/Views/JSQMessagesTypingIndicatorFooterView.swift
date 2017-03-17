//
//  JSQMessagesTypingIndicatorFooterView.swift
//  JSQMessagesViewController
//
//  Created by Sylvain FAY-CHATELARD on 20/08/2015.
//  Copyright (c) 2015 Dviance. All rights reserved.
//

import UIKit

open class JSQMessagesTypingIndicatorFooterView: UICollectionReusableView {
    
    static var kJSQMessagesTypingIndicatorFooterViewHeight: CGFloat = 46
    
    @IBOutlet var bubbleImageView: UIImageView!
    @IBOutlet var bubbleImageViewRightHorizontalConstraint: NSLayoutConstraint!
    
    @IBOutlet var typingIndicatorImageView: UIImageView!
    @IBOutlet var typingIndicatorImageViewRightHorizontalConstraint: NSLayoutConstraint!
    
    open class func nib() -> UINib {
    
        return UINib(nibName: JSQMessagesTypingIndicatorFooterView.jsq_className, bundle: Bundle(for: JSQMessagesTypingIndicatorFooterView.self))
    }
    
    open class func footerReuseIdentifier() -> String {
        
        return JSQMessagesTypingIndicatorFooterView.jsq_className
    }
    
    // MARK: - Initialization
    
    open override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = UIColor.clear
        self.isUserInteractionEnabled = false
        self.typingIndicatorImageView.contentMode = .scaleAspectFit
    }
    
    // MARK: - Reusable view
    
    open override var backgroundColor: UIColor? {
        
        didSet {
        
            self.bubbleImageView.backgroundColor = backgroundColor
        }
    }
    
    // MARK: - Typing indicator
    func configure(_ ellipsisColor: UIColor, messageBubbleColor: UIColor, shouldDisplayOnLeft: Bool, forCollectionView collectionView: UICollectionView) {
        
        let bubbleMarginMinimumSpacing: CGFloat = 6
        let indicatorMarginMinimumSpacing: CGFloat = 26
        
        let bubbleImageFactory = JSQMessagesBubbleImageFactory()
        
        if shouldDisplayOnLeft {
            
            self.bubbleImageView.image = bubbleImageFactory.incomingMessagesBubbleImage(color: messageBubbleColor).messageBubbleImage
            
            let collectionViewWidth = collectionView.frame.width
            let bubbleWidth = self.bubbleImageView.frame.width
            let indicatorWidth = self.typingIndicatorImageView.frame.width
            
            let bubbleMarginMaximumSpacing = collectionViewWidth - bubbleWidth - bubbleMarginMinimumSpacing
            let indicatorMarginMaximumSpacing = collectionViewWidth - indicatorWidth - indicatorMarginMinimumSpacing
            
            self.bubbleImageViewRightHorizontalConstraint.constant = bubbleMarginMaximumSpacing
            self.typingIndicatorImageViewRightHorizontalConstraint.constant = indicatorMarginMaximumSpacing
        }
        else {
            
            self.bubbleImageView.image = bubbleImageFactory.outgoingMessagesBubbleImage(color: messageBubbleColor).messageBubbleImage
            
            self.bubbleImageViewRightHorizontalConstraint.constant = bubbleMarginMinimumSpacing
            self.typingIndicatorImageViewRightHorizontalConstraint.constant = indicatorMarginMinimumSpacing
        }
        
        self.setNeedsUpdateConstraints()
        
        self.typingIndicatorImageView.image = UIImage.jsq_defaultTypingIndicatorImage()?.jsq_imageMaskedWithColor(ellipsisColor)
    }
}
