# spin-env : docker image for Spin

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


