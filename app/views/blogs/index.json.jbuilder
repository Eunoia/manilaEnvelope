json.array!(@blogs) do |blog|
  json.extract! blog, :title, :body, :name, :language, :belongs_to
  json.url blog_url(blog, format: :json)
end
