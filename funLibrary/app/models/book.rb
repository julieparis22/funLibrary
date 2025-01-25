class Book < ApplicationRecord
  belongs_to :lector

  validates :title, presence: true
  validates :author, presence: true
  validates :is_borrowed, inclusion: { in: [true, false] }

 
  validate :date_presence_based_on_is_borrowed

  before_create :generate_uuid

  before_save :reset_date_and_lector_if_not_borrowed

  private

  def generate_uuid
    self.id ||= SecureRandom.uuid
  end


  def date_presence_based_on_is_borrowed
    if is_borrowed && date.nil?
      errors.add(:date, "doit être spécifiée si le livre est emprunté.")
    end

    if !is_borrowed && !date.nil?
      errors.add(:date, "doit être vide si le livre n'est pas emprunté.")
    end

    if is_borrowed && lector.nil?
      errors.add(:lector, "doit être associé si le livre est emprunté.")
    end
  end

  # Réinitialiser la date et supprimer l'association avec lector si 'is_borrowed' devient false
  def reset_date_and_lector_if_not_borrowed
    if !is_borrowed
      self.date = nil
      self.lector = nil
    end
  end
end
