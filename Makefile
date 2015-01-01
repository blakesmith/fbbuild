all: folly-build folly-install fbthrift-build fbthrift-install proxygen-build proxygen-install
clean: folly-clean fbthrift-clean proxygen-clean
install: folly-install fbthrift-install proxygen-install

folly-clean:
	rm -f folly/folly/folly/debian
	rm -f folly/folly/*.deb
	rm -f folly/folly/*.changes
	rm -rf folly/debian/folly
	rm -rf folly/folly
	git checkout folly/folly
	git submodule update folly/folly

folly-setup:
	cd folly/folly/folly; autoreconf --install
	ln -sf ../../debian folly/folly/folly/
	cd folly/folly/folly/test; wget "https://googletest.googlecode.com/files/gtest-1.6.0.zip"; unzip gtest-1.6.0.zip

folly-build: folly-setup
	cd folly/folly/folly; DEB_BUILD_OPTIONS=nocheck dpkg-buildpackage -b

folly-install:
	sudo dpkg -i folly/folly/folly*.deb

fbthrift-clean:
	rm -f fbthrift/fbthrift/thrift/debian
	rm -f fbthrift/fbthrift/*.deb
	rm -f fbthrift/fbthrift/*.changes
	rm -rf fbthrift/debian/fbthrift
	rm -rf fbthrift/fbthrift
	git checkout fbthrift/fbthrift
	git submodule update fbthrift/fbthrift

fbthrift-setup:
	cd fbthrift/fbthrift/thrift; autoreconf --install
	ln -sf ../../debian fbthrift/fbthrift/thrift/
	cd fbthrift; patch -p0 -f < debian/patches/000-disable-py-compiler.patch || true

fbthrift-build: fbthrift-setup
	cd fbthrift/fbthrift/thrift; DEB_BUILD_OPTIONS=nocheck dpkg-buildpackage -b

fbthrift-install:
	sudo dpkg -i fbthrift/fbthrift/fbthrift*.deb

proxygen-clean:
	rm -f proxygen/proxgen/proxygen/debian
	rm -f proxygen/proxygen/*.deb
	rm -f proxygen/proxygen/*.changes
	rm -rf proxygen/debian/proxygen
	rm -rf proxygen/proxygen
	git checkout proxygen/proxygen
	git submodule update proxygen/proxygen

proxygen-setup:
	cd proxygen/proxygen/proxygen; autoreconf --install
	ln -sf ../../debian proxygen/proxygen/proxygen/

proxygen-build: proxygen-setup
	cd proxygen/proxygen/proxygen; DEB_BUILD_OPTIONS=nocheck dpkg-buildpackage -b

proxygen-install:
	sudo dpkg -i proxygen/proxygen/proxygen*.deb
