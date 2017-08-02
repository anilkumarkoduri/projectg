#! /bin/bash

PATH="$PATH":/path/to/gsutil/
TEMPFILE=/tmp/files
BUCKET=gs://milkmoney/
gsutil ls -R $BUCKET |egrep *.csv > $TEMPFILE

for x in `cat $TEMPFILE`
do 
echo "Moving $x to $BUCKET"
gsutil -m mv $x $BUCKET 
done

