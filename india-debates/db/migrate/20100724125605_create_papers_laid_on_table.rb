class CreatePapersLaidOnTable < ActiveRecord::Migration
  def self.up
    create_table :papers, :force => true do |t|
      t.string  :text
      t.string  :submitted_by
      t.date  :submitted_on
      t.timestamps
    end
  end

  def self.down
    drop_table :papers
  end
end