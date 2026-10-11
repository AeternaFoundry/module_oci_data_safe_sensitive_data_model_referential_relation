resource "oci_data_safe_sensitive_data_model_referential_relation" "data_safe_sensitive_data_model_referential_relations" {
  for_each = var.data_safe_sensitive_data_model_referential_relations

  relation_type           = each.value.relation_type
  sensitive_data_model_id = each.value.sensitive_data_model_id
  is_sensitive            = each.value.is_sensitive

  child {
    app_name           = each.value.child.app_name
    column_group       = each.value.child.column_group
    object             = each.value.child.object
    object_type        = each.value.child.object_type
    schema_name        = each.value.child.schema_name
    sensitive_type_ids = each.value.child.sensitive_type_ids
  }

  parent {
    app_name           = each.value.parent.app_name
    column_group       = each.value.parent.column_group
    object             = each.value.parent.object
    object_type        = each.value.parent.object_type
    schema_name        = each.value.parent.schema_name
    sensitive_type_ids = each.value.parent.sensitive_type_ids
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

