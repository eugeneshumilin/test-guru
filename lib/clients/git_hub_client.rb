class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '90d8fcb74a775de1b35fb4115bb95470ab53c0f2'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists') do |req|
      req.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      req.headers['Content-Type'] = 'application/json'
      req.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
