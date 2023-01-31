//
//  SignInAction.swift
//  TCAIntroduce
//
//  Created by Woody Liu on 2023/1/31.
//

import Foundation
import Combine
import ComposableArchitecture

struct SignInReduce {}

extension SignInReduce {
    
    // MARK: Action
    
    enum Action {
        case appleSignIn
        case signIn(email: String,
                    password: String)
        case signIn(providerID: String,
                    idToken: String,
                    nonce: String?)
        case update(response: FirebaseSignInServer.Response,
                    name: String,
                    email: String)
        case fetchKvToken(jid: String,
                          email: String,
                          idToken: String)
    }

    // MARK: States

    struct States {
        var user: User
    }
    
    // MARK: Environment
    
    struct Environment {
        
        let appleService: AppleSignInServer
        
        let firebaseService: FirebaseSignInServer
        
        let kvTokenService: KVTokenServer
        
        static let test: Environment = .init(appleService: MockAppleSignInService(),
                                             firebaseService: MockFirebaseSignInService(),
                                             kvTokenService: MockKVTokenService())
    }
    
    
}
