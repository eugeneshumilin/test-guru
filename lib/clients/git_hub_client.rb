class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = ''

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params.to_json)
    end
  end

  private

  def setup_http_client
    Octokit::Client.new(:access_token => ACCESS_TOKEN)
  end
end
