@students = []

def input_students()
  puts "Please enter the name of the students"
  puts "To finish, hit return twice or type 'stop' "

  name = " "
  cohort = " "

  while !name.empty? do
    print "Enter name and cohort (comma seperated): "
    input = gets.chomp

    if input ==  "" || input.downcase == "stop"
      break
    end

    values = input.split(",")

    name = values[0]
    cohort = values[1]

    @students << {name: name, cohort: cohort.to_sym}
    puts "We now have #{@students.count} students"
  end
end

def print_header()
  puts "----------------------------------------"
  puts "The students of Villains Academy"
  puts "----------------------------------------"
end

def print_students()
  @students.each_with_index do |student, index|
    puts (index + 1).to_s.ljust(5) + (student[:name]).ljust(20) + (student[:cohort].to_s + " cohort")
  end 
end

def print_footer()
  puts "----------------------------------------"
  puts "Overall, we have #{@students.count} great students"
  puts "----------------------------------------"
end

def print_with_first_letter(letter)
  names = @students.select { |student| student[:name][0] == letter }

  names.each_with_index do |name, index|
    puts (index + 1).to_s.ljust(5) + (name[:name]).ljust(20) + (name[:cohort].to_s + " cohort")
  end
end

def print_menu()
  puts "1. Input Students"
  puts "2. Show Students"
  puts "3. Save Students"
  puts "4. Load Students"
  puts "9. Exit"
end

def show_students()
  print_header()
  print_students()
  print_footer()
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit 
  else
    puts "Did Not Recognise That Option!"
  end
end 

def save_students()

  file = File.open("students.csv", "w")

  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end

  file.close
end

def load_students
  file = File.open("students.csv", "r")

  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end

  file.close
end

def menu()
  loop do
    print_menu

    print "Enter Option: "
    selection = gets.chomp

    process(selection)
  end
end

menu()