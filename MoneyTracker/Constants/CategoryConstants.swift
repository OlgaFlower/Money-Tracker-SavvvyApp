//
//  CategoryConstants.swift
//  Monika
//
//  Created by Olha Bereziuk on 11.03.25.
//

import Foundation

import SwiftUI

struct CategoryConstants {
    
    // MARK: - Expenses (One-time Purchases)
    static let expense = CategoryGroup(
        type: .expense,
        sections: nil,
        subcategories: [
            // Daily Expenses
            Category(name: "Groceries", icon: "cart.fill", color: .green),
            Category(name: "Dining Out", icon: "fork.knife", color: .red),
            Category(name: "Coffee", icon: "cup.and.saucer.fill", color: .brown),
            
            // Transportation
            Category(name: "Public Transport", icon: "bus.fill", color: .blue),
            Category(name: "Gas", icon: "fuelpump.fill", color: .yellow),
            Category(name: "Taxi / Rideshare", icon: "car.fill", color: .gray),
            
            // Housing
            Category(name: "Home Repairs", icon: "hammer.fill", color: .orange),
            Category(name: "Furniture", icon: "bed.double.fill", color: .purple),
            Category(name: "Appliances", icon: "stove.fill", color: .pink),
            
            // Personal Care
            Category(name: "Haircuts", icon: "scissors", color: .blue),
            Category(name: "Cosmetics", icon: "lipstick", color: .red),
            Category(name: "Spa & Wellness", icon: "figure.mind.and.body", color: .cyan),
            
            // Shopping
            Category(name: "Clothing", icon: "tshirt.fill", color: .purple),
            Category(name: "Shoes", icon: "shoe.fill", color: .gray),
            Category(name: "Accessories", icon: "bag.fill", color: .brown),
            
            // Entertainment
            Category(name: "Movies & Cinema", icon: "film.fill", color: .red),
            Category(name: "Concerts", icon: "music.note", color: .blue),
            Category(name: "Gaming", icon: "gamecontroller.fill", color: .orange),
            
            // Education
            Category(name: "Books", icon: "book.fill", color: .green),
            Category(name: "Courses", icon: "graduationcap.fill", color: .cyan),
            Category(name: "Workshops", icon: "pencil.and.ruler.fill", color: .blue)
        ]
    )
    
    // MARK: - Recurring Expenses (Bills, Subscriptions, Loans)
    static let recurringExpense = CategoryGroup(
        type: .recurringExpense,
        sections: [
            CategorySection(title: "Housing", categories: [
                Category(name: "Rent", icon: "house.fill", color: .orange),
                Category(name: "Mortgage", icon: "building.fill", color: .gray),
                Category(name: "Property Tax", icon: "doc.text.fill", color: .brown),
                Category(name: "Home Insurance", icon: "shield.fill", color: .yellow)
            ]),
            CategorySection(title: "Utilities", categories: [
                Category(name: "Electricity", icon: "bolt.fill", color: .yellow),
                Category(name: "Water Bill", icon: "drop.fill", color: .blue),
                Category(name: "Gas Bill", icon: "flame.fill", color: .orange),
                Category(name: "Internet", icon: "wifi", color: .green),
                Category(name: "Cable TV", icon: "tv.fill", color: .red),
                Category(name: "Cell Phone", icon: "phone.fill", color: .blue)
            ]),
            CategorySection(title: "Tech Subscriptions", categories: [
                Category(name: "Apple One", icon: "applelogo", color: .black),
                Category(name: "Spotify", icon: "music.note", color: .green),
                Category(name: "Netflix", icon: "film.fill", color: .red),
                Category(name: "Cloud Storage", icon: "externaldrive.fill", color: .gray)
            ]),
            CategorySection(title: "Health & Insurance", categories: [
                Category(name: "Health Insurance", icon: "cross.fill", color: .red),
                Category(name: "Life Insurance", icon: "heart.fill", color: .pink),
                Category(name: "Gym Membership", icon: "figure.walk", color: .cyan),
                Category(name: "Medical Subscriptions", icon: "pills.fill", color: .purple)
            ]),
            CategorySection(title: "Loans & Financials", categories: [
                Category(name: "Car Loan", icon: "car.fill", color: .gray),
                Category(name: "Student Loan", icon: "graduationcap.fill", color: .blue),
                Category(name: "Credit Card Payments", icon: "creditcard.fill", color: .orange)
            ])
        ],
        subcategories: []
    )
    
    // MARK: - One-Time Income (Freelance, Side Hustles, Gifts)
    static let oneTimeIncome = CategoryGroup(
        type: .oneTimeIncome,
        sections: nil,
        subcategories: [
            Category(name: "Part-time Job", icon: "briefcase.fill", color: .green),
            Category(name: "Freelance Work", icon: "laptopcomputer", color: .green),
            Category(name: "Consulting", icon: "person.fill", color: .green),
            Category(name: "Bonus", icon: "gift.fill", color: .green),
            Category(name: "Stock Sales", icon: "chart.line.uptrend.xyaxis", color: .green),
            Category(name: "Property Sale", icon: "house.fill", color: .green),
            Category(name: "Lottery", icon: "dollarsign.circle.fill", color: .green),
            Category(name: "Selling Items", icon: "cart.badge.plus", color: .green),
            Category(name: "Gifts & Donations", icon: "giftcard.fill", color: .green)
        ]
    )
    
    // MARK: - Regular Income (Salary, Investments, Passive Income)
    static let regularIncome = CategoryGroup(
        type: .regularIncome,
        sections: nil,
        subcategories: [
            Category(name: "Salary", icon: "dollarsign.circle.fill", color: .green),
            Category(name: "Hourly Wages", icon: "clock.fill", color: .green),
            Category(name: "Commissions", icon: "creditcard.fill", color: .green),
            Category(name: "Scholarship", icon: "graduationcap.fill", color: .green),
            Category(name: "Rental Income", icon: "house.fill", color: .green),
            Category(name: "Pension", icon: "person.fill", color: .green),
            Category(name: "Social Security", icon: "shield.fill", color: .green),
            Category(name: "Investment Returns", icon: "chart.line.uptrend.xyaxis", color: .green),
            Category(name: "Dividends", icon: "chart.bar.fill", color: .green),
            Category(name: "Royalties", icon: "music.note", color: .green)
        ]
    )
}
