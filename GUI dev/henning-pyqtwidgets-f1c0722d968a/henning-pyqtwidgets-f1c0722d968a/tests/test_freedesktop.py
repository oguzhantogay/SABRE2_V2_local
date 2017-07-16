#!/usr/bin/env python
# -*- coding: utf-8 -*-

from qtwidgets.freedesktop import *


def test_freedesktop():
    for env in [detect_environment(), Kde(), Gnome()]:
        print env, env.find_action("edit-undo")


if __name__ == "__main__":
    test_freedesktop()
