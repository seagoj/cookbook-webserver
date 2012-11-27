# NewRepo
require 'fileutils'
require 'grit'

dotfilesPath = '../dotfiles'

project = ARGV[0]
puts project



unless(File.exists?(dotfilesPath))
	system('git clone git@github.com:seagoj/dotfiles.git '+dotfilesPath)
else
	system('cd '+dotfilesPath+' && git fetch')
end

system('git init')
system('git add *')
system('git commit -m "Commit of default dotfiles')
system('git remote add origin git@github.com:seagoj/project.git')
FileUtils.cp(dotfilesPath+'/.gitattributes','.')
FileUtils.cp(dotfilesPath+'/.gitignore','.')