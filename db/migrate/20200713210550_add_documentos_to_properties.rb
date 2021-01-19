class AddDocumentosToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :documentos, :json
  end
end
