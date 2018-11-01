[Setup - mac/linux](https://github.com/K1-ZR/practice-lsdyna/wiki#setup---maclinux)  
[Setup - windows](https://github.com/K1-ZR/practice-lsdyna/wiki#setup---windows)  
[Useful Unix Commands](https://github.com/K1-ZR/practice-lsdyna/wiki#useful-unix-commands)

# Setup - mac/linux
* create an account on HCC
    * requires setting up Duo on your phone
## Access
* use Terminal to assess to the HCC supercomputers
```shell
ssh <username>@tusker.unl.edu
```
## File transfering
### Use Terminal
* uploading from local to remote
```shell
scp -r ./<folder_name> <username>@tusker.unl.edu:/work/<group_name>/<username>
# from the current directory (./) to the $WORK directory of supercomputer.
``` 
* downloading from remote to local
```shell
$ scp -r <username>@tusker.unl.edu:/work/<group_name>/<username>/<folder_name> ./
# from the $WORK directory of the supercomputer, to the current directory (./).
```
### Use Cyberduck
* follow [this link](https://hcc-docs.unl.edu/pages/viewpage.action?pageId=2851290).
# Setup - windows
* create an account on HCC
    * requires setting up Duo on your phone
## Access
* install Putty - a terminal emulator
    * use <tusker.unl.edu> as the hostname
## File transferring
* install WinSCP - a program to transfer files between computers
    * use <tusker.unl.edu> as the hostname

# Useful Unix commands
* to fix the problem caused by transferring ASCII files using the binary or automatic option in WinSCP:
```shell
dos2unix <filename>
```
* show the sizes of the files and totals in the current directory
```shell
du
```
