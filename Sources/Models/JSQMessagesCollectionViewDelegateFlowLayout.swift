//
//  JSQMessagesCollectionViewDelegateFlowLayout.swift
//  JSQMessagesViewController
//
//  Created by Sylvain FAY-CHATELARD on 20/08/2015.
//  Copyright (c) 2015 Dviance. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol JSQMessagesCollectionViewDelegateFlowLayout: UICollectionViewDelegateFlowLayout {

    @objc optional func collectionView(_ collectionView: JSQMessagesCollectionView, layout: JSQMessagesCollectionViewFlowLayout, heightForCellTopLabelAtIndexPath indexPath: IndexPath) -> CGFloat
    @objc optional func collectionView(_ collectionView: JSQMessagesCollectionView, layout: JSQMessagesCollectionViewFlowLayout, heightForMessageBubbleTopLabelAtIndexPath indexPath: IndexPath) -> CGFloat
    @objc optional func collectionView(_ collectionView: JSQMessagesCollectionView, layout: JSQMessagesCollectionViewFlowLayout, heightForCellBottomLabelAtIndexPath indexPath: IndexPath) -> CGFloat
    @objc optional func collectionView(_ collectionView: JSQMessagesCollectionView, didTapAvatarImageView imageView: UIImageView, atIndexPath indexPath: IndexPath)
    @objc optional func collectionView(_ collectionView: JSQMessagesCollectionView, didTapMessageBubbleAtIndexPath indexPath: IndexPath)
    @objc optional func collectionView(_ collectionView: JSQMessagesCollectionView, didTapCellAtIndexPath indexPath: IndexPath, touchLocation: CGPoint)
    @objc optional func collectionView(_ collectionView: JSQMessagesCollectionView, header: JSQMessagesLoadEarlierHeaderView, didTapLoadEarlierMessagesButton button: UIButton?)
}
