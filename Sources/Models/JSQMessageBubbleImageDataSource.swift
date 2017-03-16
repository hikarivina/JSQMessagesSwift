//
//  JSQMessageBubbleImageDataSource.swift
//  JSQMessagesViewController
//
//  Created by Sylvain FAY-CHATELARD on 19/08/2015.
//  Copyright (c) 2015 Dviance. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol JSQMessageBubbleImageDataSource {
    
    var messageBubbleImage: UIImage { get }
    var messageBubbleHighlightedImage: UIImage { get }
}
