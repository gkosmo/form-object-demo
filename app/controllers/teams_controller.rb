class TeamsController < ApplicationController
  def new
    team = Team.new
    team.players.build
    @form = TeamForm.new(team)
  end

  def create
    team = Team.new
    @form = TeamForm.new(team)

    if @form.validate(team_params)
      @form.save
      redirect_to teams_path
    else
      render :new
    end

  end

  private

  def team_params
    params.require(:team).permit(:name, :coach, :nationality, players_attributes: [:first_name, :last_name, :nationality])
  end
end
