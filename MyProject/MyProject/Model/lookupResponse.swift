//
//  lookupResponse.swift
//  MyProject
//
//  Created by Yusuf Abbas on 03/07/2026.
//

import Foundation

struct lookupResponse {
    let success : Bool
    let id : Int
    let otp : String
    let expiresIn: Int
    let message: String
}
