class Beneficiary < ApplicationRecord
  validates :names, :first_surname, :second_surname, :other_address, presence: true
  validates :family_unit, length: { minimum: 1, maximum: 2 }, numericality: true, presence: true
  validates :cel_phone, length: { minimum: 8, maximum: 9 }, numericality: true, presence: true
  validates :terms_conditions, acceptance: true
  validates :email, presence: true, uniqueness: true,
    format: {
      with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      message: :invalid
    }
  validate :expiration_date_cannot_be_in_the_past_document
  validate :expiration_date_cannot_be_in_the_past_born

  has_many :deliveries, dependent: :destroy

  before_save :downcase_attributes

  private

  def downcase_attributes
    self.email = email.downcase
  end

  def expiration_date_cannot_be_in_the_past_document
    if expiration_date_document.present? && expiration_date_document <= Date.today
      errors.add(:expiration_date_document)
    end
  end

  def expiration_date_cannot_be_in_the_past_born
    if born.present? && born >= Date.today
      errors.add(:born)
    end
  end
end
