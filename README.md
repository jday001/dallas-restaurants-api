# Dallas Restaurants API
This is a basic REST API with one endpoint `/restaurants` that retrieves a list of restaurants from a MySQL database.

This project is written in Swift using Vapor, a great server-side framework for Swift. [Here's a link](https://github.com/vapor/vapor) if you'd like to know more about Vapor.

The API is containerized using docker and currently running on an [Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/) instance on AWS. The database is running in an [RDS](https://aws.amazon.com/rds/) instance on AWS as well. They are connected via security groups using VPC. Both are running in the free tier for a year as of September 2019.

The schema for the MySQL database is contained in this repo as well in case future changes need to be made. See `Restaurant DB.txt`.