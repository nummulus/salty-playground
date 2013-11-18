#simple jenkins install

jenkins:
  pkg:
    - installed
  cmd.run:
    - name: wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | sudo apt-key add -
  require:
    - sls: java
  
/etc/apt/sources.list.d/jenkins.list:
  file.managed:
    - source: salt://jenkins/jenkins.list #no idea how to get this working with a salt bootstrap
    - defaults: "deb http://pkg.jenkins-ci.org/debian binary/"

    
    

