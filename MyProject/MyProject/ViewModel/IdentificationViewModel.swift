//
//  IdentificationViewModel.swift
//  MyProject
//
//  Created by Yusuf Abbas on 05/07/2026.
//

import Foundation

class IdentificationViewModel {
    
    var nationalId : String = "" {
        didSet { onValidationChanged?(isValid) }
        
    }
    
    var onValidationChanged: ((Bool) -> Void)?
    var onFetchingChanged: ((Bool) -> Void)?
    var onOTPRequired: ((_ masked: String,_ otp: String, _ saccos: [SaccoModel]) -> Void)?
    var onError: ((String) -> Void)?
    
    private var isValid: Bool {
        nationalId.count >= 7 && nationalId.allSatisfy(\.isNumber)
    }
    
    func submit() {
        guard isValid else {return}
        onFetchingChanged?(true)
        
        Task {
            try? await Task.sleep(nanoseconds: 1200000000)
            await MainActor.run {
                onFetchingChanged?(false)
                
                let otp = String(format: "%06d", Int.random(in: 0...999999))
                print("mock OTP for national ID \(nationalId): \(otp)")
                
                onOTPRequired?("072****768",otp,[
                    SaccoModel(name: "Bingwa Sacco Ltd", logoAssetName: "bingwa_logo"),
                    SaccoModel(name: "Kenya National Police DT Sacco", logoAssetName: "police_logo"),
                    SaccoModel(name: "Muki Sacco Society", logoAssetName: "muki_logo")
                    
                ])
            }
        }
    }
    
    
}
