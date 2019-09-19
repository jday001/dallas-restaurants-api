import Vapor
import MySQL

public func routes(_ router: Router) throws {
    router.get("restaurants") { req -> Future<Response> in
        return req.withPooledConnection(to: .mysql, closure: { (connection) -> EventLoopFuture<[Restaurant]> in
            return connection.raw(Restaurant.query)
                .all(decoding: Restaurant.self)
        }).map(to: Response.self) { (restaurants) in
            let response = Response(http: HTTPResponse(status: .ok), using: req)
            try response.content.encode(restaurants, as: .json)
            return response
        }
    }
}
