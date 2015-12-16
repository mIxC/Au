class Room < ActiveRecord::Base

  belongs_to :first_user, class_name: "User"
  belongs_to :second_user, class_name: "User"
  has_many :steps

  def step_by_position(pos)
    self.steps.find_by_position(pos)
  end

  def link_empty_game
    if self.second_user == nil
      '/game/'+ self.id.to_s
    else
      '/game-finished'
    end
  end
  def check_winner
    winner = nil
    pole = [[self.step_by_position(0),self.step_by_position(1),self.step_by_position(2)],
            [self.step_by_position(3),self.step_by_position(4),self.step_by_position(5)],
            [self.step_by_position(6),self.step_by_position(7),self.step_by_position(8)]
             ]

    pole.each do |row|
      last = nil
      k = 0
      row.each do |step|


        if step && (last == step.is_cross || last.nil?)
          k += 1

        end

        if step
          last = step.is_cross
        end
      end
      if k == 3
        winner = row[1].user
        break
      end




      #winner = 'x'
    end
    winner
  end
end

