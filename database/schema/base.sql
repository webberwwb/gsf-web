# Example table schema file
# This file defines the structure of your database tables
# Skeema will use these files to generate and apply migrations

# BaseModel table structure (if you need a base table)
# Note: BaseModel is abstract in SQLAlchemy, so you typically won't create a table for it

# Example: Create a users table
# CREATE TABLE users (
#   id INT AUTO_INCREMENT PRIMARY KEY,
#   created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
#   updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
#   email VARCHAR(255) NOT NULL UNIQUE,
#   name VARCHAR(255) NOT NULL,
#   INDEX idx_email (email)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Add your table schemas here
# Skeema will track changes to these files and generate migrations accordingly

