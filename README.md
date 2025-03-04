# SmartLottery
<img width="650" alt="スクリーンショット 2023-09-29 22 12 17" src="https://github.com/OdenTakashi/SmartLottery/assets/81839214/37a0dc8a-dfbd-466e-843e-11401d84addb">

## 概要
SmartLotteryは抽選で複数人にプレゼントを送る際に発生する問題を解決する抽選を開催する人向けの抽選アプリです。<br>
応募希望者に応募フォームのURLを渡すだけで希望者を集めることができます。<br>
また、自分でGoogleフォームで申し込み用フォームを作成し締め切り時間になったらArray#sampleを使って抽選を行い当選者に連絡するのとは違い、
指定した時間に自動で抽選が行われ当選者にはあらかじめ設定したメールが送られることが特徴です。

## 技術スタック
- Devise 4.9.4
- Fly.io
- GitHub Actions
- Hotwire
- stimulus-rails 1.3.4
- turbo-rails 2.0.13
- PostgreSQL
- Ruby 3.2.7
- Ruby on Rails 8.0.1
- Rubocop 1.73.1
- Rspec 7.1.1
- Slim 5.2.1
- Slim-Lint 0.31.1
- Tailwind CSS

## URL
```
https://smartlottery.fly.dev/
```

## セットアップ
```
$ git clone https://github.com/odentakashi/SmartLottery
$ cd SmartLottery
$ bin/setup
```

## 開発環境立ち上げ
```
$ bin/dev
```

## テスト
```
$ bin/rspec
```

## Lint
次のコマンドでLintを実行します。
```
$ bin/lint
```

## ログイン
```
email: 'user1@example.com'
password: 'testtest'
```

## 環境変数の設定

| 環境変数名              | 説明                    |
| ----------------------- | ----------------------- |
| SEND_MAIL               | GMAILのアドレス         |
| GMAIL_SPECIFIC_PASSWORD | GMAILのアプリパスワード |
