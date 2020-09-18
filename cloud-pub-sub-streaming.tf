// cloud pub-sub topic for streaming
resource "google_pubsub_topic" "twitter-topic" {
  project = var.project_id
  name    = "${var.environment}_twitter_topic"

  labels = {
    env = var.environment
  }
}
