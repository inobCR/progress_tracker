# Haml understands various config options that affect its performance & output.
# In Rails, options can be set by setting the Haml::Template.options hash:

Haml::Template.options[:format] = :html5

# You can also set them by passing an options hash to Haml::Engine#initialize.
# For the complete list of available options, please see the link:
# http://haml.info/docs/yardoc/Haml/Options.html
