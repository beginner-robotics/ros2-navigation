# ビギナーロボティクス
# Ros2 Navigationを動かしてみよう！

[ビギナーロボティクス](https://www.amazon.co.jp/dp/B0B6RTPKRY)第３章の教材です。
第２章までに学んだロボットの移動知能について、実際に手を動かしながら理解を深めることを目的としています。

教材としてはROS2のnavigation2の[turtlebot3を使ったチュートリアル](https://navigation.ros.org/getting_started/index.html)をそのまま使います。

周りに質問できるような人がいない初学者の方々にとっては、このチュートリアルを実行するための環境を整えることも一苦労だと思います。初期段階でのそのような労力を極力なくし、スムーズにロボットを動かす体験をすることによって、ロボットの分野への参入障壁を下げることを目的としています。

できるだけ多くの方々にチュートリアルを体験していただくために、本リポジトリはWindowsとLinux (ubuntuを想定しています) の両方に対応するように作成してあります。

なお、本リポジトリはデータ通信量が限られているため、READMEに説明画像は極力用いないようにしてあります。画像を用いた説明はビギナーロボティクスに記載しているので、もしよろしければ覗いてみてください。

※PCのスペックによっては、チュートリアルが動作しない、もしくはものすごく重い動作をする可能性があります。予めご了承ください。

## Windows向け
### 環境セットアップ

※1~4のインストールのプロセスは全て規定値（何も設定を変えずにnextやyesなど押せばOK）でインストールしてください。

#### 1 Linuxカーネルのインストール
[ダウンロードページ](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)よりダウンロード後、ファイル（wsl_update_x64.msi）を実行、インストールしてください。

#### 2 docker for windows のインストール
[ダウンロードページ](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe)よりダウンロード後、ファイル（Installer.exe）を実行、インストールしてください。

※Windows Homeをお使いの方はdockerのインストール手順が異なるようです。[home向けのインストールページ](https://docs.docker.jp/docker-for-windows/install-windows-home.html)を参照してください。

#### 3 git のインストール
[ダウンロードページ](https://git-scm.com/download/win)よりダウンロード(多くの方は64-bit Git for Windows Setupだと思います)後、ファイルを実行、インストールしてください。

#### 4 VcXsrv のインストール
[ダウンロードページ](https://sourceforge.net/projects/vcxsrv/)よりダウンロード後、ファイルを実行、インストールしてください。

#### 5 Hyper-Vの有効化
windowsのスタートの検索窓で”windowsの機能の有効化または無効化”を検索し、選択。その後設定画面でHyper-Vにチェックを入れてください。


#### 6 Power Shellの設定変更
windowsのスタートの検索窓で”Windows Power Shell”を検索。<b>管理者として実行</b>を選択。
画面起動後、

```
Set-ExecutionPolicy RemoteSigned
```

を打ち込み、Enterを押してください。

```
実行ポリシーの変更
実行ポリシーは、信頼されていないスクリプトからの保護に役立ちます。実行ポリシーを変更すると、about_Execution_Policies
のヘルプ トピック (https://go.microsoft.com/fwlink/?LinkID=135170)
で説明されているセキュリティ上の危険にさらされる可能性があります。実行ポリシーを変更しますか?
[Y] はい(Y)  [A] すべて続行(A)  [N] いいえ(N)  [L] すべて無視(L)  [S] 中断(S)  [?] ヘルプ (既定値は "N"):
```
と出てくるので、Yを打ち込んでください。

#### 7 再起動
以上でセットアップは完了です！お疲れさまでした。
再起動して、諸々の変更を反映させましょう。

### ロボットのシミュレーションの実行

#### 1 dockerの起動
windowsの検索窓で"Docker Desktop"を検索、実行してください。

#### 2 x-launchの起動
windowsの検索窓で"XLaunch"を検索、実行してください。
1. Display Settings：次へ
2. Client Startup　：次へ
3. Extra Settings　：Disable access controlにチェック、一番下の窓（Additional...）に "-nowgl"を入力（-nowglだけ入力してください、""は必要ないです）。
4. Configuration complete：完了

#### 3 PowerShellを起動
windowsのスタートの検索窓で”Windows Power Shell”を検索。<b>管理者として実行</b>を選択。

<b>初回起動時</b>

任意の場所で

```
git clone https://github.com/beginner-robotics/ros2-navigation.git 
cd ros2-navigation/docker
./build_image_on_windows.ps1
./run_on_windows.ps1
sed -i 's/\r//' run_simulation.sh
```

<b>二回目以降</b>
```
cd ros2-navigation/docker
./run_on_windows.ps1
```

#### 4 シミュレーションの実行
3終了後、同じ画面で
```
./run_simulation
```

これでしばらく待つと、Rvizとgazeboが立ち上がります。
Rvizは比較的早く立ち上がりますが、gazeboは読み込みに時間がかかる（長いと5分-10分くらいかかる場合もある）ので気長に待ってみてください。

シミュレーションが起動したら、あなたはもうロボット研究者やロボットエンジニアの入口に立っています。ビギナーロボティクスの３章に従って、実践勉強していきましょう！


## Linux (ubuntu) 向け

### 環境セットアップ
#### dockerのインストール
[公式ページ](https://docs.docker.com/engine/install/ubuntu/)にしたがってインストールしてください。一応書き下しておきます。

```
$ sudo apt-get update
$ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

$ sudo mkdir -p /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg 
$ sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```
下記を打ち込み"Hello from Docker!"が表示されれば成功です。
```
$ sudo docker run hello-world
```

続いて、下記の<your_username>にあなたのユーザー名を入れて実行してください。
```
$ sudo usermod -aG docker <your_username>
```

#### gitのインストール
```
$ sudo apt-get update
$ sudo apt-get install git
```

#### 再起動
設定はこれで完了です。念のため再起動しておきましょう！

#### インストール確認
下記で何かしらのバージョンがそれぞれ表示されればここまでの手順はＯＫです。

```
$ docker --version
$ git --version
```

### ロボットのシミュレーションの実行

#### 本リポジトリのクローン

任意の場所で
```
$ git clone https://github.com/beginner-robotics/ros2-navigation.git
```

#### docker imageのビルド（初回のみ）

```
$ cd ros2-navigation/docker
$ ./build_image_on_ubuntu.sh
```

#### シミュレーションの起動

```
$ cd ros2-navigation/docker
$ ./run_on_ubuntu.sh
$ ./run_simulation.sh
```

これでしばらく待つと、Rvizとgazeboが立ち上がります。
Rvizは比較的早く立ち上がりますが、gazeboは読み込みに時間がかかる（長いと5分-10分くらいかかる場合もある）ので気長に待ってみてください。

シミュレーションが起動したら、あなたはもうロボット研究者やロボットエンジニアの入口に立っています。ビギナーロボティクスの３章に従って、実践勉強していきましょう！