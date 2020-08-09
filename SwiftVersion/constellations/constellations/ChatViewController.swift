//
//  ChatViewController.swift
//  constellations
//
//  Created by Jacqueline DiMonte on 8/9/20.
//  Copyright © 2020 Karen Ly. All rights reserved.
//

import UIKit

struct Sender: SenderType {
    var senderId: String
    
    var displayName: String
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    let currentUser = Sender(senderId: "self", displayName: "User")
    
    let otherUser = Sender(senderId: "other", displayName: "Rebecca")

    var messages = [MessageType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages.append(Message(sender: currentUser,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400),
                                kind: .text("Hello! What is the weather like by you?")))
        messages.append(Message(sender: otherUser,
        messageId: "2",
        sentDate: Date().addingTimeInterval(-70000),
        kind: .text("It is very cold.")))
        messages.append(Message(sender: currentUser,
        messageId: "3",
        sentDate: Date().addingTimeInterval(-66400),
        kind: .text("Really, it is so warm by me!")))
        messages.append(Message(sender: otherUser,
        messageId: "4",
        sentDate: Date().addingTimeInterval(-26400),
        kind: .text("I am always in a coat.")))
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }

}
