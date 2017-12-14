get 'usercomplete' do
  @email = params[:email]
  @pwd = params[:pwd]
  @pwd2 = params[:pwd2]
  #비밀번호 두개가 같으면 완료
  if @pwd == @pwd2
    erb :usercomplete
  else
end
