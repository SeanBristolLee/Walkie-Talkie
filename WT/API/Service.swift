//
//  Service.swift
//  WT
//
//  Created by Sean  Bristol-Lee on 12/16/20.
//

import Firebase

struct Service {
    
    static func fetchUsers() {
        Firestore.firestore().collection("users").getDocuments { snapshot, error in
            snapshot?.documents.forEach({ document in
                print(document.data())
                
            })
        }
    }
}
