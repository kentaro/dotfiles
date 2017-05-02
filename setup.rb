#!/usr/bin/env ruby

require 'fileutils'

Dir.foreach "." do |p|
  next if p == "." || p == ".."
  next if p == ".git"
  next if p == "setup.rb"

  if p == ".config"
    Dir.foreach ".config" do |c|
      next if c == "." || c == ".."

      src = "#{Dir.pwd}/.config/#{c}" 
      dst = "#{Dir.home}/.config/#{c}" 

      FileUtils.rm_f dst
      File.symlink src, dst
      puts "link: #{dst} to #{src}"
    end
  else
    src = "#{Dir.pwd}/#{p}" 
    dst = "#{Dir.home}/#{p}" 

    FileUtils.rm_f dst
    File.symlink src, dst
    puts "link: #{dst} to #{src}"
  end
end
