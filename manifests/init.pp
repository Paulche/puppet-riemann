
class riemann(
  # Params which change often
  $version            = $riemann::params::version,
  $configtemplate     = $riemann::params::configtemplate,
  $configfile         = $riemann::params::configfile,
  
  # Params which change seldom
  $logdir             = $riemann::params::logdir,
  $logfilename        = $riemann::params::logfilename,
) inherits riemann::params {

  homebrew::formula { 'riemann': }

  package { 'boxen/brews/riemann':
    ensure    => $version,
    notify    => Service['riemann'],
    require   => Homebrew::Formula['riemann'],
    alias     => 'riemann',
  }

  service { 'dev.riemann':
    ensure => running,
    enable => true,
    alias  => 'riemann',
    require => Package['riemann'],
  }

  file { "/Library/LaunchDaemons/dev.riemann.plist":
    content => template('riemann/riemann.plist.erb'),
    group   => wheel,
    owner   => root;
  }

  file { $configfile:
    content => template($configtemplate),
    group   => wheel,
    owner   => root,
    notify  => Service['riemann'];
  }

  # boxen::env_script { 'influxdb':
  #   ensure   => present,
  #   content  => template('riemann/env.sh.erb'),
  #   priority => 'lower',
  # }
}

