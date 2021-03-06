# Copyright 2011 MaestroDev
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Define: maven::environment
#
# A puppet recipe to set the contents of the .mavenrc file
#
define maven::environment( $user, $group = 'root', $home = undef, $maven_opts = '', $maven_path_additions = '', $mavenrc_additions = '' ) {

  if $home == undef {
    $home_real = $user ? {
      'root'  => '/root',
      default => "/home/${user}"
    }
  }
  else {
    $home_real = $home
  }

  file { "${home_real}/.mavenrc":
    mode    => '0600',
    owner   => $user,
    group   => $group,
    content => template('maven/mavenrc.erb'),
  }
}
