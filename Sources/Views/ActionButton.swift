//
//  ActionButton.swift
//  JSQMessagesSwift
//
//  Created by NGUYEN HUU DANG on 2017/03/19.
//
//

import UIKit

class ActionButton: UIButton {
    
    fileprivate var textStore: String = ""
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addTarget(self, action: #selector(ActionButton.didTap(sender:)), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(ActionButton.didTap(sender:)), for: .touchUpInside)
    }
    
    func didTap(sender: ActionButton) {
        becomeFirstResponder()
    }
    
    func didTapDone(sender: UIButton) {
        resignFirstResponder()
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var inputView: UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
        return view
    }
    
}

extension ActionButton: UIKeyInput {
    // It is not necessary to store text in this situation.
    var hasText: Bool {
        return !textStore.isEmpty
    }
    
    func insertText(_ text: String) {
        textStore += text
        setNeedsDisplay()
    }
    
    func deleteBackward() {
        textStore.remove(at: textStore.characters.index(before: textStore.characters.endIndex))
        setNeedsDisplay()
    }
}
