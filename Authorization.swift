//
//  Authorization.swift
//  NavigationMain
//
//  Created by Архипов Вячеслав on 28.04.2022.
//

import Foundation

//MARK: Создаем сервис для проверки логина и пароля

final class Authorization {
    static let shared = Authorization()
    private init() {}
    
    private let log = "Рич"
    private let pswd = "123"
    
    func checker (log: String, pswd: String) -> Bool {
        guard log == self.log && pswd == self.pswd else {return false}
        return true
    }
    
}

class LoginInspector: LoginViewControllerDelegate {
    func userAuthorization(log: String, pswd: String) -> Bool {
       return Authorization.shared.checker(log: log, pswd: pswd)
    }
    
    
}
