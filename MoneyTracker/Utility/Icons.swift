//
//  Icons.swift
//  MoneyTracker
//
//  Created by Olha Bereziuk on 24.04.24.
//

import Foundation

struct Icon {
    let name: String
}

final class Icons {
    
    static let shared = Icons()
    
    private init() {}
    
    let list: [Icon] = [
    Icon(name: "sun.min"),
    Icon(name: "sun.max"),
    Icon(name: "sunrise"),
    Icon(name: "sunset"),
    Icon(name: "sun.horizon"),
    Icon(name: "sun.haze"),
    Icon(name: "sun.rain"),
    Icon(name: "sun.snow"),
    Icon(name: "moon"),
    Icon(name: "figure.equestrian.sports"),
    Icon(name: "moon.dust.circle"),
    Icon(name: "moon.haze.fill"),
    Icon(name: "sparkles"),
    Icon(name: "moon.stars"),
    Icon(name: "cloud.drizzle"),
    Icon(name: "cloud.fog"),
    Icon(name: "cloud.snow"),
    Icon(name: "cloud.bolt"),
    Icon(name: "cloud.sun"),
    Icon(name: "cloud.sun.bolt"),
    Icon(name: "cloud.moon"),
    Icon(name: "wind.snow"),
    Icon(name: "snowflake"),
    Icon(name: "thermometer.sun"),
    Icon(name: "thermometer.variable.and.figure"),
    Icon(name: "humidity.fill"),
    Icon(name: "aqi.high"),
    Icon(name: "cloud.rainbow.half"),
    Icon(name: "carbon.dioxide.cloud"),
    Icon(name: "figure.run"),
    Icon(name: "figure.archery"),
    Icon(name: "figure.badminton"),
    Icon(name: "figure.baseball"),
    Icon(name: "figure.climbing"),
    Icon(name: "figure.skiing.downhill")
    ]
}
