# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.breathingcomics.com"
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-#{ENV['S3_REGION']}.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.public_path = 'tmp/'
#SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(
  fog_provider: 'Aws',
  aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  fog_directory: ENV['S3_BUCKET_NAME'],
  fog_region: ENV['S3_REGION'])

SitemapGenerator::Sitemap.create do
  add root_path
  add news_path
  add reviews_path
  add articles_path
  Article.find_each do |art|
    add page_path(art), :changefreq => 'weekly', :lastmod => art.updated_at
  end
  Tag.find_each do |tag|
    add tag_page_path(tag), :changefreq => 'weekly', :lastmod => tag.updated_at
  end

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
