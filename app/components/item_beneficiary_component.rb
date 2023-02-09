# frozen_string_literal: true

class ItemBeneficiaryComponent < ViewComponent::Base
  attr_reader :beneficiary

  def initialize(beneficiary: nil)
    @beneficiary = beneficiary
  end

  def classes
    "nav-link #{is_active}"
  end

  def active?
    return params[:controller] == "beneficiaries"
  end

  private

  def is_active
    active? ? "active" : ""
  end

end
