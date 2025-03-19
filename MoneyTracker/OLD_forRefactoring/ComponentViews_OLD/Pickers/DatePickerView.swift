////
////  DatePickerView.swift
////  MoneyTracker
////
////  Created by Olha Bereziuk on 08.09.24.
////
//
//import SwiftUI
//
//struct DatePickerView: View {
//    // MARK: - States
//    @Binding var recordTimestamp: Date
//    @Binding var isPresented: Bool
//    @State var newDate = Date.now
//    
//    // MARK: - Properties
//    var dateRange: ClosedRange<Date>
//    
//    // MARK: - Init
//    init(recordTimestamp: Binding<Date>, isPresented: Binding<Bool>) {
//        self._recordTimestamp = recordTimestamp
//        self._isPresented = isPresented
//        dateRange = Date.distantPast...Date.distantFuture
//    }
//    
//    // MARK: - Body
//    var body: some View {
//        VStack {
//            ZStack {
//                RoundedRectangle(cornerRadius: 5)
//                    .frame(width: UIScreen.main.bounds.size.width - 84, height: 36)
//                    .foregroundColor(.lightBlue)
//                DatePicker(
//                    "",
//                    selection: $newDate,
//                    in: dateRange,
//                    displayedComponents: [.date]
//                )
//                .datePickerStyle(WheelDatePickerStyle())
//                .labelsHidden()
//                .padding()
//            }
//            HStack {
//                Button("CANCEL") {
//                    isPresented.toggle()
//                }
//                .font(.customFont(style: .regular, size: .body))
//                .foregroundColor(.white.opacity(0.9))
//                .padding(.leading, 42)
//                
//                Spacer()
//                
//                Button("UPDATE") {
//                    self.recordTimestamp = self.newDate
//                    isPresented.toggle()
//                }
//                .font(.customFont(style: .medium, size: .body))
//                .foregroundColor(.white.opacity(0.9))
//                .padding(.trailing, 42)
//            }
//            .padding(.bottom)
//        }
//        .padding()
//        .background(
//            RoundedRectangle(cornerRadius: 14)
//                .fill(.white.opacity(0.1))
//                .stroke(.white.opacity(0.1), lineWidth: 1)
//                .padding(.horizontal)
//        )
//        .cornerRadius(12)
//        .shadow(radius: 10)
//        .colorScheme(.dark)
//    }
//}
//
//#Preview {
//    DatePickerView(recordTimestamp: .constant(Date.now), isPresented: .constant(false))
//}
