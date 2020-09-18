# Google Cloud DataFlow (Flex template) Streaming Pipeline

This terraform reference code will run a streaming pipeline. It will read messages from a Pub/Sub topic, then window them into fixed-sized intervals, after that, it will call the Prediction API, once it gets the results, will write them into BigQuery.

AI model training and model deployment is outside the scope of this terraform project as it doesnt support the google beta APIs for model version deployment.

you can refer https://github.com/GoogleCloudPlatform/ai-platform-samples/blob/master/notebooks/samples/tensorflow/sentiment_analysis/ai_platform_sentiment_analysis.ipynb


-----------------------------------
Apply complete! Resources: 1 added, 1 changed, 0 destroyed.

Outputs:

bigquery-data-set-id = uat_twitter_data
dataflow-bucket-url = gs://uat_data_flow_flex_template_bucket
dataflow-job-id = 2020-09-18_10_41_11-17334782166335503535

<img src= "/pipeline.png">
