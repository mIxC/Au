class Room < ActiveRecord::Base

  belongs_to :first_user, class_name: "User"
  belongs_to :second_user, class_name: "User"
  has_many :steps

  def link_empty_game
    if self.second_user == nil
      '/game/'+ self.id.to_s
    else
      '/game-finished'
    end
  end
  def check_winner
    winner = nil
    self.steps.each do |step|
      #winner = 'x'
    end
    winner
  end
end
