dir='cookbooks'
rm -f cookbooks.tar.gz
rm -R -f cookbooks
mkdir $dir
cd $dir

git clone git://github.com/seagoj/cookbook-php5-fpm.git php5-fpm
git clone git://github.com/seagoj/cookbook-nginx.git nginx
git clone git://github.com/opscode-cookbooks/mysql.git mysql
git clone git://github.com/opscode-cookbooks/openssl.git openssl
git clone git://github.com/seagoj/cookbook-apt.git apt
git clone git://github.com/seagoj/cookbook-redis.git redis

cd ..
tar zcvf cookbooks.tar.gz $dir
rm -R -f cookbooks