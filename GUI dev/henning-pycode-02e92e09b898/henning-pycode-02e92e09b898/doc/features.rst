Features
========

Working
-------

TODO


Expected
---------

 * autocomplete, of course
   * autocomplete restructured text syntax inside documentation strings (:param foo..)
 * find definítion
 * find usage/show occurences
 * show signature/doc
 * show type/kind of given symbol
 * refactoring
   * rename
   * move
   * extract variable/constant
 * checks
   * valid syntax
   * pylint
   * pyflakes
   * pep8
   * regex syntax inside strings
   * tabnanny
 * fixing
   * NameErrors:
     * offer to add import-statement if name is found in module database
     * offer to add function if name is called (method if dotted-name)
     * offer to add variable if name is not called (attribute if dotted-name)
     * offer rename if similar name is found (fuzzy string compare)
   * formatting
     * autopep8
     * strip lines with spaces if not inside expression
     * remove empty lines at bottom of file
   * Python 2/3 syntax differences: 2to3
   * tabs to spaces
   * spelling corrections
 * goto symbol
   * inputting any class name opens the file containing the class
 * outline/tree/structure of module
 * indention hints/autoindent
 * tasks (XXX/TODO in source)
 * auto-editing
   * close parentheses/brackets/braces
   * space after comma
   * after "from FOO " append "import "
   * add args after a star in function header, add kwargs after two stars
   * add documentation stub based on signature
 * more smart editing
   * regular expressions in code should be highlighted and validated
   * spell check comments and strings
 * correctly load/save source files according to encoding hint at the header
 * project settings
   * source root folder
   * addition python path
   * virtualenv support
 * online help for api/library
 * debugging facility

