require 'rake'
require 'erb'

task :default => [:install]

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
