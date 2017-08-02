bq mk milkmoney 
bq load --source_format=CSV --autodetect milkmoney.milkmoney gs://milkmoney/client*.csv
