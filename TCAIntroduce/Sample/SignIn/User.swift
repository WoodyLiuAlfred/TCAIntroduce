//
//  User.swift
//  TCAIntroduce
//
//  Created by Woody Liu on 2023/1/31.
//

import Foundation

public struct User: Hashable {
    /// The user's email address.
    let email: String
    let name: String?
    let providerID: String
    let date: Date
    let alfredId: String
    let kvToken: KVToken
    let firebaseIDToken: String
    let firebaseRefreshToekn: String
}
