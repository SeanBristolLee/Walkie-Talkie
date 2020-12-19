//
//  MainPage.swift
//  WT
//
//  Created by Sean  Bristol-Lee on 12/16/20.
//

import UIKit
import Firebase

class MainPage: UIViewController {
    
    // MARK: - properties
    
    private let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "bubble.right")
        iv.tintColor = .black
        return iv
    }()
    
    private let chatButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Chat", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 50)
        button.addTarget(self, action: #selector(conversationList), for: .touchUpInside)
        return button
    }()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        authticateUser()
    }
    
    // MARK: - Selectors
    
    @objc func showProfile() {
        logout()
    }
    
    @objc func conversationList() {
        let controller = ConversationsController()
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
    
    // MARK: - API
    
    func authticateUser() {
        if Auth.auth().currentUser?.uid == nil {
            print("user is not logged in")
            presentLoginScreen()
        }else {
            print("DEBUG: User id is \(Auth.auth().currentUser?.uid)")
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            presentLoginScreen()
        }catch {
            print("DEBUG: Error singing out..")
        }
    }
    
    // MARK: - Helpers
    
    func presentLoginScreen() {
        DispatchQueue.main.async {
            let controller = LoginController()
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain,
                                                           target: self, action: #selector(showProfile))
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 120)
        
        let stack = UIStackView(arrangedSubviews: [
                                                   chatButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)

    }
}

// TEST
