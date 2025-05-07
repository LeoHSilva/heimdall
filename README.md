# Ruby Development Environment

This repository is set up for Ruby development with a pre-configured dev container. The environment includes all the necessary tools and dependencies to streamline your workflow.

## Features

- **Ruby**: Pre-installed with `rvm` and `rbenv` for version management.
- **Git**: Up-to-date version of Git, built from source if needed.
- **Ruby Utilities**: Common Ruby tools and dependencies are pre-installed.
- **Extensions**: Includes the Ruby language extension for enhanced development.

## Getting Started

1. Clone this repository:
  ```bash
  git clone <repository-url>
  cd ruby
  ```

2. Open the repository in a development environment that supports dev containers (e.g., VS Code).

3. The dev container will automatically build and set up the environment.

## Usage

- Install project dependencies:
  ```bash
  bundle install
  ```

- Apply migrations:
  ```bash
  rake db:migrate
  ```

- Add DEV data (optional):
  ```bash
  rake db:seed
  ```

- Serve API:
  ```bash
  rails s
  ```

## API Documentation

### Devices
  #### `GET /api/devices`
  - **Description**: Retrieves a list of Tracking devices.
  - **Request Payload**: None.
  - **Response**:
    ```json
    {
      "devices": [
        {
          "id": 1,
          "name": "Device A",
          "device_type": "GPS Tracker",
          "status": "active",
          "created_at": "2025-05-07T16:14:05.118Z",
          "updated_at": "2025-05-07T16:14:05.118Z"
        },
        {
          "id": 2,
          "name": "Device B",
          "device_type": "Bluetooth Tracker",
          "status": "inactive",
          "created_at": "2025-05-07T16:14:05.124Z",
          "updated_at": "2025-05-07T16:14:05.124Z"
        },
        {
          "id": 3,
          "name": "Device C",
          "device_type": "WiFi Tracker",
          "status": "active",
          "created_at": "2025-05-07T16:14:05.135Z",
          "updated_at": "2025-05-07T16:14:05.135Z"
        }
      ]
    }
    ```

  #### `POST /api/devices`
  - **Description**: Creates a new Tracking device.
  - **Request Payload**:
    ```json
    {
      "name": "Device D",
      "device_type": "Mobile Tracker",
      "status": "active"
    }
    ```
  - **Response**:
    ```json
    {
      "id": 4,
      "name": "Device D",
      "device_type": "Mobile Tracker",
      "status": "active",
      "created_at": "2025-05-07T17:03:46.051Z",
      "updated_at": "2025-05-07T17:03:46.051Z"
    }
    ```

  #### `PUT /api/devices/:id`
  - **Description**: Updates an existing Tracking device.
  - **Request Payload**:
    ```json
    {
      "name": "Device O"
    }
    ```
  - **Response**:
    ```json
    {
      "device": {
        "id": 1,
        "name": "Device O",
        "device_type": "GPS Tracker",
        "status": "active",
        "created_at": "2025-05-07T16:14:05.118Z",
        "updated_at": "2025-05-07T16:16:05.118Z"
      },
    }
    ```

  #### `GET /api/devices/:id`
  - **Description**: Retrieves a Tracking device and positions.
  - **Request Payload**: None.
  - **Response**:
    ```json
    {
      "device": {
        "id": 1,
        "name": "Device A",
        "device_type": "GPS Tracker",
        "status": "active",
        "created_at": "2025-05-07T16:14:05.118Z",
        "updated_at": "2025-05-07T16:14:05.118Z",
        "positions": [
          {
            "device_id": 1,
            "latitude": 29.75264800664496,
            "longitude": -95.37221130383047,
            "timestamp": "2025-05-07T13:05:23.000Z",
            "address": {
              "address": "1798, Louisiana Street, Downtown, Houston, Harris County, Texas, 77002, United States",
              "name": "",
              "category": "place",
              "addresstype": "place",
              "road": "Louisiana Street",
              "suburb": "Downtown",
              "city_district": null,
              "city": "Houston",
              "state": "Texas",
              "postcode": "77002",
              "country": "United States"
            }
          },
          {
            "device_id": 1,
            "latitude": 29.75135893062173,
            "longitude": -95.37028507655184,
            "timestamp": "2025-05-07T13:07:23.000Z",
            "address": {
              "address": "920, Jefferson Street, Downtown, Houston, Harris County, Texas, 77002, United States",
              "name": "",
              "category": "place",
              "addresstype": "place",
              "road": "Jefferson Street",
              "suburb": "Downtown",
              "city_district": null,
              "city": "Houston",
              "state": "Texas",
              "postcode": "77002",
              "country": "United States"
            }
          }
        ]
      }
    }
    ```

  #### `DELETE /api/devices/:id`
  - **Description**: Deletes a device by ID.
  - **Request Payload**: None.
  - **Response**:
    ```json
    { 
      "message": "Device successfully deleted." 
    }
    ```

### Positions
  #### `POST /api/positions`
  - **Description**: Creates a position for an existing tracking device.
  - **Request Payload**:
    ```json
    {
        "position": {
            "device_id": 1,
            "latitude": 29.75135893062173, 
            "longitude": -95.37028507655184,
            "timestamp": "2025-05-07 13:07:23"
        }
    }
    ```
  - **Response**:
    ```json
    {
      "response": {
        "position": {
          "id": 2,
          "device_id": 1,
          "latitude": 29.75135893062173,
          "longitude": -95.37028507655184,
          "timestamp": "2025-05-07T13:07:23.000Z",
          "created_at": "2025-05-07T16:17:59.512Z",
          "updated_at": "2025-05-07T16:17:59.512Z"
        },
        "address": {
          "address": "920, Jefferson Street, Downtown, Houston, Harris County, Texas, 77002, United States",
          "name": "",
          "category": "place",
          "addresstype": "place",
          "road": "Jefferson Street",
          "suburb": "Downtown",
          "city_district": null,
          "city": "Houston",
          "state": "Texas",
          "postcode": "77002",
          "country": "United States"
        }
      }
    }
    ```

## Contributing

Feel free to submit issues or pull requests to improve this repository.

## License

This project is licensed under the [MIT License](LICENSE).
