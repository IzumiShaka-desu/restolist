//
//  RestoList.swift
//  restolist
//
//  Created by Akashaka on 08/02/22.
//

import Foundation

// MARK: - PlaylistSearch
struct RestoList: Codable {
    let error: Bool?
    let message: String?
    let count: Int?
    let restaurants: [RestaurantItem]
}

// MARK: - RestaurantItem
struct RestaurantItem: Codable {
    let id, name, restaurantDescription, pictureID: String
    let city: String
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case id, name
        case restaurantDescription = "description"
        case pictureID = "pictureId"
        case city, rating
    }
}


