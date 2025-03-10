//
//  HomeView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 14.12.24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - States
    @State var isButtonActive: Bool = true
    @State private var isNewRecordPresented = false
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            self.backgroundView
            HomeHeaderView()
                .padding(.horizontal, 20)
            VStack {
                WelcomeView()
                
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    self.addNewRecord()
                        .padding(.trailing, 12)
                }
                .padding(.bottom, 12)
            }
        }
        .fullScreenCover(isPresented: self.$isNewRecordPresented, content: {
            NewRecordView(
                viewModel: NewRecordViewModel(),
                onDismiss: {
                self.isNewRecordPresented.toggle()
            })
        })
    }
    
    //MARK: - Views
    private var backgroundView: some View {
        Color(uiColor: UIColor.secondarySystemBackground)
            .ignoresSafeArea()
    }
    
    private var addButtonView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 50, height: 50)
                .foregroundStyle(.blue)
            Image(systemName: "plus")
                .font(.system(size: 26, weight: .regular, design: .default))
                .foregroundStyle(.white)
        }
    }
    
    private func addNewRecord() -> some View {
        self.addButtonView
            .onTapGesture {
                VibrateService.vibrateMedium()
                self.isNewRecordPresented.toggle()
            }
    }
}

// MARK: - Preview
#Preview {
    HomeView()
}
