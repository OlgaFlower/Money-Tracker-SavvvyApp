//
//  DropDownMenuView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 22.04.24.
//

import SwiftUI

struct DropDownMenuView: View {
    
    // MARK: - Properties
    @State var show = false
    @State var selectedItem: RecordType = .expense
    private let dropDownMenuWidth = UIScreen.main.bounds.width - 32
    
    
    // MARK: - Body
    var body: some View {
            VStack {
                ZStack {
                    /// List of items
                    HStack {
                        ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    VStack {
                                        ForEach(Constants.newRecordTypes.indices, id: \.self) { record in
                                            self.makeCellView(index: record)
                                        }
                                    }
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 0.5)
                                    .foregroundStyle(self.show ? .white.opacity(0.3) : .clear)
                            }
                            .frame(width: self.dropDownMenuWidth, height: self.show ? CGFloat(Constants.newRecordTypes.count) * 52 : 52)
                            .offset(y: self.show ? -69 : -153)
                        .foregroundStyle(self.show ? .lightBlue.opacity(0.4) : .clear)
                    }
                    
                    /// Selected item
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 52)
                            .foregroundStyle(.lightBlue.opacity(0.15))
                        
                        HStack {
                            Text(self.selectedItem.value)
                                .font(.headline)
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .rotationEffect(.degrees(self.show ? 90 : 0))
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white.opacity(0.3), lineWidth: 0.5)
                            .frame(height: 52)
                    }
                    .offset(y: -153)
                    .onTapGesture {
                        withAnimation {
                            self.show.toggle()
                        }
                    }
                }
            }
            .padding()
            .frame(height: 185)
        .offset(y: 90)
        }
    
    private func makeCellView(index: Int) -> some View {
        
        VStack(spacing: 0) {
            /// Separator
            if index != 0 {
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(self.show ? .white : .clear)
                    .opacity(0.3)
                    .padding(.horizontal, 10)
            }
            Spacer()
            /// Item
            Button(action: {
                withAnimation {
                    self.selectedItem = Constants.newRecordTypes[index]
                    self.show.toggle()
                }
            }, label: {
                // TODO: - to fix -> item name is displayed not smoothly, jumping a bit...
                Text(Constants.newRecordTypes[index].value)
                    .foregroundStyle(self.show ? .white : .clear)
                    .font(.subheadline)
            })
            .frame(height: 42)
        }
        .frame(width: self.dropDownMenuWidth, height: 43)
    }
}

#Preview {
    MakeNewMoneyFlowRecordView()
}
