--Total Bookings
SELECT COUNT(*) as Total_bookings FROM bookings;

--Cancellation Rate
SELECT 
    Booking_Status,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bookings) AS percentage
FROM bookings
GROUP BY Booking_Status;

--Peak Hours
SELECT DATEPART(HOUR, Time) AS hour, COUNT(*) AS total_rides
FROM bookings
GROUP BY DATEPART(HOUR, Time)
ORDER BY total_rides DESC;

--Revenue by Vehicle
SELECT Vehicle_Type, SUM(Fare_Amount) AS revenue
FROM bookings
WHERE Booking_Status = 'Success'
GROUP BY Vehicle_Type
ORDER BY revenue DESC;

