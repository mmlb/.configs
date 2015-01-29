base:
  pkg.latest:
    - pkgs:
      - bpython
      - bpython2
      - btrfs-progs
      - gvim
      - htop
      - python
      - python2
      - sudo
      - zsh

openntpd:
  pkg:
    - latest
  service.running:
    - enable: True
    - watch:
      - pkg: openntpd

openssh:
  pkg:
    - latest
  service.running:
    - name: sshd
    - enable: True
    - watch:
      - pkg: openssh
