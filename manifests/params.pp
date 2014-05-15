
class riemann::params {
  include boxen::config
  
  $version          =  '0.2.4-boxen1'
  $configtemplate   = 'riemann/riemann.config.erb'
  $configfile       = "${boxen::config::homebrewdir}/etc/riemann.config"

  $logdir           = "${boxen::config::logdir}/riemann"
  $logfilename      = "riemann.log"

  $logfile          = "${logdir}/${logfilename}"
  $executable       = "${boxen::config::homebrewdir}/bin/riemann"
}
