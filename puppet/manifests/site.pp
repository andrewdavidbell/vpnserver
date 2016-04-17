node 'vpnserver.vm' {
  notify { 'my_message':
    message => hiera('my_message'),
  }

  # Step 1 - Installing OpenVPN
  package {'epel-release':
    provider => 'yum',
    ensure   => installed,
  } ->
  package {'openvpn':
    provider => 'yum',
    ensure   => installed,
  } ->
  package {'easy-rsa':
    provider => 'yum',
    ensure   => installed,
  }
}
