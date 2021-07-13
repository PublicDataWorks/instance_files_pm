### Introduction
This repository contains file that customize the Police Data Manager (PDM) product.

### Testing Locally
In order to test PDM locally, you can setup the `INSTANCE_FILES_DIR` environment variable on your local machine to point it to the `instance-files` directory within this repository. This will allow the PDM application to read from this absolute path and tailor the application to your cities requirements.

**How?**

Add absolute path of your instance-files folder location in whatever file you use ( .profile, .zshrc, etc) we will be using .profile for this example
* In your terminal, navigate inside the instance-files folder after cloning the repo
* enter the command `pwd`  and copy path that is outputted
* open the environment file with your desired text editor and set your INSTANCE_FILES_DIR environment variable.
  * ex: export INSTANCE_FILES_DIR=“`paste path here`”
* enter the command `source ~/.profile`
  * tip: exit out your terminals for source to take effect. To double check reopen your terminal and enter `echo $INSTANCE_FILES_DIR` , you should see the path that you pasted.