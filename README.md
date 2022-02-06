# Jenkins workshop
---
## Please follow the instruction

### Jenkins workshop prerequests

#### Minumum Hardware Req.
```
OS: Ubuntu 20.04
Ram: 8 GB
Cpu: 4 vcpu
Disk: 75 GB 
```
## !!*** Warning you must use an account with sudo privileges ***!!


Jenkinsworks installs all dependencies with just one command;

```
curl https://raw.githubusercontent.com/Learn4Ops/jenkinsworks/main/fullinstall.sh 2>/dev/null | bash
```

If you want to clone repo and edit the script;

```
cd jenkinsworks

bash install.sh
```

This script will take up to 15 min. ( based on internet speed ) Please wait until end.

After the installation you can use Jenkins pipelines via web browser.

The output will be like:

```
Assuming host local ip.............
Host Local ip 192.168.1.200
You can browse Jenkins with http://192.168.1.200:8080

 User: admin     PW: 6c442bb1f11146b9870582c359385e32
```

Login the http://192.168.1.200:8080 with this credentials. Then just run the pipelines with you choice .

If you want to test Destroy pipelines dont forget that you must create this envrionemnt before do that.

## !!*** Warning you must use one pipeline job on the same time. ***!!
