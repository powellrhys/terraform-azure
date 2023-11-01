# Empty array to store environmental variables
$environment_variables_array = @()

# Iterate through .env file to retrieve terraform state file remote
# container credentials
get-content .env | foreach {
    $name, $value = $_.split('=')
    $environment_variables_array += $value.Replace("'", "")
}

# Map sourced environmental variables to correct keys
$STORAGE_ACCOUNT = $environment_variables_array[0]
$CONTAINER_NAME = $environment_variables_array[1]
$RESOURCE_GROUP = $environment_variables_array[2]

# Perform Terraform Init
terraform init -backend-config="storage_account_name=$STORAGE_ACCOUNT" -backend-config="container_name=$CONTAINER_NAME" -backend-config="resource_group_name=$RESOURCE_GROUP"

# Plan and Apply terraform configuration
terraform apply -lock=false
