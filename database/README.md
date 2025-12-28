# Skeema database migration directory
# This directory contains your database schema definitions

# Structure:
# - schema/          # SQL schema files organized by feature/module
#   - base.sql       # Base tables and common structures
#   - [module].sql   # Module-specific tables
#
# Usage:
# 1. Define your tables in SQL files in the schema/ directory
# 2. Run `skeema diff` to see what changes need to be applied
# 3. Run `skeema push` to apply changes to the database
# 4. Run `skeema pull` to pull current schema from database

# For more information, see: https://www.skeema.io/docs/

