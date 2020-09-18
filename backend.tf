terraform {

  backend "gcs" {
    bucket = "cloudarchitectbucket"
    prefix = "terraform/state/streaming-pipeline"
  }
}
