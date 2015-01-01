Exec {
  path => ["/bin:/usr/bin:/usr/local/bin:/usr/sbin:/sbin"]
}

node default, "fbdev.blakesmith.me" {
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }

  Exec["apt-update"] -> Package <| |>

  package { ["build-essential", "automake", "libtool", "gdb", "git"]:
    ensure => installed
  }
}
