//
//  DropDownMenuView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 22.04.24.
//

import SwiftUI

struct DropDownMenuView: View {
    
    // MARK: - Properties
    @State var show = true
    @State var selectedItem: RecordType = .expense
    let cellHeight = 60
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            BackgroundGradView()
            VStack {
                ZStack {
                    /// List of items
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 16) {
                                ForEach(Constants.shared.newRecordTypes.indices, id: \.self) { record in
                                    
                                    /// Separator
                                    if record != 0 {
                                        Rectangle()
                                            .frame(height: 0.5)
                                            .foregroundColor(self.show ? .white : .clear)
                                    }
                                    
                                    /// Item
                                    Button(action: {
                                        withAnimation {
                                            self.selectedItem = Constants.shared.newRecordTypes[record]
                                            self.show.toggle()
                                        }
                                    }, label: {
                                        Text(Constants.shared.newRecordTypes[record].value)
                                            .foregroundStyle(self.show ? .white : .clear)
                                            .font(.title3)
                                        Spacer()
                                    })
                                }
                                .padding(.horizontal)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 16)
                        }
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 0.5)
                            .foregroundStyle(.white)
                    }
                    .frame(height: self.show ? CGFloat(Constants.shared.newRecordTypes.count * self.cellHeight) : 60)
                    .offset(y: self.show ? -55 : -153)
                    .foregroundStyle(self.show ? .white.opacity(0.05) : .clear)
                    
                    
                    /// Selection
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 60)
                            .foregroundStyle(.white.opacity(0.1))
                        
                        HStack {
                            Text(self.selectedItem.value)
                                .font(.title3)
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .rotationEffect(.degrees(self.show ? 90 : 0))
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 0.5)
                            .frame(height: 60)
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
            .frame(height: 192)
        .offset(y: 90)
        }
    }
}

#Preview {
    DropDownMenuView()
}
