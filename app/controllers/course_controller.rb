class CourseController < ApplicationController
    def home
    end

    def score
        @user_score = nil
        unless current_user.nil?
            @user_score = Score.where(email: current_user.email).order("week ASC")
        end
    end

    def staff_summary
        @scores = Score.order("email ASC, week ASC")
    end
end
