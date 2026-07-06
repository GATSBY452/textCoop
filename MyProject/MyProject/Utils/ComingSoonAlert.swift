//
//  CominSoonAlert.swift
//  MyProject
//
//  Created by Yusuf Abbas on 06/07/2026.
//

import SwiftUI

struct ComingSoonAlert: ViewModifier {
    @Binding var isPresented: Bool
    let feature: String
    
    func body(content: Content) -> some View{
        content.alert("Coming Soon", isPresented : $isPresented){
            Button("OK",role: .cancel) {}
        } message: {
            Text("\(feature) is coming soon")
        }
    }
}


