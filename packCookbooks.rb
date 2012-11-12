tempdir='cookbooks'

File.delete(tempdir+'.tar.gz')
Dir.delete(tempdir)
Dir.mkdir(tempdir)
Dir.cd(tempdir)

git clone git://github.com/seagoj/cookbook-php5-fpm.git php5-fpm
git clone git://github.com/seagoj/cookbook-nginx.git nginx
git clone git://github.com/opscode-cookbooks/mysql.git mysql
git clone git://github.com/opscode-cookbooks/openssl.git openssl
git clone git://github.com/seagoj/cookbook-apt.git apt
git clone git://github.com/seagoj/cookbook-redis.git redis

Dir.cd('..')
system('tar zcvf '+tempdir+'.tar.gz'+tempdir)
Dir.delete(tempdir)