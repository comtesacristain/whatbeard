class Recommendation < ActiveRecord::Base
  belongs_to :recommended, polymorphic: true
end
