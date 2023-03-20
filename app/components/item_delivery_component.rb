# frozen_string_literal: true

class ItemDeliveryComponent < ViewComponent::Base
  attr_reader :delivery

  def initialize(delivery: nil)
    @delivery = delivery
  end

  def classes
    "nav-link #{is_active} w-100"
  end

  def active?
    return params[:controller] == "deliveries"
  end

  private

  def is_active
    active? ? "active" : ""
  end

end
