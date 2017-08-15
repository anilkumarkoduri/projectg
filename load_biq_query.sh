#bq mk milkmoney 
bq mk rockpaperscissors
#bq load --source_format=CSV --autodetect milkmoney.milkmoney gs://milkmoney/client*.csv
bq load --source_format=CSV --autodetect rockpaperscissors.rockpaperscissors gs://rockpaperscissors/client*.csv
