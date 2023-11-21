## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.51.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alert_policy_container_cpu"></a> [alert\_policy\_container\_cpu](#module\_alert\_policy\_container\_cpu) | git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Alert-Policy | n/a |
| <a name="module_alert_policy_container_memory"></a> [alert\_policy\_container\_memory](#module\_alert\_policy\_container\_memory) | git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Alert-Policy | n/a |
| <a name="module_alert_policy_container_restart_count"></a> [alert\_policy\_container\_restart\_count](#module\_alert\_policy\_container\_restart\_count) | git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Alert-Policy | n/a |
| <a name="module_alert_policy_node_cpu"></a> [alert\_policy\_node\_cpu](#module\_alert\_policy\_node\_cpu) | git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Alert-Policy | n/a |
| <a name="module_alert_policy_node_memory"></a> [alert\_policy\_node\_memory](#module\_alert\_policy\_node\_memory) | git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Alert-Policy | n/a |
| <a name="module_bastion_instance"></a> [bastion\_instance](#module\_bastion\_instance) | git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Bastion-VM | n/a |
| <a name="module_cloud_nat"></a> [cloud\_nat](#module\_cloud\_nat) | git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Cloud-NAT | n/a |
| <a name="module_email_channel_primary"></a> [email\_channel\_primary](#module\_email\_channel\_primary) | git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Notification-Channel | n/a |
| <a name="module_fileshare"></a> [fileshare](#module\_fileshare) | git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Filestore | n/a |
| <a name="module_gke_cluster"></a> [gke\_cluster](#module\_gke\_cluster) | git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Google-Kubernetes-Engine | n/a |
| <a name="module_project_svc"></a> [project\_svc](#module\_project\_svc) | git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Project-Service | n/a |
| <a name="module_secret"></a> [secret](#module\_secret) | git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/Secret-Manager-Secrets | n/a |
| <a name="module_sql_instance"></a> [sql\_instance](#module\_sql\_instance) | git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/SQL-Instance | n/a |
| <a name="module_vpc_network"></a> [vpc\_network](#module\_vpc\_network) | git::https://github.com/wso2/gcp-terraform-modules.git//modules/gcp/VPC | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_channel_name"></a> [alert\_channel\_name](#input\_alert\_channel\_name) | Channel name for alert notifications | `string` | `"primary"` | no |
| <a name="input_alert_email_address"></a> [alert\_email\_address](#input\_alert\_email\_address) | Alert email address | `string` | n/a | yes |
| <a name="input_auto_replication_enabled"></a> [auto\_replication\_enabled](#input\_auto\_replication\_enabled) | Enable automatic replication for the secret in regions | `bool` | `true` | no |
| <a name="input_bastion_ip_cidr_range"></a> [bastion\_ip\_cidr\_range](#input\_bastion\_ip\_cidr\_range) | Base IP CIDR range for the bastion subnet | `string` | n/a | yes |
| <a name="input_bastion_metadata_startup_script"></a> [bastion\_metadata\_startup\_script](#input\_bastion\_metadata\_startup\_script) | Startup script of the bastion VM | `string` | `-` | no |
| <a name="input_bastion_vm_boot_disk_image"></a> [bastion\_vm\_boot\_disk\_image](#input\_bastion\_vm\_boot\_disk\_image) | Bastion VM boot disk image | `string` | `"ubuntu-2204-lts"` | no |
| <a name="input_bastion_vm_machine_type"></a> [bastion\_vm\_machine\_type](#input\_bastion\_vm\_machine\_type) | Bastion VM machine type | `string` | n/a | yes |
| <a name="input_cluster_ip_cidr_range"></a> [cluster\_ip\_cidr\_range](#input\_cluster\_ip\_cidr\_range) | Cluster IP CIDR range | `string` | n/a | yes |
| <a name="input_cluster_location"></a> [cluster\_location](#input\_cluster\_location) | Cluster location | `string` | n/a | yes |
| <a name="input_cluster_secondary_pods_cidr_range"></a> [cluster\_secondary\_pods\_cidr\_range](#input\_cluster\_secondary\_pods\_cidr\_range) | Cluster secondary pods CIDR range | `string` | n/a | yes |
| <a name="input_cluster_secondary_services_cidr_range"></a> [cluster\_secondary\_services\_cidr\_range](#input\_cluster\_secondary\_services\_cidr\_range) | Cluster secondary services CIDR range | `string` | n/a | yes |
| <a name="input_container_cpu_alert_duration"></a> [container\_cpu\_alert\_duration](#input\_container\_cpu\_alert\_duration) | Container CPU alert duration | `string` | n/a | yes |
| <a name="input_container_cpu_alert_name"></a> [container\_cpu\_alert\_name](#input\_container\_cpu\_alert\_name) | Container CPU alert name | `string` | n/a | yes |
| <a name="input_container_cpu_alert_threshold_value"></a> [container\_cpu\_alert\_threshold\_value](#input\_container\_cpu\_alert\_threshold\_value) | Container CPU alert threshold value | `number` | n/a | yes |
| <a name="input_container_memory_alert_duration"></a> [container\_memory\_alert\_duration](#input\_container\_memory\_alert\_duration) | Container memory alert duration | `string` | n/a | yes |
| <a name="input_container_memory_alert_name"></a> [container\_memory\_alert\_name](#input\_container\_memory\_alert\_name) | Container memory alert name | `string` | n/a | yes |
| <a name="input_container_memory_alert_threshold_value"></a> [container\_memory\_alert\_threshold\_value](#input\_container\_memory\_alert\_threshold\_value) | Container memory alert threshold value | `number` | n/a | yes |
| <a name="input_container_restart_alert_alignment_period"></a> [container\_restart\_alert\_alignment\_period](#input\_container\_restart\_alert\_alignment\_period) | Container restart alert alignment period | `string` | n/a | yes |
| <a name="input_container_restart_alert_duration"></a> [container\_restart\_alert\_duration](#input\_container\_restart\_alert\_duration) | Container restart alert duration | `string` | n/a | yes |
| <a name="input_container_restart_alert_name"></a> [container\_restart\_alert\_name](#input\_container\_restart\_alert\_name) | Container restart alert name | `string` | n/a | yes |
| <a name="input_container_restart_alert_threshold_value"></a> [container\_restart\_alert\_threshold\_value](#input\_container\_restart\_alert\_threshold\_value) | Container restart alert threshold value | `number` | n/a | yes |
| <a name="input_database_tier"></a> [database\_tier](#input\_database\_tier) | Database tier | `string` | n/a | yes |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | Database version | `string` | `"MYSQL_8_0"` | no |
| <a name="input_db_availability_type"></a> [db\_availability\_type](#input\_db\_availability\_type) | Availability type | `string` | n/a | yes |
| <a name="input_db_backup_enabled"></a> [db\_backup\_enabled](#input\_db\_backup\_enabled) | DB backup enabled | `bool` | n/a | yes |
| <a name="input_db_binary_log_enabled"></a> [db\_binary\_log\_enabled](#input\_db\_binary\_log\_enabled) | Binary logs enabled for DB. This should be true only for MySQL Regional (not Zonal) deployments | `bool` | n/a | yes |
| <a name="input_db_cidr_range"></a> [db\_cidr\_range](#input\_db\_cidr\_range) | DB CIDR range | `string` | n/a | yes |
| <a name="input_db_common_labels"></a> [db\_common\_labels](#input\_db\_common\_labels) | Common labels | `map(string)` | <pre>{<br>  "user": "wso2"<br>}</pre> | no |
| <a name="input_db_deletion_protection"></a> [db\_deletion\_protection](#input\_db\_deletion\_protection) | Deletion protection. If false, database will be deleted with terraform destroy | `bool` | `true` | no |
| <a name="input_db_disk_size"></a> [db\_disk\_size](#input\_db\_disk\_size) | Disk size | `number` | n/a | yes |
| <a name="input_db_disk_type"></a> [db\_disk\_type](#input\_db\_disk\_type) | Disk type | `string` | n/a | yes |
| <a name="input_db_ipv4_enabled"></a> [db\_ipv4\_enabled](#input\_db\_ipv4\_enabled) | DB IPv4 enabled | `bool` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | DB name | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | DB password | `string` | n/a | yes |
| <a name="input_db_query_insights_enabled"></a> [db\_query\_insights\_enabled](#input\_db\_query\_insights\_enabled) | Query insights enabled | `bool` | n/a | yes |
| <a name="input_db_require_ssl"></a> [db\_require\_ssl](#input\_db\_require\_ssl) | Require SSL for DB connections | `bool` | n/a | yes |
| <a name="input_db_retained_backups"></a> [db\_retained\_backups](#input\_db\_retained\_backups) | DB retained backups | `number` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | DB username | `string` | n/a | yes |
| <a name="input_default_max_pods_per_node"></a> [default\_max\_pods\_per\_node](#input\_default\_max\_pods\_per\_node) | Maximum number of pods per node | `number` | n/a | yes |
| <a name="input_enable_database"></a> [enable\_database](#input\_enable\_database) | Set true to enable the creation of a MySQL database. | `bool` | `true` | no |
| <a name="input_enable_filestore"></a> [enable\_filestore](#input\_enable\_filestore) | Deploy a filestores for persistent storage | `bool` | `true` | no |
| <a name="input_enable_secret"></a> [enable\_secret](#input\_enable\_secret) | Enable secrets to store keystore password | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment. This will be used for resource naming. | `string` | `"Dev"` | no |
| <a name="input_filestore_capacity_gb"></a> [filestore\_capacity\_gb](#input\_filestore\_capacity\_gb) | Filestore capacity in GB | `number` | n/a | yes |
| <a name="input_filestore_location"></a> [filestore\_location](#input\_filestore\_location) | Filestore location | `string` | n/a | yes |
| <a name="input_filestore_name"></a> [filestore\_name](#input\_filestore\_name) | File share name | `string` | n/a | yes |
| <a name="input_filestore_tier"></a> [filestore\_tier](#input\_filestore\_tier) | Filestore tier | `string` | n/a | yes |
| <a name="input_ip_cidr_range"></a> [ip\_cidr\_range](#input\_ip\_cidr\_range) | IP CIDR range | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels | `map(string)` | n/a | yes |
| <a name="input_master_authorized_networks_cidr"></a> [master\_authorized\_networks\_cidr](#input\_master\_authorized\_networks\_cidr) | IP CIDR range for the master authorized networks | `string` | n/a | yes |
| <a name="input_master_cluster_ipv4_cidr"></a> [master\_cluster\_ipv4\_cidr](#input\_master\_cluster\_ipv4\_cidr) | IP CIDR range for the master cluster | `string` | n/a | yes |
| <a name="input_master_kubernetes_version"></a> [master\_kubernetes\_version](#input\_master\_kubernetes\_version) | Kubernetes version of the GKE cluster | `string` | n/a | yes |
| <a name="input_node_cpu_alert_duration"></a> [node\_cpu\_alert\_duration](#input\_node\_cpu\_alert\_duration) | Node CPU alert duration | `string` | n/a | yes |
| <a name="input_node_cpu_alert_name"></a> [node\_cpu\_alert\_name](#input\_node\_cpu\_alert\_name) | Node CPU alert name | `string` | n/a | yes |
| <a name="input_node_cpu_alert_threshold_value"></a> [node\_cpu\_alert\_threshold\_value](#input\_node\_cpu\_alert\_threshold\_value) | Node CPU alert threshold value | `number` | n/a | yes |
| <a name="input_node_memory_alert_duration"></a> [node\_memory\_alert\_duration](#input\_node\_memory\_alert\_duration) | Node memory alert duration | `string` | n/a | yes |
| <a name="input_node_memory_alert_name"></a> [node\_memory\_alert\_name](#input\_node\_memory\_alert\_name) | Node memory alert name | `string` | n/a | yes |
| <a name="input_node_memory_alert_threshold_value"></a> [node\_memory\_alert\_threshold\_value](#input\_node\_memory\_alert\_threshold\_value) | Node memory alert threshold value | `number` | n/a | yes |
| <a name="input_node_pool_location"></a> [node\_pool\_location](#input\_node\_pool\_location) | Node pool location | `string` | n/a | yes |
| <a name="input_node_pool_machine_type"></a> [node\_pool\_machine\_type](#input\_node\_pool\_machine\_type) | Node pool machine type | `string` | n/a | yes |
| <a name="input_node_pool_max_node_count"></a> [node\_pool\_max\_node\_count](#input\_node\_pool\_max\_node\_count) | Node pool max node count | `number` | n/a | yes |
| <a name="input_node_pool_min_node_count"></a> [node\_pool\_min\_node\_count](#input\_node\_pool\_min\_node\_count) | Node pool min node count | `number` | n/a | yes |
| <a name="input_node_pool_node_count"></a> [node\_pool\_node\_count](#input\_node\_pool\_node\_count) | Node pool node count | `number` | n/a | yes |
| <a name="input_node_pool_zone_locations"></a> [node\_pool\_zone\_locations](#input\_node\_pool\_zone\_locations) | Node pool zone locations | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | GCP project name | `string` | n/a | yes |
| <a name="input_project_services"></a> [project\_services](#input\_project\_services) | GCP project services | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Deployment region | `string` | n/a | yes |
| <a name="input_roles"></a> [roles](#input\_roles) | List of roles to assign | `list(string)` | <pre>[<br>  "roles/monitoring.metricWriter",<br>  "roles/logging.logWriter"<br>]</pre> | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | The list of the secrets | `list(map(string))` | `[]` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC name | `string` | n/a | yes |
| <a name="input_vpc_subnetwork_name"></a> [vpc\_subnetwork\_name](#input\_vpc\_subnetwork\_name) | VPC subnetwork name | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Deployment zone | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_instance"></a> [bastion\_instance](#output\_bastion\_instance) | ID of the bastion instance. |
| <a name="output_database_connection_name"></a> [database\_connection\_name](#output\_database\_connection\_name) | Connection name of the database instance. |
| <a name="output_database_default_user"></a> [database\_default\_user](#output\_database\_default\_user) | Default user of the database instance. |
| <a name="output_database_internal_ip"></a> [database\_internal\_ip](#output\_database\_internal\_ip) | Internal IP address of the database instance. |
| <a name="output_fileshare_name"></a> [fileshare\_name](#output\_fileshare\_name) | Fileshare name |
| <a name="output_filestore_location"></a> [filestore\_location](#output\_filestore\_location) | Location of the filestore. |
| <a name="output_filestore_location_ip"></a> [filestore\_location\_ip](#output\_filestore\_location\_ip) | IP address of the filestore. |
| <a name="output_filestore_name"></a> [filestore\_name](#output\_filestore\_name) | Filestore name |

---
This document is autogenerated using terraform-docs (https://github.com/terraform-docs/terraform-docs)
