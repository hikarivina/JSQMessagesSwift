//
//  ActionButton.swift
//  JSQMessagesSwift
//
//  Created by NGUYEN HUU DANG on 2017/03/19.
//
//

import UIKit

open class JSQAccessoryButton: UIButton {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addTarget(self, action: #selector(JSQAccessoryButton.didTap(sender:)), for: .touchUpInside)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(JSQAccessoryButton.didTap(sender:)), for: .touchUpInside)
    }
    
    func didTap(sender: JSQAccessoryButton) {
        becomeFirstResponder()
    }
    
    func didTapDone(sender: UIButton) {
        resignFirstResponder()
    }
    
    override open var canBecomeFirstResponder: Bool {
        return true
    }
    
    override open var inputView: UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
        return view
    }
    
}

extension JSQAccessoryButton: UIKeyInput {
    // It is not necessary to store text in this situation.
    public var hasText: Bool {
        return false
    }
    
    public func insertText(_ text: String) {
        //setNeedsDisplay()
    }
    
    public func deleteBackward() {
        //setNeedsDisplay()
    }
}
