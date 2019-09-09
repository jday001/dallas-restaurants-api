import Vapor
import MySQL

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    // Register providers first
    try services.register(MySQLProvider())

    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    // Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    // middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

    // Configure a MySQL database
    let config = MySQLDatabaseConfig(hostname: "restaurants.cwcdecr5dmlx.us-east-2.rds.amazonaws.com",
                                     port: 3306,
                                     username: "admin",
                                     password: "wrongpw",
                                     database: "restaurants")
    
    let mySQL = MySQLDatabase(config: config)
    
    // Register the configured MySQL database to the database config.
    var databases = DatabasesConfig()
    databases.add(database: mySQL, as: .mysql)
    services.register(databases)
}
