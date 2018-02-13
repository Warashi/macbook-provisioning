# macbook-provisioning
homebrew を入れて ansible の環境を整える
推奨は python3 を入れて ansible 用に一つ venv 環境を作る
```
git clone https://github.com/Homebrew/brew.git $HOME/.homebrew
export PATH=$HOME/.homebrew/bin:$PATH
brew install python3
python3 -m venv ansible
. ./ansible/bin/activate
pip install ansible
```

```
ansible-playbook -i hosts -vv localhost.yml
```

App Store から入れるもの
- PopClip
- Magnet
- Todoist
- Fantastical 2
- Parcel
- Reeder
- PiPifier
- Tweetbot

そのほか自前で入れるもの
- ATOK
- Songmu/ghg
- motemen/ghq
- vim-volt/volt
- <https://github.com/mitsuse/swim>
- monochromegane/the_silver_searcher
- Karabiner-Elements
