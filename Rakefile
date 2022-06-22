require 'rake'
require 'erb'

task :default => [:install, :install_tools, :install_vim_plugins]

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

desc "install common command-line tools"
task :install_tools => [:install_ag, :install_diff_so_fancy]

desc "install Homebrew"
task :install_homebrew do
  sh <<~END
    if [ `uname` == "Darwin" ]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
  END
end

desc "install NPM using NVM"
task :install_npm do
  sh <<~END
    if [ -x "$(command -v nvm)" ]; then
      nvm install --lts
    fi
  END
end

desc "install the Silver Searcher (ag)"
task :install_ag => [:install_homebrew] do
  sh <<~END
    if [ -x "$(command -v apt-get)" ]; then
      sudo apt-get install silversearcher-ag
    elif [ -x "$(command -v brew)" ]; then
      brew install the_silver_searcher
    fi
  END
end

desc "install diff-so-fancy"
task :install_diff_so_fancy => [:install_npm] do
  sh <<~END
    if [ -x "$(command -v npm)" ]; then
      npm install -g diff-so-fancy
    else
      echo WARNING: manually install NPM first before installing diff-so-fancy!
    fi
  END
end

desc "install Vim plugins through Vundle"
task :install_vim_plugins do
  sh 'vim +PluginInstall +qall'
end

desc "install Oh My Zsh"
task :install_oh_my_zsh do
  path = 'https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh'
  sh %<sh -c "$(curl -fsSL #{path})">
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
