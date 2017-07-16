# -*- coding: utf-8 -*-
from pycode.worker import WorkerProcess


def cb(cid, result):
    print "callback", cid, result


def bla(*args):
    print "BLABLA", args
    raise RuntimeError("Error")


def test_worker():
    w = WorkerProcess()
    w.register(bla)
    w.start()
    for i in range(10):
        w.execute("bla", callback=lambda r: cb(i, r))

    w.execute(bla, "stdout test")
    print "wating"
    while w.is_busy():
        break

    print "done"
