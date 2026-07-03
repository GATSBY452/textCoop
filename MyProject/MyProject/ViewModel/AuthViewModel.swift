//
//  AuthViewModel.swift
//  MyProject
//
//  Created by Yusuf Abbas on 03/07/2026.
//

import Foundation

class AuthViewModel {
    let shared = AuthViewModel()
    
    final class OTPService {
        func requestOtp(id: Int) async throws -> lookupResponse {
            guard id > 0 else { throw TestError.invalidId}
            
            try await Task.sleep(nanoseconds: 1000000000)
            let otp = String(format: "%06d", Int.random(in: 100000...999999))
            
            return lookupResponse(
                success: true,
                id: id,
                otp: otp,
                expiresIn: 300,
                message: "User found.Otp sent successfully")
            
        }
    }
}

enum TestError : Error,LocalizedError{
    case invalidId
    case requestFailed
    var errorDescription: String?{
        switch self{
        case .invalidId : return "Invalid id"
        case .requestFailed: return "request failed"
        }
    }
}
