module GistsHelper
  def gist_hash(url)
    /(?<=com\/).*/.match(url)
  end
end
