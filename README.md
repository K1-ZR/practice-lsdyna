* [Setup - mac/linux](https://github.com/K1-ZR/practice-lsdyna#setup---maclinux)  
* [Setup - windows](https://github.com/K1-ZR/practice-lsdyna#setup---windows)  
* [Useful Unix Commands](https://github.com/K1-ZR/practice-lsdyna#useful-unix-commands)
* [Example](https://github.com/K1-ZR/practice-lsdyna#example)  

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
    * use `tusker.unl.edu` as the hostname
## File transferring
* install WinSCP - a program to transfer files between computers
    * use `tusker.unl.edu` as the hostname

# Useful Unix commands
* to fix the problem caused by transferring ASCII files using the binary or automatic option in WinSCP:
```shell
dos2unix <filename>
```
* show the sizes of the files and totals in the current directory
```shell
du
```
# Example
* logon to tusker
```shell
# check your current directory
pwd

# move to work directory
work
```
* you need a .k file(s) and a slurm file to run amodel
* run a LS-Dyna job
```shell
sbatch <lsdyna-slurm-smp>
```
* monitor jobs
```shell
sq
```
* delete unnecessary outputs
```shell 
rmd3
```
**note:** When LS-Dyna actually starts a file named `time-start` is created.  
          when LS-Dyna actually ends a file named `time-end` is created.  
# LS-PREPOST
* Model
   * SelPart - *turn parts on/off*
* EleTol
   * Blank - *mask/hide portions of model*
   * Ident - *identify id of nodes/elements/parts*
   * Measur - *measure distance, angle, mass, etc. *
* Post
   * Vector - *plot vectors*
   * FriComp - *generate fringe plots*
   * FriRange - *st range for fringe plots*
   * ASCII - *plot time history data from elout, ndout, secforc, rwforc, etc. *
