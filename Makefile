folly-clean:
	rm folly/folly/folly/debian
	cd folly/folly/folly; make distclean

folly-setup:
	cd folly/folly/folly; autoreconf --install
	ln -s ../../debian folly/folly/folly/debian
	cd folly/folly/folly/test; wget "https://googletest.googlecode.com/files/gtest-1.6.0.zip"; unzip gtest-1.6.0.zip

folly-build: folly-setup
	cd folly/folly/folly; dpkg-buildpackage -b
