# Ansible þróun f. windows -  Hacking session

## Ansible lyfturæðan

Lyfturæða um kosti Ansible: https://wiki.ok.is/pages/viewpage.action?pageId=72455446

Quick start kynning: https://www.ansible.com/resources/videos/quick-start-video

## Windows Subsystem for Linux

Hægt að virkja með því að keyra eftirfarandi powershell stubb og endurræsa í framhaldinu.

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

Muna svo að sækja linux subsystem-ið sem er ubuntu stýrikerfið. Dæmi um uppsetningarleiðbeiningar:  https://www.onmsft.com/news/how-to-install-windows-10s-linux-subsystem-on-your-pc
https://plenium.wordpress.com/2017/11/20/install-ansible-on-windows-10/



```bash
# Setja inn Ansible
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

# Athuga með útgáfu á ansible
ansible --version
```

## Ansible Container

Ansible frá docker instance. Meiri skjölun kemur síðar



Dockerfile fylgir með til að búa til Docker image

```bash

docker build --rm -t opinkerfi/ansible:0.2 .
```



```shell
docker run -it -v $PWD/krb5.conf.d:/etc/krb5.conf.d \
-v $PWD/ansible_config:/etc/ansible \ 
-v $PWD/workdir:/home/workdir \ 
opinkerfi/ansible:0.2 /bin/bash
```

## Ansible fyrir windows



* Fara yfir kerberos auðkenningu og hvað þarf til að hún virki ( Sjá Dockerfile )



https://www.ansible.com/integrations/infrastructure/windows
https://docs.ansible.com/ansible/latest/modules/list_of_windows_modules.html
https://docs.ansible.com/ansible/latest/modules/setup_module.html

https://github.com/opinkerfi/ok-ansible-windows

## Chocolatey

https://docs.ansible.com/ansible/latest/modules/win_chocolatey_module.html#win-chocolatey-module
https://chocolatey.org/search

## Vagrant

https://app.vagrantup.com/boxes/search?utf8=%E2%9C%93&sort=downloads&provider=hyperv&q=windows

## Annað

http://babun.github.io/
