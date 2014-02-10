class Admin < ActiveRecord::Base
  def to_s
    username
  end
end
