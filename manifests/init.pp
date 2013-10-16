class pdnsd (
  $config            = $pdnsd::params::config,
  $config_template   = $pdnsd::params::config_template,
  $package_ensure    = $pdnsd::params::package_ensure,
  $package_name      = $pdnsd::params::package_name,
  $service_enable    = $pdnsd::params::service_enable,
  $service_ensure    = $pdnsd::params::service_ensure,
  $service_manage    = $pdnsd::params::service_manage,
  $service_name      = $pdnsd::params::service_name,
) inherits pdnsd::params {

  validate_absolute_path($config)
  validate_string($config_template)
  validate_string($package_ensure)
  validate_array($package_name)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_string($service_name)

  include '::pdnsd::install'
  include '::pdnsd::config'
  include '::pdnsd::service'

  Class['::pdnsd::install'] -> Class['::pdnsd::config'] ~> Class['::pdnsd::service']

}
