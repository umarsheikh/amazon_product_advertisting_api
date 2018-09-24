class UsersController < ApplicationController
  before_action :authenticate_user!

  def settings
  end
  def view_invitations
    invited_users = current_user.invitations
    @accepted = invited_users.select{|t| t.invitation_accepted_at != nil}
    @unaccepted = invited_users - @accepted
  end
end
