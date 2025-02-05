create database Ola;
use Ola;
Select * from bookings;

#1. Retrieve all successful bookings:
Create View Successful_Bookings As
SELECT * FROM bookings
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Bookings;
#2. Find the average ride distance for each vehicle type:
CREATE VIEW  ride_distance_for_each_vehicle  AS 
SELECT Vehicle_Type, AVG(Ride_Distance)
AS avg_distance FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
CREATE VIEW canceled_rides_by_customer AS
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM canceled_rides_by_customer;

#4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers As 
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM Top_5_Customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues: 
Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

CREATE VIEW Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payment;

#8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM AVG_Cust_Rating;

#9. Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';

Select * from total_successful_ride_value;

#10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings
WHERE Incomplete_Rides = 'Yes';

Select * from Incomplete_Rides_Reason;

