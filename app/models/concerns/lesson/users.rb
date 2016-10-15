module Lesson::Users
  extend ActiveSupport::Concern
  included do
    def available_users
      User.all
    end
  end
end
