//
//  AppleSignInServer.swift
//  TCAIntroduce
//
//  Created by Woody Liu on 2023/1/31.
//

import Foundation
import Combine

struct AppleUser {
    let identityToken: String
    let user: String
    let email: String?
    let name: PersonNameComponents?
    let nonce: String
    
    private init() {
        self.identityToken = ""
        self.user = ""
        self.email = ""
        self.name = PersonNameComponents()
        self.nonce = ""
    }
    
    static let test: AppleUser = .init()
}

protocol AppleSignInServer {
    func tryStart() async throws -> AppleUser
    func tryStart() -> AnyPublisher<AppleUser, Error>
}
