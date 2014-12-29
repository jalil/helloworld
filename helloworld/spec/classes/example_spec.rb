require 'spec_helper'

describe 'helloworld' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "helloworld class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('helloworld::params') }
        it { should contain_class('helloworld::install').that_comes_before('helloworld::config') }
        it { should contain_class('helloworld::config') }
        it { should contain_class('helloworld::service').that_subscribes_to('helloworld::config') }

        it { should contain_service('helloworld') }
        it { should contain_package('helloworld').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'helloworld class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('helloworld') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
