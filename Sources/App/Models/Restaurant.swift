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
    
    static let query = """
        SELECT
            r.id,
            r.name,
            rc.name as category,
            r.description,
            r.openTime,
            r.closeTime,
            r.streetAddress,
            c.name as city,
            s.name as state,
            r.postalCode,
            r.phoneNumber,
            r.goodFor,
            r.imageUrl,
            r.websiteUrl,
            FORMAT(r.latitude, 6) as latitude,
            FORMAT(r.longitude, 6) as longitude
        FROM restaurant r
        LEFT JOIN restaurantcategory rc
        ON r.categoryId = rc.id
        LEFT JOIN city c
        ON r.cityId = c.id
        LEFT JOIN state s
        ON r.stateId = s.id
    """
}
