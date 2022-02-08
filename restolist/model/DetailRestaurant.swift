//
//  DetailRestaurant.swift
//  restolist
//
//  Created by Akashaka on 08/02/22.
//
import Foundation

// MARK: - DetailRestaurantResponse
struct DetailRestaurantResponse: Codable {
    let error: Bool?
    let message: String?
    let restaurant: Restaurant?
}

// MARK: - Restaurant
struct Restaurant: Codable {
    let id, name, restaurantDescription, city: String
    let address, pictureID: String
    let rating: Double
    let categories: [Category]
    let menus: Menus
    let customerReviews: [CustomerReview]

    enum CodingKeys: String, CodingKey {
        case id, name
        case restaurantDescription = "description"
        case city, address
        case pictureID = "pictureId"
        case rating, categories, menus, customerReviews
    }
}

// MARK: - Category
struct Category: Codable {
    let name: String?
}

// MARK: - CustomerReview
struct CustomerReview: Codable {
    let name, review, date: String?
}

// MARK: - Menus
struct Menus: Codable {
    let foods, drinks: [Category]?
}
