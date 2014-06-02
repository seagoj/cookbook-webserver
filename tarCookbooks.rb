require 'net/ftp'

#variables
dir = 'cookbooks'
method = 'git'

ftp_site = ''
ftp_user = ''
ftp_pass = ''

unless File.directory?(dir)
	Dir.mkdir(dir)		
end

if File.exists?(dir+'.tar.gz')
	File.delete(dir+'.tar.gz')
end

system('git clone git://github.com/seagoj/cookbook-apt.git '+dir+'/apt')
system('git clone git://github.com/opscode-cookbooks/mysql.git '+dir+'/mysql')
system('git clone git://github.com/seagoj/cookbook-nginx.git '+dir+'/nginx')
system('git clone git://github.com/opscode-cookbooks/openssl.git '+dir+'/openssl')
system('git clone git://github.com/seagoj/cookbook-redis.git '+dir+'/redis')
system('git clone git://github.com/seagoj/cookbook-php5-fpm.git '+dir+'/php5-fpm')
system('git clone git://github.com/seagoj/cookbook-bootstrap.git '+dir+'/bootstrap')
system('tar zcvf '+dir+'.tar.gz '+dir)

case method
	when 'git'
		system('git commit -a '+dir+'.tar.gz')
		system('git push git@github.com:seagoj/cokkbook.git')
	when 'ftp'
		ftp = Net::FTP.new(ftp_site)
		ftp.login(ftp_user,ftp_pass)
		ftp.put(dir+'.tar.gz','downloads/'+dir+'.tar.gz')
end

#dir='cookbooks'
#rm -R -f cookbooks.tar.gz
#mkdir $dir
#cd $dir

#git clone git://github.com/opscode-cookbooks/nginx.git
#git clone git://github.com/opscode-cookbooks/mysql.git
#git clone git://github.com/opscode-cookbooks/php.git
#git clone git://github.com/opscode-cookbooks/build-essential.git
#git clone git://github.com/opscode-cookbooks/ohai.git
#git clone git://github.com/opscode-cookbooks/apt.git
#git clone git://github.com/opscode-cookbooks/openssl.git

#cp -r ../cookbooks_mine/nginx/files/default/nginx.conf ../cookbooks/nginx/templates/default/default-site.erb 

#cd ..
#tar zcvf cookbooks.tar.gz $dir
#rm -R -f cookbooks
