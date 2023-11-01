class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :content, presence: true, length: { maximum: 255 }

  def is_goal?
    self.is_goal == true
  end

  def is_task?
    self.is_goal == false
  end

  def toggle_checked!(current_user, selected_image)
    update!(checked: !checked)
    handle_flower_image(current_user, selected_image) if checked
  end

  private

  def handle_flower_image(current_user, selected_image)
    flower_image = FlowerImage.find_by(flower_url: selected_image)
    if flower_image
      @user_flower_image = UserFlowerImage.find_or_create_by(user: current_user, flower_image_id: flower_image.id)
      @user_flower_image.update(unlocked: true)
    end
  end
end
