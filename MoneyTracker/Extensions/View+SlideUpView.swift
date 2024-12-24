//
//  View+SlideUpView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 24.12.24.
//

import SwiftUI

extension View {
    /// The modifier presents the view that slide up from the bottom edge and moves back down when dismissing
    
    func slideUpView<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        ZStack {
            self
            SlideUpView(isPresented: isPresented, content: content)
        }
    }
}
