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
}
