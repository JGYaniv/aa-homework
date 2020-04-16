# == Schema Information
#
# Table name: people
#
#  id       :bigint           not null, primary key
#  name     :string           not null
#  house_id :integer
#
class Person < ApplicationRecord
    validates :name, presence: true

    belongs_to :home,
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :House
end
