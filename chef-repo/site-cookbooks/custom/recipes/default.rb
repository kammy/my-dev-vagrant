#
# Cookbook Name:: custom
# Recipe:: default
#
# Copyright (C) 2014 Shuichi Kura
#
# All rights reserved - Do Not Redistribute
#

# Tools
package 'less'

# Users

#user 'kammy' do
#    action :create
#    shell '/bin/zsh'
#end

group 'docker' do
  action :modify
  members 'vagrant'
  append true
end

# Ruby
include_recipe 'rbenv::default'
include_recipe 'rbenv::ruby_build'
include_recipe 'rbenv::rbenv_vars'

rbenv_ruby '2.1.2' do
    global true
end

%w[homesick].each do |gem|
    rbenv_gem gem
end
