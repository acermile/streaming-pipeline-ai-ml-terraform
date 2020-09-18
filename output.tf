output "dataflow-job-id" {
  value       = google_dataflow_flex_template_job.big_data_job.job_id
  description = "dataflow job id."
}

output "dataflow-bucket-url" {
  value       = google_storage_bucket.data_flow_flex_template_bucket.url
  description = "dataflow bucket url"
}

output "bigquery-data-set-id" {
  value       = google_bigquery_dataset.twitter-data.dataset_id
  description = "bigquery-data-set-id"
}
