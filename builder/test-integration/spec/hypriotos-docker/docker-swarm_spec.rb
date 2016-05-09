require 'spec_helper'

describe file('/var/local/rpi-swarm_v1.2.1.tar.gz') do
  it { should be_file }
end

describe command('docker run --rm -t hypriot/rpi-swarm --version') do
  its(:stdout) { should match /swarm version 1.2.1 \(HEAD\)/ }
  its(:exit_status) { should eq 0 }
end

describe command('docker images hypriot/rpi-swarm') do
  its(:stdout) { should match /hypriot\/rpi-swarm .*latest .*07fafcb46ec6 / }
  its(:exit_status) { should eq 0 }
end
