////
////  TextView.swift
////  MoneyTracker
////
////  Created by Olha Bereziuk on 18.08.24.
////
//
//import SwiftUI
//
//struct TextView: View {
//    
//    let text: String
//    var style: CustomFontStyle
//    
//    init(text: String, style: CustomFontStyle = .regular) {
//        self.text = text
//        self.style = style
//    }
//    
//    var body: some View {
//        Text(text.uppercased())
//            .font(.customFont(style: self.style, size: .body))
//            .foregroundStyle(.white.opacity(0.9))
//    }
//}
//
//#Preview {
//    TextView(text: "Example text")
//}
