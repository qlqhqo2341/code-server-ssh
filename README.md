# code-server-ssh
- codercom/code-server 이미지에 ssh 서버를 열어 vs code 리모트 ssh 접속도 가능한 컨테이너
- authorized_keys와 user를 잘 지정해서 별도 설정 없이 바로 접속할 수 있도록 설정함
- local_test.sh가 고정된 비밀번호를 설정하므로 주의

### TODO
- [ ] 아마 컨테이너 만들때마다 호스트키가 달라져서 컨테이너 다시 만들면 warning이 뜰거임. hostKey 마운트가 필요할 듯
