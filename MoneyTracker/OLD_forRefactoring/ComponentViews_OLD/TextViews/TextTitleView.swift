////
////  TextTitleView.swift
////  MoneyTracker
////
////  Created by Olha Bereziuk on 18.08.24.
////
//
//import SwiftUI
//
//struct TextTitleView: View {
//    
//    @Binding var text: String
//    let style: CustomFontStyle
//    var isCentered: Bool
//    
//    var body: some View {
//        HStack {
//            Text(text.uppercased())
//                .font(.customFont(
//                    style: self.style,
//                    size: .body
//                ))
//                .opacity(0.9)
//                .foregroundStyle(.white)
//            if !isCentered {
//                Spacer()
//            }
//        }
//    }
//}
//
//#Preview {
//    TextTitleView(
//        text: .constant("Text example"),
//        style: .medium, 
//        isCentered: false
//    )
//}
