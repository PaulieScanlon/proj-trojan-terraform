CREATE TABLE users (
  id          SERIAL PRIMARY KEY,
  first_name  VARCHAR(255) NOT NULL,
  last_name   VARCHAR(255) NOT NULL,
  email       VARCHAR(255) NOT NULL UNIQUE,
  country     VARCHAR(255) NOT NULL
);


-- column {
--   name = "flag"
--   type = "VARCHAR(255)" 
--   default = ""          
-- }