#-----------------------------------------------------------------------------
#
# Sphinx configuration for BrookEngine project
#
#-----------------------------------------------------------------------------

project = u'BrookEngine'
#copyright = u'...'

release = '0.0.0'
version = '0.0'

#-----------------------------------------------------------------------------

# minimal Sphinx version
#needs_sphinx = '1.0'

extensions = ['sphinx.ext.autodoc', 'sphinx.ext.todo']

master_doc = 'index'
source_suffix = '.rst'
exclude_trees = ['html', 'man']

#-----------------------------------------------------------------------------
# HTML output
#-----------------------------------------------------------------------------

html_theme = 'poole'
html_theme_path = ['themes']

pygments_style = 'sphinx'

#html_static_path = ['static']

#-----------------------------------------------------------------------------
# TROFF/man output
#-----------------------------------------------------------------------------

man_pages = [
    ('manpages/client', 'brook', 'BrookEngine client',
     [], 1),
    ('manpages/daemon', 'brookengine', 'BrookEngine daemon',
     [], 8),
]

#man_show_urls = False

#-----------------------------------------------------------------------------
# vim:ft=python
