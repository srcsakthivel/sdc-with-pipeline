attempt_counter=0
max_attempts=5

until $(curl --output /dev/null --silent --head --fail http://localhost:18630); do
    if [ ${attempt_counter} -eq ${max_attempts} ];then
      echo "Max attempts reached"
      exit 1
    fi

    printf '.'
    attempt_counter=$(($attempt_counter+1))
    sleep 5
done

echo "Import the Pipeline... "
curl -X POST -u admin:admin -v -H 'Content-Type: application/json' -H 'X-Requested-By: My Import Process' -d "@Rest-Azure.json" http://localhost:18630/rest/v1/pipeline/mypipeline_id/import
echo "Imported..."


echo "Start tge Pipeline..."
curl -X POST -u admin:admin -v -H 'Content-Type: application/json' -H 'X-Requested-By: Data Collector' http://localhost:18630/rest/v1/pipeline/mypipeline_id/start?rev=0
echo "Started..."