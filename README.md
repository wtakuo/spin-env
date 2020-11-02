spin-env
========
Docker image for [Spin model checker](http://spinroot.com/)

## Usage

Pull the docker image from the registry.
```
$ docker pull wtakuo/spin-env
```

Start a container with the command below.
```
$ cd path-to-your-spec-dir
$ docker run -it --rm -v $(pwd):/home/spin/spec wtakuo/spin-env
```

If things go well, you should see the bash prompt of the container as follows. 
Note that `cb117e5bb2af` is the container ID that may vary.
```
spin@cb117e5bb2af:~$ 
```

Now you can start working using Spin.
```
spin@cb117e5bb2af:~$ cd spec
spin@cb117e5bb2af:~$ spin -a example.pml
spin@cb117e5bb2af:~$ gcc -o pan pan.c
spin@cb117e5bb2af:~$ ./pan
```

## Note

The container runs bash with user `spin`.
The password of the user is `spin`.

If you would like to install some packages using apt, you should first issue `sudo apt update`.
