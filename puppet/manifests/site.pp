node 'dev.hostname.vm' {
  notify { 'my_message':
    message => hiera('my_message'),
  }
}
