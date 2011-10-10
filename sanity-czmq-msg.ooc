use czmq
import czmq

main: func {
    major, minor, patch: Int
    zmq_version(major&, minor&, patch&)
    "zeromq version %d.%d.%d" printfln(major, minor, patch)

    ctx := Context new()
    req := Socket new(ctx, ZMQ REQ)
    rep := Socket new(ctx, ZMQ REP)

    port := req bind("tcp://*:*")
    "Bound on port %d" printfln(port)
    rep connect("tcp://localhost:%d" format(port))

    reqrep := Message new()
    reqrep addstr("DC->UP/1.4")
    req sendMessage(reqrep)
    
    {
        msg := rep recvMessage()
        hs := msg popstr()
        "%s" printfln(hs)
        msg destroy()
    }

    repreq := Message new()
    repreq addstr("UP->DC/1.4")
    rep sendMessage(repreq)

    {
        msg := req recvMessage()
        hs := msg popstr()
        "%s" printfln(hs)
        msg destroy()
    }

    ctx destroy()
}
