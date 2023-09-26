# frozen_string_literal: true

module MetaTagsHelper
  # rubocop:disable Metrics/MethodLength
  def default_meta_tags
    {
      site: 'SmartLottery',
      title: 'SmartLottery',
      reverse: true,
      charset: 'utf-8',
      description: 'あなたの抽選会をもっとラクに ! 応募から抽選、当選メール送信までこのアプリ一つで行えます。',
      keywords: '抽選 抽選会 当選 当選メール プレゼント lottery Lottery raffle Raffle present Present',
      canonical: 'https://smartlottery.fly.dev/',
      separator: '|',
      og: {
        site_name: 'SmartLottery',
        title: 'SmartLottery',
        description: 'あなたの抽選会をもっとラクに ! 応募から抽選、当選メール送信までこのアプリ一つで行えます。',
        type: 'website',
        url: 'https://smartlottery.fly.dev/',
        image: image_url('logo_ogp.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@odentakashi'
      }
    }
  end
  # rubocop:enable Metrics/MethodLength
end
