class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :content, null: false, default: "Message!"
      t.timestamps
    end
  end
end
