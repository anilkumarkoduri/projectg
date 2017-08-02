#! /bin/bash

PATH="$PATH":/path/to/gsutil/
TEMPFILE=/tmp/files
gsutil ls gs://milkmoney/*.csv > $TEMPFILE

for x in `cat $TEMPFILE`
do 
FOLDER_SUFFIX=`echo $x | cut -b22-10000000 |cut -d '.' -f1`
echo "Moving $x to client$FOLDER_SUFFIX folder"
gsutil -m cp gs://milkmoney/client$FOLDER_SUFFIX.csv gs://milkmoneysvalbard/client$FOLDER_SUFFIX.csv
gsutil -m mv gs://milkmoney/client$FOLDER_SUFFIX.csv gs://milkmoney/client$FOLDER_SUFFIX/client$FOLDER_SUFFIX.csv
done

