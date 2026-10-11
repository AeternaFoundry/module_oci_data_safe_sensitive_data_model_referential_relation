variable "data_safe_sensitive_data_model_referential_relations" {
  description = <<EOT
Map of data_safe_sensitive_data_model_referential_relations, attributes below
Required:
    - relation_type
    - sensitive_data_model_id
    - child (block):
        - app_name (required)
        - column_group (required)
        - object (required)
        - object_type (required)
        - schema_name (required)
        - sensitive_type_ids (optional)
    - parent (block):
        - app_name (required)
        - column_group (required)
        - object (required)
        - object_type (required)
        - schema_name (required)
        - sensitive_type_ids (optional)
Optional:
    - is_sensitive
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    relation_type           = string
    sensitive_data_model_id = string
    is_sensitive            = optional(bool)
    child = object({
      app_name           = string
      column_group       = list(string)
      object             = string
      object_type        = string
      schema_name        = string
      sensitive_type_ids = optional(list(string))
    })
    parent = object({
      app_name           = string
      column_group       = list(string)
      object             = string
      object_type        = string
      schema_name        = string
      sensitive_type_ids = optional(list(string))
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

