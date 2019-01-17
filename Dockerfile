FROM centos:7
ENV container docker

LABEL "com.example.vendor"="Opin Kerfi"
LABEL maintainer="samuel@ok.is"
LABEL version="0.2"
LABEL description="Ansible container sem hægt er að nota td. fyrir þróun á ansible uppskriftum."

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
# Kerberos Stuðningur - Active Directory tengingar
RUN yum update -y && yum install -y epel-release && yum -y install ansible python-devel python2-pip krb5-devel krb5-libs krb5-workstation gcc git && yum clean all  && rm -rf /var/cache/yum
RUN pip install "pywinrm[kerberos]" pywinrm
RUN ansible-galaxy install deekayen.chocolatey

VOLUME [ "/etc/ansible" ]
VOLUME [ "/sys/fs/cgroup" ]
VOLUME [ "/etc/krb5.conf.d" ]
VOLUME [ "/home/workdir" ]
WORKDIR /home/workdir

CMD ["/usr/sbin/init"] 
