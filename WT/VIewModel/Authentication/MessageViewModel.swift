//
//  MessageViewModel.swift
//  WT
//
//  Created by Sean  Bristol-Lee on 12/21/20.
//

import UIKit

struct MessageViewModel {
    
    private let message: Message
    
    var messageBackgroundColor: UIColor {
        return message.isFromCurrentUser ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : .systemPurple
    }
    
    var messageTextColor: UIColor {
        return message.isFromCurrentUser ? .black : .white
        
    }
    
    init(message: Message) {
        self.message = message
    }
}
