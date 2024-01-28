# DataEngineeringZoomcamp2024Module1Homework

## Module1 Homework

### Docker & SQL 

  ### Prepare Postgres 

  Run Postgres and load data as shown in the videos We'll use the green taxi trips from September 2019:

  wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-09.csv.gz

  You will also need the dataset with zones:

  wget https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv

  Download this data and put it into Postgres (with jupyter notebooks or with a pipeline)

  Solution: 
    
    URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-09.csv.gz"

    python3 PostgresPipelineGreenTaxiData.py \
    --user=root \
    --password=root \
    --host=localhost \
    --port=5433 \
    --db=ny_taxi \
    --table_name=green_taxi_trips \
    --url=${URL}

        
    ZONE="https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv"

    python3 PostgresPipelineZoneData.py \
    --user=root \
    --password=root \
    --host=localhost \
    --port=5433 \
    --db=ny_taxi \
    --table_name=zones \
    --url=${ZONE}