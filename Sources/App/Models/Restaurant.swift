//
//  Restaurant.swift
//  App
//
//  Created by Day, Jeff @ Dallas on 9/2/19.
//

import Foundation
import MySQL


struct Restaurant: Codable {
    let id: String
    let name: String
    let category: String?
    let description: String?
    let openTime: String
    let closeTime: String
    let streetAddress: String
    let city: String
    let state: String?
    let postalCode: String
    let phoneNumber: String
    let goodFor: String
    let imageUrl: String
    let websiteUrl: String
    let latitude: Decimal
    let longitude: Decimal
}
