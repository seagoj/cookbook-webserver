#variables
method = 'git'

ftp_site = ''
ftp_user = ''
ftp_pass = ''

#unless File.directory?(dir)
#	Dir.mkdir(dir)		
#end

#if File.exists?(dir+'.tar.gz')
#	File.delete(dir+'.tar.gz')
#end

system('git clone git://github.com/seagoj/cookbook-apt.git apt')
system('git clone git://github.com/opscode-cookbooks/mysql.git mysql')
system('git clone git://github.com/seagoj/cookbook-nginx.git nginx')
system('git clone git://github.com/opscode-cookbooks/openssl.git openssl')
system('git clone git://github.com/seagoj/cookbook-redis.git redis')
system('git clone git://github.com/seagoj/cookbook-php5-fpm.git php5-fpm')
system('git clone git://github.com/seagoj/cookbook-bootstrap.git bootstrap')
#system('tar zcvf '+dir+'.tar.gz '+dir)

#if File.exists?(dir+'.tar.gz')
#	require 'fileutils'
#	FileUtils.rm_rf dir
#end

case method
	when 'git'
		#system('git add writeCookbooks.rb')
		system('git add apt mysql nginx openssl redis php5-fpm bootstrap writeCookbooks.rb .gitattributes .gitignore')
		system('git commit -m "updating cookbook-master.tar.gz"')
		system('git push git@github.com:seagoj/cookbook.git master')
		puts 'URL: https://github.com/seagoj/cookbook/archive/master.tar.gz'
	when 'ftp'
		require 'net/ftp'
		ftp = Net::FTP.new(ftp_site)
		ftp.login(ftp_user,ftp_pass)
		ftp.put(dir+'.tar.gz','downloads/'+dir+'.tar.gz')
end