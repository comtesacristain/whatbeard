require 'mechanize'


class Scraper
  LOGIN = {url: nil,action: nil}
  
  def initialize
    @agent = Mechanize.new
  end
  
  
  def credentials
  end

  def login
    @agent.get(self.class::LOGIN[:url])
    @agent.page.forms
    form = @agent.page.form_with(action:self.class::LOGIN[:action])
    form.field_with(:name=>"username").value=credentials["username"]
    form.field_with(:name=>"password").value=credentials["password"]
    form.submit
  end

  
  private
  def login_items
    return
  end
end
