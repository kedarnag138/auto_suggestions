class AutoSuggestionService
  
  def initialize(query)
    @query = query
  end

  def call
    { users: users }
  end

  private

  def users
    User.where("name like ?", "%#{@query}%").map(&:name)
  end

end