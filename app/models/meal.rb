class Meal < ApplicationRecord
  has_many :meal_foods
  has_many :foods, through: :meal_foods

  # Q1 答案
  def self.no_food_meal
    Meal.left_outer_joins(:foods).where(meal_foods: {food_id: nil})
  end
end

=begin
Q2 答案
select foods.name, count(*) as count FROM meal_foods 
inner join foods on meal_foods.food_id = foods.id 
group by foods.id order by count DESC;

Q3 答案
select ff.name, group_concat(gg.name) from meal_foods a 
inner join meal_foods b on a.meal_id = b.meal_id 
      and a.food_id <> b.food_id 
inner join foods ff on a.food_id = ff.id 
inner join foods gg on b.food_id = gg.id 
group by ff.name;
"""
=end