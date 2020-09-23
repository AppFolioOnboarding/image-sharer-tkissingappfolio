class AddImageRefToFeedback < ActiveRecord::Migration[5.2]
  def change
    add_reference :feedbacks, :images, foreign_key: true
  end
end
