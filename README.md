# Go Backend Gym

This project is a Go Fiber backend application with a PostgreSQL database, set up using Docker Compose.

## How to Run

1.  **Build and Start the Application:**
    Navigate to the project root directory and run:
    ```bash
    docker-compose up --build
    ```
    This command will build the Docker image for your Go application and start both the application and the PostgreSQL database containers.

2.  **Access the Application:**
    Once the containers are running, the application will be accessible at `http://localhost:3000`.
    You can check the database connection status by visiting `http://localhost:3000/health`.

3.  **Stop the Application:**
    To stop and remove the containers, press `Ctrl+C` in the terminal where `docker-compose up` is running, then execute:
    ```bash
    docker-compose down
    ```

## Project Structure

-   `cmd/`: Contains the main application entry points.
    -   `api/`: The entry point for the Go Fiber API (`main.go`).
-   `internal/`: Houses the core application logic, not intended for direct external import.
    -   `handlers/`: Fiber controllers responsible for parsing requests and returning responses.
    -   `services/`: Contains the main business logic of the application.
    -   `repositories/`: Handles data access and interactions with the database.
    -   `models/`: Defines data structures (structs/entities) for the application.
    -   `configs/`: Manages application configuration loading and database connections.
-   `pkg/`: Stores reusable utility code that can be safely imported by other projects.
    -   `utils/`: General helper functions.
-   `tests/`: Contains unit and integration tests for the application.
-   `.env`: Environment variables for local development.
-   `go.mod`: Go Modules definition file.
-   `README.md`: Project documentation.
