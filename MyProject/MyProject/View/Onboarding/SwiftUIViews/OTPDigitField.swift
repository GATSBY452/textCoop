//
//  OTPDigitField.swift
//  MyProject
//
//  Created by Yusuf Abbas on 06/07/2026.
//

import SwiftUI

struct OTPDigitField: View {
    @Binding var text: String
    
    var body: some View {
        TextField("",text: $text)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .frame(width: 40,height: 48)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.secondary.opacity(0.4))
            )
            .onChange(of: text) { newValue in
                if newValue.count > 1 {
                    text = String(newValue.suffix(1))
                }
            }
        
    }
}

