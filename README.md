
# Turkey Management Application

## Overview

The Turkey Management Application is a Ruby on Rails web application designed to manage and report on turkey data. Users can view, create, and manage records of turkeys, and generate reports in both HTML and CSV formats.

## Features

- **View Turkeys**: List all turkeys with details such as name, age, weight, sex, species, and status.
- **Create Turkeys**: Add new turkey records to the system.
- **Edit/View/Delete Turkeys**: Edit/View/Delete any turkey record
- **Report Generation**: Generate reports of all turkeys in CSV format for external use.

## Requirements

- Ruby 2.7 or higher
- Rails 6.0 or higher
- PostgreSQL (or your preferred database)

## Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/lord-fluffy/TurkeyManager.git
   cd TurkeyManager
   ```

2. **Install dependencies**:

   ```bash
   bundle install
   ```

3. **Set up the database**:

   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Start the Rails server**:

   ```bash
   rails server
   ```

5. **Visit the application**:

   Open your web browser and go to `http://localhost:3000/turkeys`.

## Usage

### Viewing Turkeys

Navigate to the `/turkeys` path to view a list of all turkeys. Each record will display the name, age, weight, and status.

### Generating Reports

- To download the report in CSV format, click on the "Download CSV" button on the home page. This will generate a CSV file containing all turkey records.

## Code Structure

- **Controllers**: The main logic for managing turkey data is handled within the `TurkeysController`.
- **Models**: The `Turkey` model represents the turkey data in the database.
- **Views**: The views are located in the `app/views/turkeys` directory and handle the presentation of turkey data.

## Testing

To run the test suite, use the following command:

```bash
rails test
```
