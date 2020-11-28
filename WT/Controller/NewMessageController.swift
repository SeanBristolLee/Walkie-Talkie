//
//  NewMessageController.swift
//  WT
//
//  Created by Sean  Bristol-Lee on 11/12/20.
//

import UIKit

class NewMessageController: UITableViewController {
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemPink
    }
}
