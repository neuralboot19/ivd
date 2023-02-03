class Delivery < ApplicationRecord
  validates :kg, length: { minimum: 1, maximum: 4 }, numericality: true, presence: true
  validate :greater_than

  belongs_to :beneficiary

  private

  def greater_than
    errors.add(:kg) if kg == "0.0" || kg == "0"
  end
end
