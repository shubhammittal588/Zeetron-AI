//
//  ChatViewController.swift
//  Zeetron AI
//
//  Created by Shubham Mittal on 09/06/21.
//
import UIKit
import MessageKit
import PythonKit


struct sender: SenderType {
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
   
    let currentUser = sender(senderId: "self", displayName: "Me")
    let otherUser = sender(senderId: "self", displayName: "Other User")
    
    var messages = [MessageType]()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        func runPythonCode(){
          let sys = Python.import("sys")
          sys.path.append("/Library/Frameworks/Python.framework/Versions/3.9/lib")
          let example = Python.import("openAI")
          let response = example.gpt3()
          print(response)
            
        }
        messages.append(Message(sender: otherUser, messageId: "2", sentDate: Date().addingTimeInterval(-76400), kind: .text("Bye World")))
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        runPythonCode()
    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.row]
    }
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
}
