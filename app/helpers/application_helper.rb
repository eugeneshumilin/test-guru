module ApplicationHelper

  FLASH_TYPE = { alert: 'danger', notice: 'primary' }.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_selector(type)
    FLASH_TYPE[type.to_sym] || type
  end
end
