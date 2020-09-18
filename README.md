# Google Cloud DataFlow (Flex template) Streaming Pipeline

This terraform reference code will run a streaming pipeline. It will read messages from a Pub/Sub topic, then window them into fixed-sized intervals, after that, it will call the Prediction API, once it gets the results, will write them into BigQuery.

AI model training and model deployment is outside the scope of this terraform project as it doesnt support the google beta APIs for model version deployment.

you can refer https://github.com/GoogleCloudPlatform/ai-platform-samples/blob/master/notebooks/samples/tensorflow/sentiment_analysis/ai_platform_sentiment_analysis.ipynb

<img src= "/pipeline.png">
