# 폴더는 files
Dir.chdir("files")
# 30개를 만들어주세요
30.times do |n|
	n+=1
	File.open(n.to_s + ".txt", "a+") do |file|
		file.write("좋은아침입니다.")
	end
end
# 파일 제폭은 1.txt 2.txt
# 파일 내용에 좋은 아침입니다.

