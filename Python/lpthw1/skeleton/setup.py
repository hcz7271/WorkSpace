try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

config = {
    'description': 'My Project',
    'author': 'My Name',
    'url': 'URL to get it at. ',
    'download_url': 'Where to download it',
    'author_email': 'My email',
    'version': '1.0',
    'test_suite' = 'nose2.collector.collector',
    'packages': ['NAME'],
    'scripts': [],
    'name': 'projectname'
}

setup(**config)
