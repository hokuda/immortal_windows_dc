# immortal_windows_dc

This is the Ansible Playbook to create Windows Domain Controller instance on EC2.

## Usage:

1. copy settings.yml.template to your_own_setting.yml, copy key.yml.template to key.yml, and modify them as you like

2. run:

		ansible-playbook -v -i hosts ./immortal_vpc.yml -e @key.yml -e @your_own_setting.yml
		ansible-playbook -v -i hosts ./immortal_windows_dc.yml -e @key.yml -e @your_own_setting.yml

   which yields:

    * windows server instance
    * `./{{instance name}}.json`
    * `./{{instance name}}.keytab`
    
* You can access the Windows desktop via:

        xfreerdp /u:Administrator /v:`jq -r .instance.public_ip_address ./{{instance name}}.json` /p:`jq -r .password ./{{instance name}}.json` /cert:tofu

## Prerequisites:

* Python BOTO3 module

        pip install boto3 --user
    
* Ansible

        sudo dnf install ansible
