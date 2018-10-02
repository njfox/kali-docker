# Kali-Docker
A customized Kali docker build to avoid the overhead of running a full Kali VM. The start/stop/connect management scripts are based on Grazfather's [mypwndock](https://github.com/Grazfather/mypwndock).

## Usage
Clone this repo and run `./build` to build the image, followed by `./start` to boot it up. You can connect to a bash shell within the container with `./connect`. When you're done, stop it with `./stop`.

You can add further customizations, such as installing new packages in the Dockerfile. Host directories can be mounted by the image by adding the `-v` option in the `start` script. `~/Documents` is mounted to `/root/Documents` by default.