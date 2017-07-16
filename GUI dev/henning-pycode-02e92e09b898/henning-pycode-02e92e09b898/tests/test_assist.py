from pycode.ropeassist import module_completions


def test_module_completions():
    xml_modules = [
        'xml.FtCore', 'xml.dom', 'xml.marshal', 'xml.ns', 'xml.parsers',
        'xml.sax', 'xml.schema', 'xml.unicode', 'xml.utils', 'xml.xpath', 'xml.xslt']

    assert sorted(module_completions('import xml.')) == xml_modules

    assert sorted(module_completions('import xml.d')) == ['xml.dom']

    assert module_completions('from xml.etree ') == ['import ']

    assert sorted(module_completions('from xml.etree import '), key=str.lower) ==\
        ['cElementTree', 'ElementInclude', 'ElementPath', 'ElementTree']

    s = 'from xml.etree.ElementTree import '
    assert module_completions(s + 'V') == ['VERSION']

    assert sorted(module_completions(s + 'VERSION,XM')) ==\
        ['XML', 'XMLID', 'XMLParser', 'XMLTreeBuilder']

    assert module_completions(s + '(dum') == ['dump']

    assert module_completions(s + '(dump,Su') == ['SubElement']
