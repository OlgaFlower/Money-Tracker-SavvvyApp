//
//  BankCardView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 20.03.24.
//

import SwiftUI

struct BankCardView: View {
    
    //MARK: - Properties
    private let width = UIScreen.main.bounds.width - 24
    private let height = UIScreen.main.bounds.width * 0.6
    let bankName = "N26"
    let cardholderName = "YEVA"
    let balance = "3542,67"
    let currency = "€"
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(.black.opacity(0.3))
                        .frame(height: self.height / 2)
                        .background {
                            TransparentBlurView(removeAllFilters: true)
                                .blur(radius: 7, opaque: false)
                                .background(.black.opacity(0.1))
                        }
                    
                    VStack(spacing: 10) {
                        HStack {
                            Text(self.bankName)
                            Spacer()
                            Text(self.cardholderName)
                        }
                        .font(.title3.bold())
                        Text("Your Balance")
                        Text(self.balance + " " + self.currency)
                            .font(.title.bold())
                    }
                    .padding(.horizontal, 22)
                }
            }
            .foregroundStyle(.white)
            .frame(width: self.width, height: self.height)
            .background {
                Image("art_1")
                
            }
            .clipShape(.rect(cornerRadius: 10, style: .continuous))
            ///Light White Border
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.black.opacity(0.5), lineWidth: 1.3)
            }
            /// Adding Shadow
            .shadow(color: .black.opacity(0.5), radius: 10, x: 7, y: 7)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

// MARK: - Preview
#Preview {
    BankCardView()
}
