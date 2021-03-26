//
//  CredentialsModel.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 26.03.2021.
//

import Foundation
import Combine

class CredentialsModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signUp(completion: (() -> Void) = {}) {
        print(username)
        print(email)
        print(password)
        completion()
    }
    
    func signIn() {
        
    }
}
