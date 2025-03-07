//
//  PinkButtonView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 07.03.25.
//

import SwiftUI

struct PinkButtonView: View {
    
    @State private var isActiveBtnState: Bool = true
    private var isActiveBinding: Binding<Bool>?
    var title: String
    var action: () -> Void
    
    // MARK: - Initializers
    init(
        isActive: Binding<Bool>,
        title: String,
        action: @escaping () -> Void
    ) {
        self.isActiveBinding = isActive
        self.title = title
        self.action = action
    }
    
    init(
        title: String,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }
    
    // MARK: - Body
    var body: some View {
        let isActive = self.isActiveBinding?.wrappedValue ?? self.isActiveBtnState
        
        ButtonContentView(
            title: self.title,
            isActive: isActive
        )
        .animation(.easeInOut(duration: 0.5), value: isActive)
        .onTapGesture {
            VibrateService.vibrateMedium()
            action()
        }
    }
}

#Preview {
    PinkButtonView(
        title: "Save",
        action: {}
    )
}
