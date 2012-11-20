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

if File.exists?(dir+'.tar.gz')
	require 'fileutils'
	FileUtils.rm_rf dir
end

case method
	when 'git'
		system('git add '+dir+'.tar.gz')
		system('git add tarCookbooks.rb')
		system('git add .gitattributes .gitignore')
		system('git commit -m "updating '+dir+'.tar.gz"')
		system('git push git@github.com:seagoj/cookbook.git master')
	when 'ftp'
		require 'net/ftp'
		ftp = Net::FTP.new(ftp_site)
		ftp.login(ftp_user,ftp_pass)
		ftp.put(dir+'.tar.gz','downloads/'+dir+'.tar.gz')
end