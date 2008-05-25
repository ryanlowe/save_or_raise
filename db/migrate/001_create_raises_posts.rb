class CreateRaisesPosts < ActiveRecord::Migration
  def self.up
    create_table :raises_posts do |t|
      t.string :title
      t.text   :body
    end
  end

  def self.down
    drop_table :raises_posts
  end
end
