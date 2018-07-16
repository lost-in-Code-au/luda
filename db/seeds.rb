
HOME_GROUP_TITLES = 10.times.map{ Faker::StarWars.call_squadron }

HOME_GROUP_TITLES.each do | title |
    user = User.create(name: Faker::StarWars.character, email: Faker::Internet.email, password: '123456') 
    user.save
    HomeGroup.create(title: title, user: user)
end

HOME_GROUPS  = HomeGroup.all

HOME_GROUPS.each do | home_group |
    students = 10.times.map{ Faker::StarWars.character }
    students.each do | student |
     newStudent = Student.create(name: student, student_id: Faker::IDNumber.valid, home_group: home_group)   
     newStudent.save
    #  puts newStudent.home_group
    end
end