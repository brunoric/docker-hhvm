function version_test()
{
    if [ ! -z "$1" ]; then
        local BUILD=$1
        local VERSION=$(docker run --rm -v `pwd`:`pwd` -w `pwd` brunoric/hhvm:$BUILD hhvm ./test/version.php)
        if [[ $VERSION == *"hhvm"* ]]; then
            echo 'Version test OK!'; 
        else
            echo 'Version test Failed!'; 
            exit 1;
        fi
    fi
}

function all_builds_version_test()
{
    for build in deb-hhvm deb-hhvm-dbg deb-hhvm-dev deb-hhvm-nightly deb-hhvm-nightly-dbg deb-hhvm-dev-nightly tag-3.17.0 git
    do 
        version_test $build;
    done
}
all_builds_version_test;