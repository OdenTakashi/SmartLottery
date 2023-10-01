# SmartLottery
<img width="650" alt="スクリーンショット 2023-09-29 22 12 17" src="https://github.com/OdenTakashi/SmartLottery/assets/81839214/a129d6ed-1f05-4337-b998-2e2d4c07d942">

## 概要
SmartLotteryは抽選で複数人にプレゼントを送る際に発生する問題を解決する抽選を開催する人向けの抽選アプリです。<br>
応募希望者に応募フォームのURLを渡すだけで希望者を集めることができます。<br>
また、自分でGoogleフォームで申し込み用フォームを作成し締め切り時間になったらArray#sampleを使って抽選を行い当選者に連絡するのとは違い、
指定した時間に自動で抽選が行われ当選者にはあらかじめ設定したメールが送られることが特徴です。

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
