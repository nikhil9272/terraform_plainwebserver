#############################
## Application - Variables ##
#############################

# company name 
variable "company" {
  type        = string
}

# application name 
variable "app_name" {
  type        = string
}

# environment
variable "environment" {
  type        = string
}

# azure region
variable "location" {
  type        = string
}

# azure region shortname
variable "region" {
  type        = string
}

# owner
variable "owner" {
  type        = string
}

# description
variable "description" {
  type        = string
}


variable "hostname" {
  type = string
}



variable "storageaccount_name" {
  type = string
}

variable "backupname"{
  type = string
}

variable "tags_env"{
  type = string
}
variable "it_service"{
  type = string
}
variable "billing"{
  type = string
}

variable "container_name"{
  type = string
}

# App Service

/*variable "appservice_plan_tier" {
  type = string
}

variable "appservice_plan_size" {
  type = string
}*/
