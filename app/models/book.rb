class Book < ApplicationRecord
    # Validation des attributs
    validates :title, presence: true
    validates :author, presence: true
    validates :is_borrowed, inclusion: { in: [true, false] }
  
    # Générer un UUID avant la création d'un livre
    before_create :generate_uuid
  
    private
  
    # Méthode pour générer un UUID si un UUID n'est pas déjà défini
    def generate_uuid
      self.id ||= SecureRandom.uuid
    end
  end
  