# README

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* Ruby 2.6.3
* PostgreSQL

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/HTD-Health/2021-projekt-innowacja-api.git
   ```
2. Enter project folder
   ```sh
   cd 2021-projekt-innowacja-api/
   ```
3. Run bundler
    ```sh
   bundle install
   ```
4. Create ``.env`` file
5. Paste into ``.env`` file following data:
    ```sh
   DB_USER=YOUR_POSTGRESQL_USER_NAME
   DB_PASSWORD=YOUR_POSTGRESQL_USER_PASSWORD
   ```
6. Configure database
    ```sh
   rails db:setup
   ```
7. Run server
    ```sh
   rails server
   ```
8. Yay, your application is up and running! 🚀
