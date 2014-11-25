class CreateJoinTableArticleTag < ActiveRecord::Migration
  def change
    create_table :articles_tags, id: false do |t|
      t.belongs_to :article
      t.belongs_to :tag
    end
    add_index(:articles_tags, [:article_id, :tag_id], :unique => true)
  end
end
