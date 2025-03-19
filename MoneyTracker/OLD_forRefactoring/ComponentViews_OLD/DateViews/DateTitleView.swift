////
////  DateTitleView.swift
////  MoneyTracker
////
////  Created by Olha Bereziuk on 16.08.24.
////
//
//import SwiftUI
//
//struct DateTitleView: View {
//    
//    @Binding var date: Date
//    let style: CustomFontStyle
//    let size: CustomFontSize
//    
//    
//    var body: some View {
//        HStack {
//            Text(date.formattedDayMonthYear().uppercased())
//                .font(.customFont(
//                    style: self.style,
//                    size: self.size
//                ))
//                .opacity(0.9)
//                .foregroundStyle(.white)
//        }
//    }
//}
//
//#Preview {
//    DateTitleView(
//        date: .constant(Date.now),
//        style: .medium,
//        size: .body
//    )
//}
