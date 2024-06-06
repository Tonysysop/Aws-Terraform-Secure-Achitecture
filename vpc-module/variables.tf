
variable "vpc_cidr" {
  type        = string
  description = "cidr range of vpc"
}


variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of Public subnets cidrs"
  default     = []
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "List of Private subnets cidrs"
  default     = []
}

variable "availability_zones" {
  description = "Availablitiy zones for each subnet"
  type        = list(string)
  default     = []
}

variable "igw_name" {
  description = "Name of the igw"
  type        = string
}