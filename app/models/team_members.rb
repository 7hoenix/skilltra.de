class TeamMembers < ActiveRecord::Base
  belongs_to :user
  belongs_to :team, class_name => "USER", :foreign_key => "team_id"
  validates_presence_of :user_id, :team_id

  def self.exists?(user, team)
    not find_by_user_id_and_team_id(user, team).nil?
  end

  def self.request(user, team)
    unless user == team or TeamMembers.exists?(user, team)
      transaction do
        create(:user => user, :team => team, :status => 'pending')
        create(:user => team, :team => user, :status => 'requested')
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
