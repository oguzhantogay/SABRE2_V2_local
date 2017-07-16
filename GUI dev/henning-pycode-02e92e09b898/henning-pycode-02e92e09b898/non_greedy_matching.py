import re  
def fuzzyfinder(user_input, collection):
    """
        >>> fuzzyfinder('user', collection)
        ['user_group.doc', 'api_user.doc']
        
        >>> print fuzzyfinder('mig', collection)
    ['migrations.py', 'django_migrations.py', 'main_generator.py', 'django_admin_log.py']
    """
    suggestions = []
    pattern = '.*?'.join(user_input)   # Converts 'djm' to 'd.*?j.*?m'
    regex = re.compile('%s' % pattern)  # Compiles a regex.
    for item in collection:
        match = regex.search(item)   # Checks if the current item matches the regex.
        if match:
            suggestions.append((len(match.group()), match.start(), item))
    return [x for _, _, x in sorted(suggestions)]


 if __name__ == "__main__":
    import doctest
    doctest.main()
    