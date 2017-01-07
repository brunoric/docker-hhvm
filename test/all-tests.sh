VERSION=$(docker run --rm -v `pwd`:`pwd` -w `pwd` brunoric/hhvm:deb-hhvm hhvm ./test/version.php)
if [[ $VERSION == *"hhvm"* ]]; then
  echo 'Version test OK!'; 
  exit;
fi
exit 1;