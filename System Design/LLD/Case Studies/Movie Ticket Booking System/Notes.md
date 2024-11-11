# Movie Ticket Booking System

An online platform or application that allows users to browse, select, and book tickets for movies currently showing in theaters. For example, **BookMyShow**.

## Key Features and Services

- **User Registration and Login:** Should allow users to create an account and authenticate themselves to access the platform's services.

- **Movie Listings:** Displays the list of currently running movies along with details like genre, duration, rating, and trailers.

- **Show Selection:** Users should be able to view all available theaters and their showtimes based on their selected movie, preferred date and location.

- **Seat Selection:** Shows a seat map for the selected theater and allows users to choose their preferred seats, with real-time availability updates.

- **Pricing:** Provides ticket pricing based on factors like seat type.

- **Payment:** Integrates with payment gateways to allow secure transactions via credit/debit cards, digital wallets, or net banking.

- **Notification:** Generates a booking confirmation after successful payment, often with a digital ticket (for example, QR code), sent via email, SMS, or within the app.

## Functional Requirement

Assume the logic that allows system to display the list of currently running movies is already implemented. You are required to implement the **Seat Selection**, **Pricing**, **Payment** and **Notification** services.

## Use Cases

1. The **customer** selects his/her preferred **location**. A **GET request** is sent to **fetch the list of movies currently running in the theatres at the preferred location**.

2. The **customer** selects a **movie** and his/her preferred **date**. A **GET request** is sent to **fetch the list of available shows for the selected movie on the preferred date**.

3. The **Customer** selects a **show**. A **GET request** is sent to **fetch the details of booked and available seats for the selected show**. 

4. The **customer** selects his/her preferred **seats**. A **POST request** is sent to **book the selected seats**.

## Entities

1. `Customer`:
    - **Private Data Members**: `int` customerId, `String` name, `Location` location, `String` email, `String` phone, `List<Booking>` bookings.
    - **Public Member Functions**: All Getters and Setters.

2. `Location`:
    - **Private Data Members**: `String` street, `String` city, `String` state, `String` country, `String` postalCode.
    - **Public Member Functions**: All Getters and Setters.

3. `Movie`:
    - **Private Data Members**: `int` movieId, `String` title, `String` genre, `String` releaseDate, `int` duration, `List<Show>` shows.
    - **Public Member Functions**: All Getters and Setters.

4. `Show`:
    - **Private Data Members**: `int` showId, `Movie` movie, `Screen` screen, `LocalDateTime` showTime, `List<Seat>` bookedSeats.
    - **Public Member Functions**: All Getters and Setters. 

5. `Screen`:
    - **Private Data Members**: `int` screenId, `String` screenName, `Theatre` theatre, `List<Seat>` seats, `List<Show>` shows.
    - **Public Member Functions**: All Getters and Setters. 

6. `Theatre`:
    - **Private Data Members**: `int` theatreId, `Location` location, `List<Screen>` screens.
    - **Public Member Functions**: All Getters and Setters.

7. `Seat`:
    - **Private Data Members**: `int` seatId, `int` seatNumber, `Screen` screen, `SeatType` seatType. 
    - **Public Member Functions**: All Getters and Setters.

8. `Booking`:
    - **Private Data Members**: `int` bookingId, `Customer` customer, `Show` show, `List<Seat>` bookedSeats, `double` totalAmount, `PaymentStatus` paymentStatus, `BookingStatus` bookingStatus.
    - **Public Member Functions**: All Getters and Setters.

> **NOTE:** In object-oriented design, including an object as a data member rather than just its identifier (e.g., keeping `Movie` object as data member in `Show`, rather than `movieId`) enables direct access to related details, promoting better encapsulation and enhancing code readability.

## Enums

1. `SeatType`: NORMAL(price: 250), PREMIUM(price: 400), VIP(price: 550).
2. `PaymentStatus`: PENDING, COMPLETED, FAILED.
3. `BookingStatus`: COMPLETED, CANCELED.

## Services

1. `MovieService`:
    - **Public Member Functions**: `List<Movie>` getMovies(Location location)