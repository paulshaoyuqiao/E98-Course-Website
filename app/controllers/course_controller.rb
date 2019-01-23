class CourseController < ApplicationController
    def home
    end

    def score
        @user_score = nil
        unless current_user.nil?
            @user_score = Score.where(email: current_user.email)
        end
    end

    def staff_summary
        @scores = Score.all
    end
end
