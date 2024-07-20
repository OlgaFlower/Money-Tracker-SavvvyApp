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
                        .font(.customFont(style: .regular, size: .title))
                })
                /// Text
                Spacer()
                Text("Today")
                    .font(.customFont(style: .regular, size: .title))
                Text("")
                    .font(.customFont(style: .regular, size: .title))
                Spacer()
                
                /// >
                Button(action: {
                    
                }, label: {
                    Image(systemName: "chevron.right")
                        .font(.customFont(style: .regular, size: .title))
                })
            }
            .padding(.top)
        }
        .padding(.horizontal, 12)
        .foregroundStyle(.mainNavy)
    }
}

#Preview {
    BankAccountsView(viewModel: BankAccountsViewModel())
}
