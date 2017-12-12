Dir.chdir("files")

# 30개의 파일을 만듭니다.
30.times do |n|
	n+=1
	File.open(n.to_s + ".txt", "w") do |file|
		file.write(n.to_s + "번째 내용입니다.")
	end
end
# 1.txt ~ 30.txt
# 1.txt => 1번째 내용
# 30.txt => 30번째 내용
