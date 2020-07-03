//
//  User.swift
//  Activity 10
//
//  Created by Ammar Altahhan on 03/07/2020.
//  Copyright © 2020 Udacity. All rights reserved.
//

import Foundation

// MARK: - User

struct User: Codable {
    let account: Account?
    let session: Session?
}


// MARK: - Account

struct Account: Codable {
    let registered: Bool?
    let key: String?
}


// MARK: - Session

struct Session: Codable {
    let id: String?
    let expiration: String?
}
