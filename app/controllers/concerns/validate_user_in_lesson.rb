module ValidateUserInLesson

  def is_student_in_lesson(enrolled_student, lesson_id)
    lesson = Lesson.find_by(id: lesson_id)
    is_user_valid = verify_user(enrolled_student, lesson)
    return is_user_valid
  end

  def verify_user(enrolled_student, lesson)
    if lesson.enrolled_students.find_by(id: enrolled_student.id).nil?
      false
    else
      true
    end
  end

  def uuid_is_valid(uuid)
    if Student.find_by(uuid: uuid).nil?
      false
    else
      true
    end
  end

end
