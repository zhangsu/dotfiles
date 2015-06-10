require 'rake'
require 'erb'

task :default => [:install, :install_vim_plugins]

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |filename|
    next if /Rakefile|README(?:.md|rdoc)|LICENSE/ =~ filename

    pathname = File.join(Dir.home, ".#{filename.sub(/\.erb$/, '')}")
    if File.exist?(pathname)
      if File.identical?(filename, pathname)
        puts "identical #{pathname}"
      elsif replace_all
        replace_file pathname, filename
      else
        print "overwrite #{pathname}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file pathname, filename
        when 'y'
          replace_file pathname, filename
        when 'q'
          exit
        else
          puts "skipping #{pathname}"
        end
      end
    else
      install_file pathname, filename
    end
  end
end

desc "install Vim plugins through Vundle"
task :install_vim_plugins do
  sh 'vim +PluginInstall +qall'
end

desc "install ruby-build plugin for rbenv"
task :install_ruby_build do
  `git clone git@github.com:sstephenson/ruby-build rbenv/plugins/ruby-build`
end

def replace_file(install_path, filename)
  system "rm -rf '#{install_path}'"
  install_file(install_path, filename)
end

def install_file(install_path, filename)
  if filename =~ /\.erb$/
    puts "generating #{install_path}"
    open install_path, 'w' do |f|
      f << ERB.new(File.read(filename)).result(binding)
    end
  else
    puts "linking #{install_path}"
    File.symlink File.join(Dir.pwd, filename), install_path
  end
end
