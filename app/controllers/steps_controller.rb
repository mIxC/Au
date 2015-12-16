class StepsController < ApplicationController
  def create
    step = Step.create(room_id: params[:room_id], user: current_user, is_cross: params[:symbol] == 'x', position: params[:position])

    respond_to do |format|
      result = {ok: true, winner: step.room.check_winner}
      format.json  { render :json => result } # don't do msg.to_json
    end
  end
end
