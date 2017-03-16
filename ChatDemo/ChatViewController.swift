//
//  ChatViewController.swift
//  JSQMessagesSwift
//
//  Created by NGUYEN HUU DANG on 2017/03/16.
//
//

import JSQMessagesSwift
import UIKit
import MapKit

class ChatViewController: JSQMessagesViewController {
    
    var messages = [JSQMessage]()
    var incomingBubble: JSQMessagesBubbleImage!
    var outgoingBubble: JSQMessagesBubbleImage!
    
    var incomingAvatar: JSQMessagesAvatarImage!
    var outgoingAvatar: JSQMessagesAvatarImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setup() {
        self.senderID = "1234"
        self.senderDisplayName = "Dang"
        
        self.setupUI()
        self.dummyData()
    }
    
    func setupUI() {
        let image = UIImage(named: "background")
        let imgBackground:UIImageView = UIImageView(frame: self.view.bounds)
        imgBackground.image = image
        imgBackground.contentMode = UIViewContentMode.scaleAspectFill
        imgBackground.clipsToBounds = true
        self.collectionView?.backgroundView = imgBackground
        
        self.outgoingAvatar = JSQMessagesAvatarImageFactory.avatarImage(image: UIImage(named:"avatar-1")!, diameter: 120)
        self.incomingAvatar = JSQMessagesAvatarImageFactory.avatarImage(image: UIImage(named:"avatar-2")!, diameter: 120)
        
        let bubbleFactory = JSQMessagesBubbleImageFactory()
        self.outgoingBubble = bubbleFactory.outgoingMessagesBubbleImage(color: UIColor.jsq_messageBubbleGreenColor())
        self.incomingBubble = bubbleFactory.incomingMessagesBubbleImage(color: UIColor.jsq_messageBubbleLightGrayColor())
        
    }
    
    func dummyData() {
        
        let photo = JSQPhotoMediaItem(image: UIImage(named: "thumbnail"))
        let mes0 = JSQMessage(senderId: "1234", senderDisplayName: "Dang", date: Date(), media: photo)
        let mes1 = JSQMessage(senderId: "123", senderDisplayName: "DANG", date: Date(), text: "WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW")
        let mes2 = JSQMessage(senderId: "1234", senderDisplayName: "nobody", date: Date(), text: "QQQQQQQQQQQQQQQQQQ")
        let location = CLLocation(latitude: 35.6369673747966, longitude: 139.715670326304)
        let localItem = JSQLocationMediaItem(maskAsOutgoing: true)
        localItem.set(location, completion: {
            self.collectionView.reloadData()
        })
        let mes3 = JSQMessage(senderId: "1234", senderDisplayName: "Dang", date: Date(), media: localItem)
        self.messages = [mes1, mes0, mes2, mes3]
        
    }
    override func didPressSendButton(_ button: UIButton, withMessageText text: String, senderId: String, senderDisplayName: String, date: Date) {
        let mes = JSQMessage(senderId: "1234", senderDisplayName: "Dang", date: Date(), text: text)
        self.messages.append(mes)
        self.finishSendingMessage()
    }
    
}

extension ChatViewController {
    
}

extension ChatViewController {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
        let message = self.messages[indexPath.row]
        if message.senderID != self.senderID {
            cell.textView?.textColor = UIColor.black
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView, messageDataForItemAtIndexPath indexPath: IndexPath) -> JSQMessageData {
        return self.messages[indexPath.row]
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView, messageBubbleImageDataForItemAtIndexPath indexPath: IndexPath) -> JSQMessageBubbleImageDataSource {
        let message = self.messages[indexPath.item]
        
        return message.senderID == self.senderID ? self.outgoingBubble : self.incomingBubble
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView, avatarImageDataForItemAtIndexPath indexPath: IndexPath) -> JSQMessageAvatarImageDataSource? {
        let message = self.messages[indexPath.item]
        
        return message.senderID == self.senderID ? self.outgoingAvatar : self.incomingAvatar
        
    }
}