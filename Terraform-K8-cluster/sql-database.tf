resource "google_sql_database_instance" "cloudsql_instance" {
  name             = "my-cloudsql-instance"
  database_version = "MYSQL_5_7"

  settings {
    tier              = "db-f1-micro"
    availability_type = "ZONAL"
    backup_configuration {
      enabled                        = true
      start_time                     = "00:00"
      location                       = "us-central1"
      binary_log_enabled             = true
    }

    ip_configuration {
      ipv4_enabled    = true
      private_network = google_compute_network.my_vpc_network.id
    }
    database_flags {
      name  = "log_bin_trust_function_creators"
      value = "on"
    }
  }
}

resource "google_sql_database" "cloudsql_database" {
  name     = "my-database"
  instance = google_sql_database_instance.cloudsql_instance.name
  charset  = "utf8"
  collation = "utf8_general_ci"
}
