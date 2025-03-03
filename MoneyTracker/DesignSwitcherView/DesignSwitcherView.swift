////
////  DesignSwitcherView.swift
////  Savvvy
////
////  Created by Olha Bereziuk on 15.12.24.
////
//
//import SwiftUI
//
//// MARK: - This is a Temporary view for redesign!
//
//struct DesignSwitcherView: View {
//    
//    @Binding var selectedDesign: String
//    @State var isOldDesignActive: Bool = false
//    @State var isNewDesignActive: Bool = true
//    
//    init(selectedDesign: Binding<String>) {
//        self._selectedDesign = selectedDesign
//    }
//    // MARK: - Body
//    var body: some View {
//        ZStack {
//            Color(uiColor: UIColor.secondarySystemBackground)
//                .ignoresSafeArea()
//            
//            VStack(spacing: 24) {
//                self.titleView
//                self.subtitleView
//                Spacer()
//            }
//            .padding(.top, 50)
//            .padding(.horizontal, 24)
//            
//            VStack(spacing: 24) {
//                PinkButtonView(
//                    isActive: self.$isOldDesignActive,
//                    title: "Old Design",
//                    action: {
//                        VibrateService.vibrateMedium()
//                        self.selectedDesign = "old"
//                        self.isOldDesignActive = true
//                        self.isNewDesignActive = false
//                        UserPreferences.selectedDesign = self.selectedDesign
//                    })
//                .frame(width: 196)
//                .padding(.top, 50)
//                .shadow(color: .pink.opacity(self.isOldDesignActive ? 0.3 : 0), radius: 15, x: -7, y: 7)
//                
//                PinkButtonView(
//                    isActive: self.$isNewDesignActive,
//                    title: "New Design",
//                    action: {
//                        VibrateService.vibrateMedium()
//                        self.selectedDesign = "new"
//                        self.isOldDesignActive = false
//                        self.isNewDesignActive = true
//                        UserPreferences.selectedDesign = self.selectedDesign
//                    })
//                .frame(width: 196)
//                .shadow(color: .pink.opacity(self.isNewDesignActive ? 0.3 : 0), radius: 15, x: -7, y: 7)
//            }
//        }
//    }
//    
//    // MARK: - Views
//    private var titleView: some View {
//        Text("The app is currently undergoing a redesign.")
//            .font(.system(size: 24, weight: .bold, design: .default))
//            .foregroundStyle(Color(uiColor: .secondaryLabel))
//    }
//    
//    private var subtitleView: some View {
//        Text("Here you can choose whether you want to see the app in the new design or in the old one.")
//            .font(.system(size: 18, weight: .medium, design: .default))
//    }
//}
//
//#Preview {
//    DesignSwitcherView(selectedDesign: .constant(""))
//}
