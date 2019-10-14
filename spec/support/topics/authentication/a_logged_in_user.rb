class ALoggedInUser < Actor
  def self.who_is(other_actor_role)
    user = create(:user)
    login_as(user)

    other_actor_role.user = user
    other_actor_role
  end
end