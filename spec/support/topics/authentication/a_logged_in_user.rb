class ALoggedInUser < Actor
  def self.who_is(other_actor_role)
    user = create(:user)
    login_as(user)

    # just return the other role for now
    # as it doesnt need the user
    other_actor_role
  end
end