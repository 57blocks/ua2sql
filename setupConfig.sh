set_config(){
    if [ -z "$2" ]; then
        eval $2=$3
    fi
	jq --arg key "$1" --arg value "$2" '.[$key] = $value' config.json > config.json.tmp && mv config.json.tmp config.json
}

cp config_template.json config.json

set_config postgres_server $POSTGRES_SERVER
set_config database $DATABASE_NAME
set_config user $USER
set_config password $PASSWORD
set_config local_collection_path $LOCAL_COLLECTION_PATH "data/local"
set_config backup_collection_path $BACKUP_COLLECTION_PATH "data/backup"
set_config unity_project_id $UNITY_PROJECT_ID
set_config unity_export_api_key $UNITY_EXPORT_API_KEY

cat config.json