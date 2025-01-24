class Book < ApplicationRecord
  # Validation des attributs
  validates :title, presence: true
  validates :author, presence: true
  validates :is_borrowed, inclusion: { in: [true, false] }

  # Validation personnalisée pour 'date'
  validate :date_presence_based_on_is_borrowed

  # Générer un UUID avant la création d'un livre
  before_create :generate_uuid

  # Réinitialiser la date si 'is_borrowed' est repassé à false
  before_save :reset_date_if_not_borrowed

  private

  # Méthode pour générer un UUID si un UUID n'est pas déjà défini
  def generate_uuid
    self.id ||= SecureRandom.uuid
  end

  # Validation personnalisée
  def date_presence_based_on_is_borrowed
    if is_borrowed && date.nil?
      errors.add(:date, "doit être spécifiée si le livre est emprunté.")
    end

    if !is_borrowed && !date.nil?
      errors.add(:date, "doit être vide si le livre n'est pas emprunté.")
    end
  end

  # Réinitialiser la date si 'is_borrowed' est repassé à false
  def reset_date_if_not_borrowed
    self.date = nil unless is_borrowed
  end
end
