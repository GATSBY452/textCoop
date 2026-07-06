//
//  LoginView.swift
//  MyProject
//
//  Created by Yusuf Abbas on 06/07/2026.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    var onForgotPassword: (() -> Void)?
    var onGetHelp: (() -> Void)?
    var onSwitchSacco: (() -> Void)?
    @State private var comingSoonFeature: String?
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let logo = UIImage(named: viewModel.sacco.logoAssetName){
                    Image(uiImage: logo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                        .padding(.top, 40)
                }
                
                Text("Welcome back Eugene")
                    .font(.system(size: 18,weight: .bold))
                
                VStack(alignment: .leading,spacing: 8) {
                    Text("Username").font(.footnote).foregroundColor(.secondary)
                    TextField("",text: $viewModel.username)
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary.opacity(0.3)))
                }
                
                VStack(alignment: .leading,spacing: 8) {
                    Text("Password").font(.footnote).foregroundColor(.secondary)
                    HStack{
                        Group{
                            if viewModel.isPasswordVisible {
                                TextField("Enter your password", text: $viewModel.password)
                            } else {
                                SecureField("Enter your password",text: $viewModel.password)
                            }
                        }
                        
                        Button {
                            viewModel.isPasswordVisible.toggle()
                        } label: {
                            Image(systemName: viewModel.isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary.opacity(0.3)))
            
                }
                
                HStack {
                    Spacer()
                    Button("Forgot Password?") {
                        comingSoonFeature = "Forgot Password"
                    }
                }
                
                Button(action: viewModel.login){
                    Group {
                        if viewModel.isLoggingIn {
                            ProgressView().tint(.blue)
                        } else {
                            Text("Login").fontWeight(.semibold)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    
                }
                .background(viewModel.isValid ? Color.blue : Color.blue.opacity(0.4))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .disabled(!viewModel.isValid || viewModel.isLoggingIn)
                
                Button("Get help") {
                    comingSoonFeature = "Get help"
                }
                
                Spacer(minLength: 60)
                
                Button("I have another Sacco" , action: {onSwitchSacco?() })
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .padding(24)
            .comingSoonAlert(isPresented: Binding(
                get: {comingSoonFeature != nil},
                set: { if !$0 {comingSoonFeature = nil}}
            ), feature: comingSoonFeature ?? "")
        }
    }
}
