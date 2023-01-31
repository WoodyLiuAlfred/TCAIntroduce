//
//  FirebaseSignInServerService.swift
//  TCAIntroduce
//
//  Created by Woody Liu on 2023/1/31.
//

import Foundation
import Combine

extension FirebaseSignInServer.Response {
    static var test: Self {
        return .init(idToken: "Test Firebase idToken",
                     refreshToken: "Test Firebase refreshToken",
                     date: Date(),
                     providerID: "Test Firebase provideID",
                     userId: "Test Firebase userID")
    }
}
