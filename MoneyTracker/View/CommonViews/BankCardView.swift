//
//  BankCardView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 20.03.24.
//

import SwiftUI

struct BankCardView: View {
    
    //MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 22) {
            
            HStack {
                Text("N26")
                    .font(.title3 .bold())
                    .foregroundStyle(.white)
                Spacer()
                Text("EUR")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                Spacer()
                Text("YEVA")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 24)
            
            Text("Balance:  ")
                .font(.title2)
                .fontWeight(.regular)
                .foregroundStyle(.white)
            +
            Text("3123,18")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.green)
            
            Text("-" + "115,67")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.red)
        }
        .padding(.vertical, 30)
        .background {
            TransparentBlurView(removeAllFilters: true)
                .blur(radius: 9, opaque: true)
                .background(.white.opacity(0.1))
        }
        .clipShape(.rect(cornerRadius: 10, style: .continuous))
        ///Light White Border
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(.white.opacity(0.3), lineWidth: 1.5)
        }
        /// Adding Shadow
        .shadow(color: .black.opacity(0.2), radius: 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

// MARK: - Preview
#Preview {
    BankCardView()
}
