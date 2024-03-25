//
//  CustomDatePicker.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 21.03.24.
//

import SwiftUI

struct CustomDatePicker: View {
    
    // MARK: - Properties
    @Binding var currentDate: Date
    
    // MARK: - Body
    var body: some View {
        
        VStack {
            HStack {
                /// <
                Button(action: {
                    
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                })
                /// Text
                Spacer()
                Text("Today")
                    .font(.headline)
                Text("")
                    .font(.headline)
                Spacer()
                
                /// >
                Button(action: {
                    
                }, label: {
                    Image(systemName: "chevron.right")
                        .font(.headline)
                })
            }
            .padding()
        }
        .padding(.horizontal, 12)
        .foregroundStyle(.mainNavy)
    }
}

#Preview {
    HomeView()
}
