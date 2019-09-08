//
//  MySQLVersion.swift
//  DallasRestaurants
//
//  Created by Day, Jeff @ Dallas on 8/29/19.
//

import Foundation
import Vapor
import MySQL

struct MySQLVersion: Codable {
    let version: String
    
    func whatever() {
        
    }
}

final class MySQLController {
    func handleRequest(_ req: Request) throws -> Future<String> {
        return req.withPooledConnection(to: .mysql) { conn in
            return conn.raw("SELECT name FROM restaurant ORDER BY name")
                .all(decoding: Restaurant.self)
            }.map { rows in
                return rows[0].name
        }
    }
}
