resource "google_bigquery_dataset" "twitter-data" {
  project       = var.project_id
  dataset_id    = "${var.environment}_twitter_data"
  friendly_name = "${var.environment}_twitter_data"
  description   = "twitter-data sentiment analysis"
  //  location                    = "US"
  default_table_expiration_ms = 3600000

  labels = {
    env = var.environment
  }

  /*   access {
    role          = "OWNER"
    user_by_email = "aarav.shar12@gmail.com"
  }

  access {
    role   = "READER"
    domain = "hashicorp.com"
  } */
}

/*resource "google_service_account" "bqowner" {
  account_id = "bqowner"
} */

resource "google_bigquery_table" "twitter-data-table" {
  project    = var.project_id
  dataset_id = google_bigquery_dataset.twitter-data.dataset_id
  table_id   = "${var.environment}_twitter_data_${random_string.suffix.result}_table"

  time_partitioning {
    type = "DAY"
  }

  schema = <<EOF
[
{
  "name": "id",
  "type": "STRING",
  "mode": "REQUIRED",
  "description": "id"
},
{
  "name": "text",
  "type": "STRING",
  "mode": "NULLABLE",
  "description": "text"
},
{
  "name": "sentiment",
  "type": "FLOAT64",
  "mode": "NULLABLE",
  "description": "sentiment"
},
{
  "name": "user_id",
  "type": "STRING",
  "mode": "NULLABLE",
  "description": "user_id"
},
{
  "name": "favorite_count",
  "type": "INTEGER",
  "mode": "NULLABLE",
  "description": "favorite_count"
},
{
  "name": "retweet_count",
  "type": "INTEGER",
  "mode": "NULLABLE",
  "description": "retweet_count"
},
{
  "name": "posted_at",
  "type": "TIMESTAMP",
  "mode": "NULLABLE",
  "description": "posted_at"
}

]
EOF

}


resource "random_string" "suffix" {
  length  = 3
  special = false
}
