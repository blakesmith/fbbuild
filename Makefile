DEB_BUILD_OPTIONS = nocheck

folly-clean:
	rm folly/folly/folly/debian
	rm folly/folly/*.deb
	rm folly/folly/*.changes
	cd folly/folly/folly; make distclean

folly-setup:
	cd folly/folly/folly; autoreconf --install
	ln -sf ../../debian folly/folly/folly/
	cd folly/folly/folly/test; wget "https://googletest.googlecode.com/files/gtest-1.6.0.zip"; unzip gtest-1.6.0.zip

folly-build: folly-setup
	cd folly/folly/folly; dpkg-buildpackage -b

fbthrift-clean:
	rm -f fbthrift/fbthrift/thrift/debian
	rm -f fbthrift/fbthrift/*.deb
	rm -f fbthrift/fbthrift/*.changes
	cd fbthrift/fbthrift/thrift; make distclean

fbthrift-setup:
	cd fbthrift/fbthrift/thrift; autoreconf --install
	ln -sf ../../debian fbthrift/fbthrift/thrift/
	cd fbthrift; patch -p0 -f < debian/patches/000-disable-py-compiler.patch || true

fbthrift-build: fbthrift-setup
	cd fbthrift/fbthrift/thrift; DEB_BUILD_OPTIONS=nocheck dpkg-buildpackage -b
