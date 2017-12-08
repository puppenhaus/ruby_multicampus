#특정 폴더로 들어간다.
Dir.chdir("text") #반드시 대문자로 시작.

#폴더 내의 파일들을 확인하고 파일명을 수정한다.
files = Dir.entries(Dir.pwd)
files.each do |name|
  File.rename(name, name.gsub("new", "new_"))
end
#.reject{|name| i[0] == "."} 파일 내에 문자 삭제.
#프린트를 하려면 앞에 puts를 붙인다.
