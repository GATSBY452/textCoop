//
//  OTPView.swift
//  MyProject
//
//  Created by Yusuf Abbas on 06/07/2026.
//

import SwiftUI

struct OTPView: View {
    @ObservedObject var viewModel : OTPViewModel
    @FocusState private var focusedIndex: Int?
    
    
    var body: some View {
        VStack(spacing: 20){
            Text("OTP Verificatrion")
                .font(.system(size: 20,weight: .bold))
                .padding(.top,16)
            VStack(spacing: 4) {
                Text("Enter the verification code sent to")
                    .foregroundColor(.secondary)
                Text(viewModel.maskedPhone)
                    .font(.system(size: 16,weight: .bold))
            }
            
            Text("SMS sent - may take up to 60s")
                .font(.caption)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.green.opacity(0.1))
                .foregroundColor(.green)
                .clipShape(Capsule())
            
            HStack (spacing: 10){
                ForEach(0..<6, id: \.self) { index in
                    if index == 3 {
                        Text("-").foregroundColor(.secondary)
                    }
                    OTPDigitField(text: $viewModel.digits[index])
                        .focused($focusedIndex,equals: index)
                        .onChange(of: viewModel.digits[index]){ newValue in
                            if !newValue.isEmpty, index < 5 {
                                focusedIndex = index + 1
                            }
                            
                        }
                }
            }
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .font(.footnote)
                    .foregroundColor(.red)
            }
            
            Group {
                if viewModel.canResend {
                    Text("Resend code")
                        .foregroundColor(.green)
                } else {
                    Text("Resend code in 0: \( String(format: "%02d", viewModel.secondsRemaining))")
                        .foregroundColor(.secondary)
                    
                }
            }
            .font(.footnote)
            .onTapGesture {
                viewModel.resed()
            }
            
            Button(action: viewModel.Verify) {
                
                Group {
                    if viewModel.isVerifying {
                        ProgressView().tint(.white)
                    } else {
                        Text("Submit").font(.subheadline)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                
            }
            .background(viewModel.isComplete ? Color.green : Color.green.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .disabled(!viewModel.isComplete || viewModel.isVerifying)
            
        }
        .padding(24)
        .onAppear {focusedIndex = 0}
    }
    
}
