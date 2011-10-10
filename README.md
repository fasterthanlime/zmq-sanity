## A few sanity notes on zeromq & czmq

### Avoid 3.x at all costs

As of October 10, 2011 - czmq doesn't work any zeromq 3.0 release (tester 3.0.1, 3.0.2, or 3.0.3 - the sanity-czmq-msg test fails)

### Link statically on OSX

OSX is a fucking mess - don't even attempt to link anything dynamically.

We have a repo for that static builds: ofmlabs/lame-and-zmq-binaries - just add -L path/to/lame-and-zmq-binaries and you'll be good to go.

### If a czmq recv() blocks 'forever', you probably have the wrong address

Double-check the domain name/IP or the port.

Also preferrably find a way to set sane timeouts.


