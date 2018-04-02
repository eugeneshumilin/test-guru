class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '672327d88a336a109b74bd628da59943c71e2486'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params.to_json)
  end

  private

  def setup_http_client
    Octokit::Client.new(:access_token => ACCESS_TOKEN)
  end
end
