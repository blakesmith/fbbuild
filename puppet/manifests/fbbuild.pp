Exec {
  path => ["/bin:/usr/bin:/usr/local/bin:/usr/sbin:/sbin"]
}

node default, "reflect.blakesmith.me" {
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }

  Exec["apt-update"] -> Package <| |>

  package { ["build-essential", "automake", "libtool", "gdb", "git"]:
    ensure => installed
  }

  package { "packaging-dev":
    ensure => installed
  }

  # Common
  package { ["libssl-dev"]:
    ensure => installed
  }

  # Folly deps
  package{ ["autoconf-archive",
            "libboost-all-dev",
            "libevent-dev",
            "libdouble-conversion-dev",
            "libgoogle-glog-dev",
            "libgflags-dev",
            "liblz4-dev",
            "liblzma-dev",
            "libsnappy-dev",
            "zlib1g-dev",
            "binutils-dev",
            "libjemalloc-dev",
            "libiberty-dev"]:
              ensure => installed
  }

  # fbthrift
  package { ["flex",
             "bison",
             "libkrb5-dev",
             "libsasl2-dev",
             "libnuma-dev",
             "libgtest-dev",
             "pkg-config"]:
               ensure => installed
  }

  # proxygen
  package { ["libcap-dev",
             "ruby",
             "gperf",
             "wget"]:
               ensure => installed
  }
             
}
