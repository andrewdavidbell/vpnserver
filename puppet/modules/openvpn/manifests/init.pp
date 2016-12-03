class openvpn {
  # Step 1 - Installing OpenVPN
  package { 'epel-release':
    provider => 'yum',
    ensure   => installed,
  } ->
  package { 'openvpn':
    provider => 'yum',
    ensure   => installed,
  } ->
  package { 'easy-rsa':
    provider => 'yum',
    ensure   => installed,
  }

  # Step 2 - Configuring OpenVPN
  file { '/etc/openvpn':
    ensure => directory,
  }
  file { '/etc/openvpn/server.conf':
    ensure  => present,
    content => template('openvpn/server.conf.erb'),
    require => File['/etc/openvpn'],
  }

  # Step 3 - Generating Keys and Certificates
  file { '/etc/openvpn/easy-rsa/keys':
    ensure => directory,
  }
#  file { '/etc/openvpn/easy-rsa':
#    ensure  => file,
#    mode    => '0644',
#    source  => '/usr/share/easy-rsa/2.0/*',
#    require => File['/etc/openvpn/easy-rsa/keys'],
#  }

  # Step 4 - Routing
  # Step 5 - Starting OpenVPN

}
