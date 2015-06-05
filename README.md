# iikanji-markdown.vim

VimでMarkdownを書くためのVimプラグインです。  
`インストールするだけでいい感じに`がコンセプトです。

## インストール方法

[neobundle.vim](https://github.com/Shougo/neobundle.vim)を使っている場合、`.vimrc`に次のように書いて`:NeoBundleInstall`を実行してインストールします。

```.vimrc
NeoBundle 'violetyk/iikanji-markdown.vim'
```

## 機能

- いい感じのオートインデント設定
- いい感じのプログラミング言語をハイライトする設定
- 短縮入力
  - 例えば、インサートモードで`tl<Space>`と入力すると、`- [ ] `になります
  - `td<Space>`と入力すると、`[ ]`になります
- タスクリストのチェックをトグル
  - `- [ ] タスク` <---> `- [x] タスク`
  - カレント行やビジュアルモードで複数行選択中に`<Leader><Leader>`でトグルします
- リストをいい感じに`<Tab>`でインデント
  - 箇条書きリストは、`<Tab>`でインデント、`<Shift> + <Tab>`で逆インデントします
  - ノーマルモード/インサートモード/ビジュアル各モードでインデントできます
