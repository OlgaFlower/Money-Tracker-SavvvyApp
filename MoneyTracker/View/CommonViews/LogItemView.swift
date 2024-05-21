//
//  LogItemView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 29.03.24.
//

import SwiftUI

struct LogItemView: View {
    // MARK: - Properties
    var record: MoneyModel
    
    // MARK: - Body
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
                
                ZStack {
                    Rectangle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.clear)
                    Image(systemName: record.category.icon)
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                VStack(alignment: .leading) {
                    Text(record.category.name)
                    if !record.description.isEmpty {
                        Text(record.description)
                            .font(.subheadline)
                            .foregroundStyle(.mainNavy.opacity(0.6))
                    }
                }
                
                Spacer()
                Text("\(record.recordType == .income ? "+" : "-") \(record.moneyAmount)")
                Text(Country.euro.currencySymbol)
            }
            .padding(.vertical, 4)
            
            Rectangle()
                .frame(height: 0.5)
                .opacity(0.3)
        }
        .onTapGesture {
            print(record.category.name)
        }
    }
}

//#Preview {
//    LogItemView(
//        record: MoneyModel(
//            recordType: .expense,
//            category: Category(
//                name: "Medicines",
//                iconName: "cross.case"
//            ),
//            moneyAmount: "345",
//            description: "",
//            currency: "EUR"
//        )
//    )
//}
