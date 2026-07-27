import os
from dotenv import load_dotenv
from google.cloud import bigquery

load_dotenv()

def load_gcs_to_bq():

    client = bigquery.Client()
    gcs_uri = 'https://storage.googleapis.com/sql_de/job_postings_flat.csv'
    table_id = "data-job-analytic-platform.raw_data.job_postings"

    job_config = bigquery.LoadJobConfig(
        source_format=bigquery.SourceFormat.CSV, 
        skip_leading_rows=1,                     
        autodetect=True,                         
        write_disposition=bigquery.WriteDisposition.WRITE_TRUNCATE 
    )

    print(f"[+] Starting data load...")

    load_job = client.load_table_from_uri(
        gcs_uri, table_id, job_config=job_config
    )

    load_job.result()  

    destination_table = client.get_table(table_id)
    print(f"[+] Loaded {destination_table.num_rows} rows successfully.")

if __name__ == "__main__":
    load_gcs_to_bq()