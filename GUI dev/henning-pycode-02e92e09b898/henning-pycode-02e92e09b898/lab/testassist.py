import rope.base.project
from rope.contrib.codeassist import code_assist

example = """
class foo(object):
  abc = 1


foo."""
prj = rope.base.project.Project(".")
src = example
offset = len(src)


def test():
    for i in range(1000):
        code_assist(prj, src, offset, resource=None, maxfixes=3)


test()
