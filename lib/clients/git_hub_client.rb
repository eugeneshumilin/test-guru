class GitHubClient

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params.to_json)
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end
end
