# test.pp
file { '/etc/nginx/nginx.conf':
  ensure  => 'file',
  content => template('nginx/nginx.conf.erb'),
}