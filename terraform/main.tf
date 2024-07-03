variable "postgres_host" {
  description = "PostgreSQL server host"
  type        = string
  default     = "localhost"  # Provide a default value if needed
}

variable "postgres_port" {
  description = "PostgreSQL server port"
  type        = number
  default     = 5432  # Default PostgreSQL port
}

variable "postgres_database" {
  description = "PostgreSQL database name"
  type        = string
  default     = "postgres"  # Default database name
}

variable "postgres_username" {
  description = "PostgreSQL username"
  type        = string
  default     = "postgres"  # Default username
}

variable "postgres_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive   = true  # Mark sensitive to prevent accidental exposure
}

provider "postgresql" {
  host     = var.postgres_host
  port     = var.postgres_port
  database = var.postgres_database
  username = var.postgres_username
  password = var.postgres_password
}

resource "postgresql_table" "users" {
  name   = "users"
  schema = "public"  # Adjust schema if different

  column {
    name = "id"
    type = "SERIAL"
    primary_key = true
  }

  column {
    name = "first_name"
    type = "VARCHAR(255)"
    not_null = true
  }

  column {
    name = "last_name"
    type = "VARCHAR(255)"
    not_null = true
  }

  column {
    name = "email"
    type = "VARCHAR(255)"
    not_null = true
    unique = true
  }

  column {
    name = "country"
    type = "VARCHAR(255)"
    not_null = true
  }
}
