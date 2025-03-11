////
////  DescriptionTextfieldView.swift
////  MoneyTracker
////
////  Created by Olha Bereziuk on 12.09.24.
////
//
//import SwiftUI
//
//struct DescriptionTextfieldView: View {
//    
//    @Binding var notes: String
//    
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .foregroundStyle(Color.lightBlue.opacity(0.5))
//                .frame(height: 92)
//            /// Placeholder
//            if self.notes.isEmpty {
//                TextView(text: self.notes.isEmpty ? "description" : "")
//                    .opacity(0.4)
//                    .padding(.horizontal, 12)
//            }
//            
//            TextField("", text: self.$notes, axis: .vertical)
//                .font(.customFont(style: .regular, size: .body))
//                .padding(.horizontal)
//                .lineLimit(1...3)
//                .autocorrectionDisabled(true)
//                .keyboardType(.asciiCapable)
//                .frame(width: UIScreen.main.bounds.width - 24)
//        }
//        .foregroundStyle(.white)
//    }
//}
//
//#Preview {
//    DescriptionTextfieldView(notes: .constant(""))
//}
