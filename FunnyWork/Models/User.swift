//
//  User.swift
//  FunnyWork
//
//  Created by IOS on 25/05/2023.
//

import Foundation
struct User: Codable {
    let id: String
    let name: String
    let email: String
    
    let joined: TimeInterval
}
