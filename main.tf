data "oci_psql_configurations" "psql_configurations_lookup" {
  for_each = var.psql_configurations_lookup

  compartment_id              = each.value.compartment_id
  config_type                 = each.value.config_type
  configuration_id            = each.value.configuration_id
  db_version                  = each.value.db_version
  display_name                = each.value.display_name
  instance_memory_size_in_gbs = each.value.instance_memory_size_in_gbs
  instance_ocpu_count         = each.value.instance_ocpu_count
  shape                       = each.value.shape
  state                       = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

