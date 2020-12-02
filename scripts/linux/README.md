# Linux helper scripts

| Script            | Description                                                                                 |
|-------------------|---------------------------------------------------------------------------------------------|
| download.sh       | Download opencv and opencv_contrib repositories (configured based on options file)          |
| download_cuda.sh  | Download cuda for Ubuntu 16.04 (should be run with lightdm off 'sudo service lightdm stop') |
| download_cudnn.sh | Download cudnn and cudnn-dev for Ubuntu 16.04                                               |
| build.sh          | Build OpenCV (configured based on option file)                                              |

***Note:** it is important to run download_cuda.sh with the lightdm desktop stopped so that nvidia drivers install correctly*

## Future improvements
 - [ ] Check combinations of build options for valid selection (e.g. with_contib required if with_cuda is true)