//
//  EditRecordView.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 17.08.24.
//

import SwiftUI

struct EditRecordView: View {
    // MARK: - Environment
    @Environment(\.dismiss) var dismiss
    
    @Binding var recordTimestamp: Date // here must be UUID
    @State var recordType = "REGULAR EXPENSES"
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradView()
            VStack {
                CancelButtonView(action: { dismiss() })
                TextHeaderView(text: "EDITING")
                    .padding(.top, 16)
                
                VStack(spacing: 32) {
                    self.dateEditorView
                    
                    self.recordTypeView
                    
                    Spacer()
                }
                
                .padding(.top, 16)
                
            }
            .padding(.top, 16)
        }
        .foregroundStyle(.white)
    }
    
    private var dateEditorView: some View {
        ZStack {
            BackgroundRectangleView(heigt: 50)
            HStack {
                DateTitleView(
                    date: self.$recordTimestamp,
                    style: .regular,
                    size: .body
                )
                Spacer()
                self.chevronRight
            }
            .padding(.horizontal, 32)
        }
    }
    
    // TODO: - extract chevron views to a separate view
    private var chevronRight: some View {
        Image(systemName: "chevron.right")
            .font(.customFont(style: .semibold, size: .body))
            .onTapGesture {
                // TODO: - display date picker
                Constants.vibrateLight()
            }
    }
    
    private var recordTypeView: some View {
        ZStack {
            BackgroundRectangleView(heigt: 50)
            HStack {
                TextTitleView(text: self.$recordType, style: .regular)
                Spacer()
            }
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    EditRecordView(recordTimestamp: .constant(Date.now))
}
