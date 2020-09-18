resource "google_dataflow_flex_template_job" "big_data_job" {
  provider                = google-beta
  project                 = var.project_id
  name                    = "dataflow-twitter-stream-job"
  container_spec_gcs_path = "${google_storage_bucket.data_flow_flex_template_bucket.url}/dataflow/templates/pubsubtobigquerywithapiplatform.json"
  parameters = {
    input-topic      = google_pubsub_topic.twitter-topic.id
    region           = var.region
    bigquery-dataset = "${var.environment}_twitter_data"
    staging-location = "${google_storage_bucket.data_flow_flex_template_bucket.url}/streaming/staging"
    temp-location    = "${google_storage_bucket.data_flow_flex_template_bucket.url}/streaming/temp"
    bigquery-table   = "${var.environment}_twitter_data_${random_string.suffix.result}_table"
    window-size      = "60"
    min-batch-size   = "5"
    max-batch-size   = "100"
    runner           = "DataflowRunner"
  }

  depends_on = [null_resource.dataflow-flex-template]
}

resource "google_storage_bucket" "data_flow_flex_template_bucket" {
  project       = var.project_id
  name          = "${var.environment}_data_flow_flex_template_bucket"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

}
//make sure you have the git, gcloud sdk  installed on the local machine you running the terraform from.
resource "null_resource" "dataflow-flex-template" {
  provisioner "local-exec" {
    command = "cd ~ && git clone https://github.com/acermile/dataflow-flex-template-twitter-streaming.git && cd dataflow-flex-template-twitter-streaming && gcloud beta dataflow flex-template build ${google_storage_bucket.data_flow_flex_template_bucket.url}/dataflow/templates/pubsubtobigquerywithapiplatform.json   --image \"gcr.io/cloudarchitectexam/samples/dataflow/pubsubtobigquerywithapiplatform:latest\"   --sdk-language \"PYTHON\"   --metadata-file \"metadata.json\""

  }

}
