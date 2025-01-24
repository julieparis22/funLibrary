class RemoveObsoleteBooks < ActiveRecord::Migration[6.0]
  def up
    # Supprimer les livres avec un UUID spécifique ou invalide
    Book.where(id: ["20f84897-fab0-4c0e-ab82-139491120888", "another-obsolete-uuid"]).destroy_all
   
  end

  def down
    # Si vous avez besoin de restaurer les livres supprimés, vous pouvez gérer cela ici (si vous le souhaitez)
  end
end
