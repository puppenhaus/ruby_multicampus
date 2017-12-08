#text파일로 들어간다.

Dir.chdir("text")

#파일을 만든다./열어서 입력을 한다.
20.times do |i|
  i = i+1
  File.open("newfile#{i}.txt", "w+") do |file| #또는 file.new//#{i} 또는 +i+
    file.write("Hello World")
  end
end
