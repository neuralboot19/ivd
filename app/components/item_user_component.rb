# frozen_string_literal: true

class ItemUserComponent < ViewComponent::Base
  attr_reader :user

  def initialize(user: nil)
    @user = user
  end

  def classes
    "nav-link #{is_active} w-100"
  end

  def active?
    return params[:controller] == "users"
  end

  private

  def is_active
    active? ? "active" : ""
  end

end
