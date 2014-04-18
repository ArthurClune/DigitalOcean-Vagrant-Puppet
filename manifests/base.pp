

# Class: myhost::packages
#
# install some sample packages
#
class myhost::packages {

    # git/svn
    package { ["git-core", "git-svn", "subversion"]:
        ensure => "latest"
    }

    package { "zsh":
        ensure => "latest",
    }

}

# Class: myhost::files
#
#
class myhost::files {
    file { "/home/arthur":
        ensure  => "directory",
        recurse => "true",
        source  => "/vagrant/files/home/arthur"
    }
}

class myhost::users {

    # vagrant will create this user. Fixup shell
    user {"vagrant":
        shell  => "/bin/zsh"
    }

}

# Class: myhost
#
class myhost {

  anchor { 'myhost::begin': }        ->
  class  { 'myhost::packages': }     ->
  class  { 'myhost::files': }        ->
  class  { 'myhost::users': }        ->
  anchor { 'myhost::end': }

}

require 'myhost'

