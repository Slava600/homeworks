//
//  Factory.swift
//  NavigationMain
//
//  Created by Архипов Вячеслав on 30.04.2022.
//

import Foundation

protocol LoginFactory{
    func returnAuthorization() -> LoginAuthorizationInspector
}





class MyLoginFactory: LoginFactory {
    static let shared = MyLoginFactory()
    
    func returnAuthorization() -> LoginAuthorizationInspector {
        let loginInspector = LoginAuthorizationInspector()
        return loginInspector
    }
}
