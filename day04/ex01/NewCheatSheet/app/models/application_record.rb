# Active Record runs queries on the database and is compatible with most databases. (MySQL, PostgresSQL, SQLite).
# Even if your database is different, the way you use Active Record methods is always the same.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
