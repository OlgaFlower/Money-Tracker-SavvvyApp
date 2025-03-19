////
////  TodayView.swift
////  MoneyTracker
////
////  Created by Olha Bereziuk on 31.03.24.
////
//
//import SwiftUI
//
//struct TodayView: View {
//    
//    // MARK: - States
//    @StateObject private var viewModel = TodayViewModel()
//    @State var newRecordViewPresented = false
//    @State var detailViewPresented = false
//    @State private var alertPresented = false
//    @State var chartAnimated = false
//    @State var needToUpdateValues = false
//    
//    // MARK: - Body
//    var body: some View {
//        ZStack {
//            BackgroundGradView()
//            VStack {
//                /// Plus Button
//                self.plusButtonView
//                
//                /// Chart View
//                TodayChartView(
//                    animatedLeftover: self.viewModel.leftover,
//                    animatedBudget: self.viewModel.dayBudget,
//                    leftoverTextColor: self.viewModel.leftoverTextColor,
//                    chartAnimated: self.chartAnimated
//                )
//                .frame(width: 260, height: 260)
//                .onTapGesture {
//                    self.chartAnimated.toggle()
//                    self.viewModel.vibrate()
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                        self.chartAnimated.toggle()
//                    }
//                }
//                
//                /// Budget Information Board
//                HorizontalBudgetBoardView(
//                    alertPresented: self.$alertPresented,
//                    detailViewPresented: self.$detailViewPresented,
//                    dayBudget: self.$viewModel.dayBudget,
//                    todayExpenses: self.$viewModel.todayExpenses, 
//                    needToUpdateValues: self.$needToUpdateValues
//                )
//                .padding(.horizontal, 24)
//                .padding(.top, 35)
//                
//                Spacer()
//            }
//            .padding(.top, 25)
//        }
//        .onAppear {
//            self.viewModel.updateValues()
//        }
//        .onChange(of: self.needToUpdateValues, {
//            if self.needToUpdateValues {
//                self.viewModel.updateValues()
//            }
//        })
//    }
//    
//    // MARK: - Views
//    private var plusButtonView: some View {
//        HStack {
//            Spacer()
//            Button(action: {
//                self.viewModel.vibrateLight()
//                self.newRecordViewPresented.toggle()
//            }, label: {
//                Image(systemName: "plus")
//                    .font(Font.system(size: 36))
//                    .foregroundStyle(.white)
//            })
//            .fullScreenCover(
//                isPresented: self.$newRecordViewPresented) {
//                    withAnimation {
//                        self.viewModel.updateValues()
//                    }
//                }
//        content: { MakeNewMoneyRecordView(
//            viewModel: MakeNewMoneyRecordViewModel()
//          )}
//        }
//        .padding(.trailing, 40)
//    }
//}
//
//// MARK: - Preview
//#Preview {
//    TodayView()
//}
