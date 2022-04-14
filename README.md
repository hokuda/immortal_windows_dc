# immortal_windows_dc

This is the Ansible Playbook to create Windows Domain Controller instance on EC2.

## Usage:

1. modify `vars:` corresponding to your setup.

2. run `ansible-playbook -i hosts immortal_windows_dc.yml` which yiels:

    * windows server instance
    * `./password.txt`
    * `./public_ip.txt`
    * `./{{host_name}}.keytab`
    
  You can access the Windows desktop via:

    ~~~
    xfreerdp /u:Administrator /v:`cat ./public_ip.txt` /p:`cat password.txt` /cert:tofu
    ~~~

## Prerequisites:

* Python BOTO module

        pip install boto --user
    
* Ansible and community.aws module

        sudo dnf install ansible
        ansible-galaxy collection install community.aws
