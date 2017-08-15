#! /bin/bash

PATH="$PATH":/path/to/gsutil/
TEMPFILE=/tmp/files
ICEBUCKET=gs://rockpaperscissorssvalbard/
BUCKET=gs://rockpaperscissors/
gsutil ls -R $ICEBUCKET |egrep *.csv > $TEMPFILE

for x in `cat $TEMPFILE`
do 
echo "Moving $x to $BUCKET"
gsutil -m mv $x $BUCKET 
done

