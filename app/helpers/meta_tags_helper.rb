module MetaTagsHelper
  def default_meta_tags
    {
      site: 'SmartLottery',
      title: 'SmartLottery',
      reverse: true,
      charset: 'utf-8',
      description: 'あなたの抽選会をもっとラクにしてくれるツール',
      canonical: 'https://smartlottery.fly.dev/',
      separator: '|',
      og: {
        site_name: 'SmartLottery',
        title: 'SmartLottery',
        description: 'あなたの抽選会をもっとラクにしてくれるツール',
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
end
