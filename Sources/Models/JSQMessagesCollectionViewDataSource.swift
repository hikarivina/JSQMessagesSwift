//
//  JSQMessagesCollectionViewDataSource.swift
//  JSQMessagesViewController
//
//  Created by Sylvain FAY-CHATELARD on 20/08/2015.
//  Copyright (c) 2015 Dviance. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol JSQMessagesCollectionViewDataSource: UICollectionViewDataSource {
    
    var senderId: String { get }
    var senderDisplayName: String { get }
    
    func collectionView(_ collectionView: JSQMessagesCollectionView, messageDataForItemAtIndexPath indexPath: IndexPath) -> JSQMessageData
    func collectionView(_ collectionView: JSQMessagesCollectionView, messageBubbleImageDataForItemAtIndexPath indexPath: IndexPath) -> JSQMessageBubbleImageDataSource
    func collectionView(_ collectionView: JSQMessagesCollectionView, avatarImageDataForItemAtIndexPath indexPath: IndexPath) -> JSQMessageAvatarImageDataSource?
    
    @objc optional func collectionView(_ collectionView: JSQMessagesCollectionView, attributedTextForCellTopLabelAtIndexPath indexPath: IndexPath) -> NSAttributedString?
    @objc optional func collectionView(_ collectionView: JSQMessagesCollectionView, attributedTextForMessageBubbleTopLabelAtIndexPath indexPath: IndexPath) -> NSAttributedString?
    @objc optional func collectionView(_ collectionView: JSQMessagesCollectionView, attributedTextForCellBottomLabelAtIndexPath indexPath: IndexPath) -> NSAttributedString?
}
