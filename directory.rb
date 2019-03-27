
def input_students
  puts "Please enter the names of the students followed by their cohort month"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  cohort = gets.chomp
  # while the name is not empty repeat this code

  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    cohort = gets.chomp
    if cohort.empty?
      cohort = "no cohort was entered"
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
