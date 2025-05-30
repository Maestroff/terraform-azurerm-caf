locals {
  tags = var.inherit_tags ? merge(
    var.global_settings.tags,
    var.tags
  ) : null
  location = coalesce(var.location)
}

