//
//  UIView.swift
//  JSQMessagesViewController
//
//  Created by Sylvain FAY-CHATELARD on 19/08/2015.
//  Copyright (c) 2015 Dviance. All rights reserved.
//

import UIKit

extension UIView {

    public func jsq_pinSubview(_ subview: UIView, toEdge attribute: NSLayoutAttribute) {
        
        self.addConstraint(NSLayoutConstraint(item: self, attribute: attribute, relatedBy: .equal, toItem: subview, attribute: attribute, multiplier: 1, constant: 0))
    }
    
    public func jsq_pinAllEdgesOfSubview(_ subview: UIView) {
        
        self.jsq_pinSubview(subview, toEdge: .bottom)
        self.jsq_pinSubview(subview, toEdge: .top)
        self.jsq_pinSubview(subview, toEdge: .leading)
        self.jsq_pinSubview(subview, toEdge: .trailing)
    }
}
