class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    set_student
  end

  def activate
    set_student
    Student.update(@student.id, :active => !@student.active)
    redirect_to show_student_path
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
