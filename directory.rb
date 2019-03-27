
def input_students
  puts "Please enter the names of the students followed by their cohort month"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.gsub(/\n/, "")
  cohort = gets.gsub(/\n/, "")
  # while the name is not empty repeat this code

  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.gsub(/\n/, "")
    cohort = gets.gsub(/\n/, "")
    if cohort.empty?
      cohort = "blank cohort"
    end
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(30)
  puts "--------------".center(30)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]}".center(30)
    puts "(#{student[:cohort]} cohort)".center(30)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#nothing happens until we call the methods

students = input_students
print_header
print(students)
print_footer(students)
