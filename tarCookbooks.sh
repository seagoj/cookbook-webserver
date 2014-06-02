dir='cookbooks'
rm -R -f cookbooks.tar.gz
mkdir $dir
cd $dir

git clone git://github.com/opscode-cookbooks/nginx.git
git clone git://github.com/opscode-cookbooks/mysql.git
git clone git://github.com/opscode-cookbooks/php.git
git clone git://github.com/opscode-cookbooks/build-essential.git
git clone git://github.com/opscode-cookbooks/ohai.git
git clone git://github.com/opscode-cookbooks/apt.git
git clone git://github.com/opscode-cookbooks/openssl.git

cp -r ../cookbooks_mine/nginx/files/default/nginx.conf ../cookbooks/nginx/templates/default/default-site.erb 

cd ..
tar zcvf cookbooks.tar.gz $dir
#rm -R -f cookbooks