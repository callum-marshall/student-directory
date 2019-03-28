@students = []

def try_load_students
  puts "Please enter filename to load"
  filename = gets.chomp
  load_students(filename)
end

def interactive_menu
  loop do
    print_menu
    menu_input(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def menu_input(selection)
  case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students
    when "9" then exit
    else puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_student(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def add_student(name)
  @students << {name: name, cohort: :november}
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(30)
  puts "--------------".center(30)
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(30)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Tell me in which file to save:"
  filename = gets.chomp
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Saved #{@students.count} students to '#{filename}'"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  add_student(name)
  end
  file.close
  puts "Loaded #{@students.count} students from '#{filename}'"
end

try_load_students
interactive_menu
