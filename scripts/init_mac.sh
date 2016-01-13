curl -O http://selenium-release.storage.googleapis.com/2.48/SafariDriver.safariextz

curl -O https://github.com/downloads/mackyle/xar/xar-1.6.1.tar.gz
./configure
make
sudo make install
sudo ln -s /full/path/to/xar-1.6.1/src/xar /usr/local/bin/xar161

open SafariDriver.safariextz
