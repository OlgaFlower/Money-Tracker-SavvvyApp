//
//  SelectorButtonView.swift
//  Savvvy
//
//  Created by Olha Bereziuk on 12.12.24.
//

import SwiftUI

struct SelectorButtonView: View {
    
    // MARK: - Properties
    var title: String
    var systemIconName: String
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            self.backgroundView
            
            HStack {
                self.iconView
                self.titleView
                Spacer()
                self.circleWithChevron
                
            }
        }
    }
    
    // MARK: - Views
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundStyle(.background.secondary)
            .frame(height: 55)
    }
    
    private var circleWithChevron: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .frame(width: 40, height: 40)
                .foregroundStyle(.background.tertiary)
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.pink)
        }
        .padding(.trailing, 8)
    }
    
    private var iconView: some View {
        Image(systemName: self.systemIconName)
            .frame(width: 24, height: 22)
            .font(.system(size: 20, weight: .regular, design: .default))
            .foregroundStyle(.tertiary)
            .padding(.leading, 15)
    }
    
    private var titleView: some View {
        Text(self.title)
            .font(.system(size: 16, weight: .semibold, design: .default))
            .padding(.leading, 10)
    }
}

#Preview {
    SelectorButtonView(title: "Country", systemIconName: "flag.fill")
}
