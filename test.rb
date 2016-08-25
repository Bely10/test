
name = ARGV[0]

if name == nil
  name = "Таинственная персона"
end

puts "Добрый день, #{name}! Ответьте на вопросы."

#Инструкции За каждый ответ «да» поставьте себе 2 балла, за ответ «нет» — 0 баллов, за ответ «иногда» — 1 балл.
#Затем суммируйте все баллы и сравните полученный результат со шкалой.

questions = []

results = []

if File.exist?('./data/questions.txt') # Проверяем, есть ли файл
  f = File.new('./data/questions.txt', "r:UTF-8") # открываем файл, явно указывая его кодировку
  questions = f.readlines   # читаем все строки в массив
  f.close # закрываем файл
else
  puts 'questions не найдены'
end

if File.exist?('./data/results.txt') # Проверяем, есть ли файл
  f = File.new('./data/results.txt', "r:UTF-8") # открываем файл, явно указывая его кодировку
  results = f.readlines   # читаем все строки в массив
  f.close # закрываем файл
else
  puts 'results не найдены'
end

yes_answers = 0

for item in questions do
  puts item

  user_input = nil

  while (user_input != "yes" && user_input != "sometimes" && user_input != "no")
    puts "Введите yes, sometimes или no и нажмите Ввод"
    user_input = STDIN.gets.chomp.downcase # Yes NO
  end

  if (user_input == "yes")
    yes_answers += 2
  elsif (user_input == "sometimes")
    yes_answers += 1
  end
end

puts "\n #{name}"

puts "\nВаш результат теста (ответов да - #{yes_answers}"

if (yes_answers >= 30)
    puts results[0]
elsif (yes_answers >= 25)
    puts results[1]
elsif (yes_answers >= 19)
    puts results[2]
elsif (yes_answers >= 14)
    puts results[3]
elsif (yes_answers >= 9)
    puts results[4]
elsif (yes_answers >= 4)
    puts results[5]
elsif (yes_answers <= 3)
    puts results[6]
end