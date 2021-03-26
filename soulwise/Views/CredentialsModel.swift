//
//  CredentialsModel.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 26.03.2021.
//

import Foundation
import Combine

class CredentialsModel: ObservableObject {
    @Published var info: Credentials = Credentials()
    
    func signUp(completion: (() -> Void) = {}) {
        print(info.username)
        print(info.email)
        print(info.password)
        completion()
    }
    
    func signIn() {
        
    }
}

struct Credentials {
    var username: String = ""
    var email: String = ""
    var password: String = ""
}
