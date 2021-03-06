require "digest/md5"

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###
helpers do
  def github_url(user_id)
    "https://github.com/#{user_id}"
  end

  def facebook_url(user_name)
    "https://www.facebook.com/#{user_name}"
  end

  def gravatar_url(user_email)
    md5_hash = Digest::MD5.hexdigest(user_email.downcase)
    "https://secure.gravatar.com/avatar/#{md5_hash}?s=64"
  end
end

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'images'

activate :google_analytics do |ga|
  ga.tracking_id = "UA-56928192-1"
  ga.domain_name = "dev.codeforhakodate.org"
  ga.minify = false
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.remote = 'git@github.com:codeforhakodate/dev.codeforhakodate.org.git'
end
# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
