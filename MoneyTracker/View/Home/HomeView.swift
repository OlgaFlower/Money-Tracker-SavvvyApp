//
//  HomeView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 20.03.24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: HomeViewModel
    @State private var currentDate : Date = Date()
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .center, spacing: 24) {
                    ///Custom Date Picker
                    CustomDatePicker(currentDate: self.$currentDate)
                    
                    /// Bank Cards
                    self.makeCardsView()
                    
                    /// Log Range Explorer Picker
                    TotalLogExplorer()
                    
                    Spacer()
                }
            }
            .navigationTitle("March 2024")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleTextColor(.mainNavy)
        }
    }
    
    // MARK: - Views
    private func makeOneBankCardView(card: BankCardModel) -> some View {
        BankCardView(bankCard: card)
    }
    
    private func makeManyBankCardsView() -> some View {
        ForEach(self.viewModel.bankCards) { card in
            BankCardView(bankCard: card)
        }
    }
    
    @ViewBuilder
    private func makeCardsView() -> some View {
        if self.viewModel.bankCards.count == 1, let card = self.viewModel.bankCards.first {
            self.makeOneBankCardView(card: card)
                .padding(.vertical)
        } else {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    self.makeManyBankCardsView()
                        .containerRelativeFrame(.horizontal)
                        .scrollTransition(.animated, axis: .horizontal) { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.8)
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                        }
                }
                .padding(.bottom, 35)
                .padding(.top, 4)
                .scrollTargetLayout()
                .overlay(alignment: .bottom) {
                    PagingIndicator(
                        activeTint: .mainOrange,
                        inactiveTint: .mainNavy.opacity(0.3),
                        opacityEffect: true,
                        clipEdges: true
                    )
                    .offset(y: 15)
                }
            }
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
