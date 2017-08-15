#! /bin/bash
#set -x

PATH="$PATH":/path/to/gsutil/
TEMPFILE=/tmp/files
BUCKET=rockpaperscissors
CLIENTBUCKET=rockpaperscissorsclient
ICEBUCKET=rockpaperscissorssvalbard
gsutil ls gs://$BUCKET/*.csv > $TEMPFILE

for x in `cat $TEMPFILE`
do 
FOLDER_SUFFIX=`echo $x | cut -b30-10000000 |cut -d '.' -f1`
echo "Moving $x to client$FOLDER_SUFFIX bucket"
gsutil -m cp gs://$BUCKET/client$FOLDER_SUFFIX.csv gs://$ICEBUCKET/client$FOLDER_SUFFIX.csv
gsutil -m mv gs://$BUCKET/client$FOLDER_SUFFIX.csv gs://$CLIENTBUCKET$FOLDER_SUFFIX/client$FOLDER_SUFFIX.csv
done

