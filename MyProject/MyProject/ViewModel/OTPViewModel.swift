//
//  OTPViewModel.swift
//  MyProject
//
//  Created by Yusuf Abbas on 06/07/2026.
//

import Foundation
import Combine

class OTPViewModel : ObservableObject {
    @Published var digits: [String] = Array(repeating: "", count: 6)
    @Published var secondsRemaining: Int = 59
    @Published var isVerifying = false
    @Published var errorMessage: String?
    
    let maskedPhone: String
    private let expectedOTP: String
    var onVerified: (() -> Void)?
    
    private var timer : Timer?
    
    init(maskedPhone: String,expectedOTP: String) {
        self.maskedPhone = maskedPhone
        self.expectedOTP = expectedOTP
        startTimer()
    }
    
    var isComplete: Bool { digits.allSatisfy { !$0.isEmpty } }
    var canResend: Bool { secondsRemaining == 0 }
    
    func startTimer() {
        secondsRemaining = 59
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self, self.secondsRemaining > 0 else {return}
            self.secondsRemaining -= 1
        }
    }
    
    func resed() {
        guard canResend else {return}
        startTimer()
    }
    
    func Verify() {
        guard isComplete else {return}
        isVerifying = true
        
        Task{
            try? await Task.sleep(nanoseconds: 900000000)
            await MainActor.run {
                isVerifying = false
                if digits.joined() == expectedOTP {
                    onVerified?()
                } else {
                    errorMessage = "Incorect code, please try again."
                    digits = Array(repeating: "", count: 6)
                }
            }
        }
    }
    
    deinit {
        timer?.invalidate()
    }
    
    
}
