# Clean up any existing bulkload directories
rm -rf /tmp/bulkload

# Re-create the necessary directory structure
mkdir -p /tmp/bulkload/tsvdata

# Generate TSV data and save to the specified directory
python3 tsv_generator.py /tmp/bulkload/tsvdata

# Import TSV data to create HFiles for bulk loading
hbase org.apache.hadoop.hbase.mapreduce.ImportTsv \
  -Dimporttsv.columns=HBASE_ROW_KEY,cf:col0,cf:col1,cf:col2,cf:col3,cf:col4,cf:col5,cf:col6,cf:col7,cf:col8,cf:col9 \
  -Dimporttsv.bulk.output=/tmp/bulkload/HFiles \
  usertable /tmp/bulkload/tsvdata/output.tsv

# Bulk load the generated HFiles into the HBase table
hbase completebulkload /tmp/bulkload/HFiles usertable
