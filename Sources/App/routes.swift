import Vapor
import MySQL

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    let helloController = HelloController()
    router.get("greet", use: helloController.greet)

    // Example of configuring a controller
//    let todoController = TodoController()
//    router.get("todos", use: todoController.index)
//    router.post("todos", use: todoController.create)
//    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    let sqlController = MySQLController()
    router.get("themSqlThangs", use: sqlController.handleRequest)
    
    
    let query = """
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
    
    router.get("restaurants") { req -> Future<Response> in
        return req.withPooledConnection(to: .mysql, closure: { (connection) -> EventLoopFuture<[Restaurant]> in
            return connection.raw(query)
                .all(decoding: Restaurant.self)
        }).map(to: Response.self) { (restaurants) in
            let response = Response(http: HTTPResponse(status: .ok), using: req)
            try response.content.encode(restaurants, as: .json)
            return response
        }
    }
}
