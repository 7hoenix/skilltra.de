class TeamMember < ActiveRecord::Base
  belongs_to :team
  belongs_to :user

  def self.exists?(user, team)
    not find_by_user_id_and_team_id(user, team).nil?
  end

  def self.request(user, team)
    unless user == team or TeamMember.exists?(user, team)
      transaction do
        create(:user_id => user.id, :team_id => team.id, :status => 'pending')
        create(:user_id => team.id, :team_id => user.id, :status => 'requested')
      end
    end
  end

  def self.accept(user, team)
    transaction do
      accepted_at = Time.now
      accept_one_side(user, team, accepted_at)
      accept_one_side(team, user, accepted_at)
    end
  end

  def self.breakup(user, team)
    transaction do
      destroy(find_by_user_id_and_team_id(user, team))
      destroy(find_by_user_id_and_team_id(team, user))
    end
  end

private

  def self.accept_one_side(user, team, accepted_at)
    request = find_by_user_id_and_team_id(user, team)
    request.status = 'accepted'
    request.accepted_at = accepted_at
    request.save!
  end

end
