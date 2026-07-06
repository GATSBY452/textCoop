//
//  SaccoLoginViewModel.swift
//  MyProject
//
//  Created by Yusuf Abbas on 06/07/2026.
//

import UIKit
import Combine


class LoginViewModel : ObservableObject {
   
    @Published var username: String
    @Published var password: String = ""
    @Published var isPasswordVisible = false
    @Published var isLoggingIn = false
    
    let sacco : SaccoModel
    var onLoginSucceeded: ((_ maskedPhone: String, _ otp: String) -> Void)?
    
    init(sacco: SaccoModel, prefillUsername: String = "34567789") {
        self.sacco = sacco
        self.username = prefillUsername
     
    }
    
    var isValid: Bool {
        !username.isEmpty && password.isEmpty
    }
    
    func login() {
        guard isValid else {return}
        isLoggingIn = true
        
        Task{
            try? await Task.sleep(nanoseconds: 1000000000)
            await MainActor.run {
                isLoggingIn = false
                let otp = String(format: "%06d", Int.random(in: 0...999999))
                print("mock OTP for \(sacco.name): login: \(otp)")
                onLoginSucceeded?("072*****768",otp)
            }
        }
    }
    
    
}

