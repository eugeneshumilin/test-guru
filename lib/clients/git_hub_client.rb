class GitHubClient

  ACCESS_TOKEN = '47177992f66c0db40943e2bd3f448988504c8459'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params.to_json)
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
