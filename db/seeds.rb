# -*- coding: utf-8 -*-
Faalis::Engine.load_seed
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

radio_boot = SiteFramework::Site.create!(title: 'رادیو بوت',
  description: 'پادکست رادیو بوت، به بهانه تکنولوژی',
  default_template: 'radio_boot')

SiteFramework::Domain.create!(site: radio_boot,
  name:'radioboot.com', alias: 'www.radioboot.com')


tech5 = SiteFramework::Site.create!(title: 'Tech5',
  description: 'پادکست تک فایو کار مشترکی از سلام دنیا و رادیو بوت',
  default_template: 'tech5')

SiteFramework::Domain.create!(site: tech5,
  name:'tech5.ir',
  alias: 'www.tech5.ir')


ciwic = SiteFramework::Site.create!(title: 'شرکت بین المللی کاسپین ایده ویرا',
  description: 'بزرگترین توزیع کننده انواع کالا و محصولات داخلی و خارجی، در حوزه های گوناگون بازرگانی و فروش',
  default_template: 'canvas')

SiteFramework::Domain.create!(site: ciwic,
  name: 'ciwic.local')
