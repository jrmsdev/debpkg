Vagrant.require_version ">=2.0.0"

Vagrant.configure("2") do |config|
    config.vm.box = "jrmsdev/debian-testing"
    config.vm.hostname = "jrmsdev-debpkg"

    config.vm.provider "virtualbox" do |vb|
        vb.name = "jrmsdev-debpkg"
    end

    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.synced_folder "./build", "/build", type: "rsync"

    config.vm.provision "dist-upgrade", type: "shell", inline: <<-SHELL
        set -e
        export DEBIAN_FRONTEND=noninteractive
        DEBDOM=deb.debian.org
        CF=/etc/apt/sources.list
        echo "deb http://${DEBDOM}/debian testing main" >${CF}
        echo "deb http://${DEBDOM}/debian-security testing/updates main" >>${CF}
        echo "deb http://${DEBDOM}/debian unstable main" >>${CF}
        apt-get clean
        apt-get update
        apt-get dist-upgrade -y --purge
        apt-get clean
        apt-get autoremove -y --purge
    SHELL

    config.vm.provision "apt-install", type: "shell", inline: <<-SHELL
        set -e
        export DEBIAN_FRONTEND=noninteractive
        apt-get install -y --no-install-recommends --purge \
                git-dpm dh-make dh-systemd quilt pristine-tar vim-tiny \
                fakeroot lintian sbuild schroot python3-setuptools \
                debootstrap devscripts less python3-venv apt-cacher-ng
        apt-get clean
        apt-get autoremove -y --purge
    SHELL

    config.vm.provision "sbuild-setup", type: "shell", inline: <<-SHELL
        sbuild-adduser vagrant
        sbuild-createchroot sid /srv/chroot/unstable-amd64 \
                --alias=unstable --alias=UNRELEASED \
                http://127.0.0.1:3142/deb.debian.org/debian
        cp /usr/share/doc/sbuild/examples/example.sbuildrc \
                /home/vagrant/.sbuildrc
    SHELL
end
