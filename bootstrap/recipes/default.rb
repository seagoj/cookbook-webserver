configDir='~/config'

package 'python-software-properties'

execute "add-apt-repo-cairo-dock" do
  command "add-apt-repository --yes ppa:cairo-dock-team/ppa"
end

execute "apt-update" do
  command "apt-get update"
end

package 'kubuntu-desktop'
package 'wget'
package 'unrar'
package 'git'
package 'yakuake'
package 'eclipse'
package 'eclipse-jdt'
package 'eclipse-pde'
package 'eclipse-platform'
package 'eclipse-rcp'
package 'gdb'
package 'golang'
package 'vlc'
package 'vlc-plugin-pulse'
package 'mozilla-plugin-vlc'
package 'gimp'
package 'pidgin'
package 'sabnzbdplus'
package 'cairo-dock'
package 'cairo-dock-plug-ins'
package 'conky-all'

execute "mkdir-config" do
  not_if {File.exists?($configDir)}
  command "mkdir "+$configDir
end

cookbook_file "~/.conkyrc" do
	source ".conkyrc"
	mode 0755
end

cookbook_file "~/.lua" do
	source ".lua"
	mode 0755
end

cookbook_file "~/.conky" do
	source "conky"
	mode 0755
end