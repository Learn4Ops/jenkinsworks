# Jenkins workshop
---
## Please follow the instruction

### Jenkins workshop prerequests

#### Minumum Hardware Req.
```
OS: Ubuntu 20.04
Ram: 8 GB
Cpu: 4 vpu
Disk: 75 GB 
```
## !!*** Warning you must use an account with sudo privileges ***!!


Jenkinsworks installs all dependencies with just one command


```
curl https://raw.githubusercontent.com/Learn4Ops/jenkinsworks/main/fullinstall.sh 2>/dev/null | bash
```

After the installation you can use Jenkins pipelines via web browser.

The output will be like:

```
6c442bb1f11146b9870582c359385e32
Assuming host local ip.............
Host Local ip 192.168.1.200
You can browse Jenkins with http://192.168.1.200:8080

 User: admin     PW: 6c442bb1f11146b9870582c359385e32
```

Login the http://192.168.1.200:8080 with this credentials. Then just run the pipelines.

## !!*** Warning you must use one pipeline job on the same time. ***!!
