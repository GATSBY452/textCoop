//
//  View.swift
//  MyProject
//
//  Created by Yusuf Abbas on 06/07/2026.
//

import SwiftUI

extension View {
    func comingSoonAlert(isPresented: Binding<Bool>, feature: String) -> some View {
        modifier(ComingSoonAlert(isPresented: isPresented, feature: feature))
    }
}

