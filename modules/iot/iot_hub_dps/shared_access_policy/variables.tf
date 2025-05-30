variable "settings" {
  description = "The settings for the Azure resource."
  type        = any
}

variable "global_settings" {
  description = "Global settings object (see module README.md)"
  type        = any
}

variable "resource_group_name" {
  description = "(Required) Resource group"
}

variable "resource_group" {
  description = "Resource group object to deploy the IoT Hub DPS shared access policy"
}

variable "iot_dps_name" {
  description = "(Required) The name of the IoT Hub. Changing this forces a new resource to be created"
}
