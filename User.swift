//
//  User.swift
//  NavigationMain
//
//  Created by Архипов Вячеслав on 26.04.2022.
//

import Foundation
import UIKit

class User {
    let name: String
    let avatar: UIImage?
    let status: String
    
    
    init (name: String, avatar: UIImage?, status: String) {
        self.name = name
        self.avatar = avatar
        self.status = status
    }

}



protocol UserService {
    func getUser(name: String) -> User?
}



class CurrentUserService: UserService {
    
    
    private let user: User? = nil
    
    func getUser(name: String) -> User? {
        if let activUser = user {
            
            if name == activUser.name {
                return user
            }
        }
        return nil
    }
}



class TestUserService: UserService {
    private let user: User
    
    init(){
        self.user = User(name: "Рич", avatar: UIImage(named: "avatarImage"), status: "Наглый пёсель")
    }
    

    func getUser(name: String) -> User? {
           if name == user.name {
                return user
        }
        return nil
    }
}
