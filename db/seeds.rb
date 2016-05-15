# -*- coding: utf-8 -*-
Faalis::Engine.load_seed
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless Rails.env.production?
  category = SiteCategory.create!(name: 'عمومی')
  user     = Faalis::User.find_by(email: 'admin@example.com')

  ns = Namespace.create(name: 'yellowen', user: user)

  radio_boot = SiteFramework::Site.create!(title: 'رادیو بوت',
    description: 'پادکست رادیو بوت، به بهانه تکنولوژی',
    default_template: 'soprano',
    site_category: category)

  SiteFramework::Domain.create!(site: radio_boot,
    name:'radioboot.local',
    namespace: ns,
    user: user,
    alias: true)

  SiteFramework::Domain.create!(site: radio_boot,
    name:'radioboot',
    namespace: ns,
    user: user,
    alias: false)


  ciwic = SiteFramework::Site.create!(title: 'شرکت بین المللی کاسپین ایده ویرا',
    description: 'بزرگترین توزیع کننده انواع کالا و محصولات داخلی و خارجی، در حوزه های گوناگون بازرگانی و فروش',
    default_template: 'canvas',
    site_category: category)

  SiteFramework::Domain.create!(site: ciwic,
    name: 'ciwic.faalis.io',
    alias: true,
    namespace: ns,
    user: user)

  SiteFramework::Domain.create!(site: ciwic,
    name: 'ciwic',
    alias: false,
    namespace: ns,
    user: user)


end
