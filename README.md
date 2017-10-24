# macbook-provisioning
homebrew を入れて ansible の環境を整える
推奨は pyenv-virtualenv を入れて ansible 用に一つ環境を作る
```
cd $HOME && git clone https://github.com/Homebrew/brew.git .homebrew
./.homebrew/bin/brew install pyenv-virtualenv
./.homebrew/bin/pyenv install 3.6.2
./.homebrew/bin/pyenv virtualenv 3.6.2 ansible
./.homebrew/bin/pyenv shell ansible
pip install ansible
```

```
ansible-playbook -i hosts -vv localhost.yml
```

App Store から入れるもの
- 

そのほか自前で入れるもの
- 

後、fishermanでいくつか入れる
```
fisher install paths done omf/osx omf/tab 0rax/fish-bd pyenv
```
