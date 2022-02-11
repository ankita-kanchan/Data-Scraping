# Load the RSQLite Library
library(RSQLite)
# Load the mtcars as an R data frame put the row names as a column, and print the header.
data("mtcars")
mtcars$car_names <- rownames(mtcars)
rownames(mtcars) <- c()

# Write the mtcars dataset into a table names mtcars_data
dbWriteTable(conn, "cars_data", mtcars)
# List all the tables available in the database
dbListTables(conn)

car <- c('Camaro', 'California', 'Mustang', 'Explorer')
make <- c('Chevrolet','Ferrari','Ford','Ford')
df1 <- data.frame(car,make)
car <- c('Corolla', 'Lancer', 'Sportage', 'XE')
make <- c('Toyota','Mitsubishi','Kia','Jaguar')
df2 <- data.frame(car,make)
# Add them to a list
dfList <- list(df1,df2)
# Write a table by appending the data frames inside the list
for(k in 1:length(dfList)){
  dbWriteTable(conn,"Cars_and_Makes", dfList[[k]], append = TRUE)
}
# List all the Tables
dbListTables(conn)
head(mtcars)
# Create a connection to our new database, CarsDB.db
# you can check that the .db file has been created on your working directory
conn <- dbConnect(RSQLite::SQLite(), "CarsDB.db")


dbGetQuery(conn, "SELECT * FROM Cars_and_Makes")


# Gather the first 10 rows in the cars_data table
dbGetQuery(conn, "SELECT * FROM cars_data LIMIT 10")


# Get the car names and horsepower of the cars with 8 cylinders
dbGetQuery(conn,"SELECT car_names, hp, cyl FROM cars_data
                 WHERE cyl = 8")


# Get the car names and horsepower starting with M that have 6 or 8 cylinders
dbGetQuery(conn,"SELECT car_names, hp, cyl FROM cars_data
                 WHERE car_names LIKE 'M%' AND cyl IN (6,8)")


# Get the average horsepower and mpg by number of cylinder groups
dbGetQuery(conn,"SELECT cyl, AVG(hp) AS 'average_hp', AVG(mpg) AS 'average_mpg' FROM cars_data
                 GROUP BY cyl
                 ORDER BY average_hp")


avg_HpCyl <- dbGetQuery(conn,"SELECT cyl, AVG(hp) AS 'average_hp'FROM cars_data
                 GROUP BY cyl
                 ORDER BY average_hp")
avg_HpCyl
class(avg_HpCyl)

mpg <-  18
cyl <- 6
Result <- dbGetQuery(conn, 'SELECT car_names, mpg, cyl FROM cars_data WHERE mpg >= ? AND cyl >= ?', params = c(mpg,cyl))
Result


# Insert the data for the Mazda RX4. This will also ouput a 1
dbExecute(conn, "INSERT INTO cars_data VALUES (21.0,6,160.0,110,3.90,2.620,16.46,0,1,4,4,'Mazda RX4')")
# See that we re-introduced the Mazda RX4 succesfully at the end
dbGetQuery(conn, "SELECT * FROM cars_data")

