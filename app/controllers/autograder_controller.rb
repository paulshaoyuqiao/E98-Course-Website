class AutograderController < ApplicationController
    def import
        code_file = params[:file]
        script_path = code_file.path
        output = `ls`
        load script_path
        value = `ruby -r "./E98/execute.rb" -e "Exec.run_all_test '#{script_path}'"`
        @result_array_disp = value.split("\n")
        @file_name = code_file.original_filename
    end

end
