# frozen_string_literal: true

class ItemQueryComponent < ViewComponent::Base
  attr_reader :query

  def initialize(query: nil)
    @query = query
  end

  def classes
    "nav-link #{is_active}"
  end

  def active?
    return params[:controller] == "queries"
  end

  private

  def is_active
    active? ? "active" : ""
  end

end
