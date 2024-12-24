//
//  SlideUpView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 23.12.24.
//

import SwiftUI

/// View slides up from the bottom edge and moves back down when dismissing
/// Use via View modifier, example:
/// .slideUpView(isPresented: self.$showNewRecordView) { NewRecordView(onDismiss: { self.showNewRecordView = false }) }

struct SlideUpView<Content: View>: View {
    
    // MARK: - State
    @Binding var isPresented: Bool
    @State private var offset: CGFloat = UIScreen.main.bounds.height
    
    // MARK: - Content
    let content: () -> Content
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Spacer()
                    content()
                        .frame(height: geometry.size.height)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(32)
                        .shadow(
                            color: Color.black.opacity(0.2),
                            radius: 50, x: 0, y: -10
                        )
                        .transition(.move(edge: .bottom))
                        .offset(y: self.offset)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
        .onChange(of: self.isPresented) {
            withAnimation(.easeInOut(duration: 0.3)) {
                self.offset = self.isPresented ? 0 : UIScreen.main.bounds.height
            }
        }
    }
}
