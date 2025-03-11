//
//  Category.swift
//  Monika
//
//  Created by Olha Bereziuk on 11.03.25.
//

import SwiftUI

//Category Model
struct Category: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let color: Color
}
