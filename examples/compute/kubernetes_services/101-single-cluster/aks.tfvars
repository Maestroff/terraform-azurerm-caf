global_settings = {
  default_region = "region1"
  regions = {
    region1 = "australiaeast"
  }
}

resource_groups = {
  aks_re1 = {
    name   = "aks-re1"
    region = "region1"
  }
}

aks_clusters = {
  cluster_re1 = {
    name               = "akscluster-re1-001"
    resource_group_key = "aks_re1"
    os_type            = "Linux"
    sku_tier           = "Standard"

    cost_analysis_enabled = true

    identity = {
      type = "SystemAssigned"
    }

    vnet_key = "spoke_aks_re1"

    network_profile = {
      network_plugin    = "azure"
      load_balancer_sku = "standard"
    }

    # enable_rbac = true
    #azure_active_directory_role_based_access_control = {
    #  enabled = true
    #  tenant_id = "00000000-0000-0000-0000-000000000000"
    #  admin_group_object_ids = ["00000000-0000-0000-0000-000000000000"]
    #}


    oms_agent = {
      log_analytics_key = "central_logs_region1"
    }

    # admin_groups = {
    #   # ids = []
    #   # azuread_groups = {
    #   #   keys = []
    #   # }
    # }

    load_balancer_profile = {
      # Only one option can be set
      managed_outbound_ip_count = 1
    }

    default_node_pool = {
      name    = "sharedsvc"
      vm_size = "Standard_F4s_v2"
      #subnet_key            = "aks_nodepool_system"
      subnet = {
        key = "aks_nodepool_system"
        #resource_id = "/subscriptions/97958dac-xxxx-xxxx-xxxx-9f436fa73bd4/resourceGroups/qxgc-rg-aks-re1/providers/Microsoft.Network/virtualNetworks/qxgc-vnet-aks/subnets/qxgc-snet-aks_nodepool_system"
      }
      auto_scaling_enabled        = false
      enable_node_public_ip       = false
      max_pods                    = 30
      node_count                  = 1
      os_disk_size_gb             = 512
      temporary_name_for_rotation = "temp"
      tags = {
        "project" = "system services"
      }
    }

    node_resource_group_name = "aks-nodes-re1"
    upgrade_settings = {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }

    addon_profile = {
      azure_keyvault_secrets_provider = {
        secret_rotation_enabled  = true
        secret_rotation_interval = "2m"
      }
    }
  }
}
