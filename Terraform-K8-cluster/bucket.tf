resource "google_storage_bucket" "my_bucket" {
  name           = "commitsmart-bucket"
  location       = "us-central1"
  storage_class  = "STANDARD"
}

resource "google_storage_bucket_object" "my_object" {
  name              = "my-file.txt"
  bucket            = google_storage_bucket.my_bucket.name
  source            = "path/to/local/file.txt"
  content_type      = "text/plain"
}
