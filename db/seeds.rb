# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sites = {
  day1: [
    {
      name: "台北市立美術館",
      stay_time: 20,
      type: "景點",
      lat: 25.07261585329631,
      lng: 121.52475655161953,
    },
    {
      name: "華山1914文化創意產業園區",
      stay_time: 65,
      type: "景點",
      lat: 25.044244740152156,
      lng: 121.52932610929034,
    },
    {
      name: "饒河街觀光夜市",
      stay_time: 100,
      type: "餐廳",
      lat: 25.05108758917027,
      lng: 121.57745638045473,
    },
  ],
  day2: [
    {
      name: "國立故宮博物院",
      stay_time: 10,
      type: "景點",
      lat: 25.102512574287264,
      lng: 121.54849837133887,
    },
    {
      name: "北投溫泉區",
      stay_time: 38,
      type: "景點",
      lat: 25.13671194396663,
      lng: 121.50716520347267,
    },
    {
      name: "台北101觀景台",
      stay_time: 73,
      type: "景點",
      lat: 25.034287433437417,
      lng: 121.5640104669617,
    },
  ],
}

sites2 = {
  day1: [
    {
      name: "國立故宮博物院",
      stay_time: 20,
      type: "景點",
      lat: 25.102512574287264,
      lng: 121.54849837133887,
    },
    {
      name: "臺北101",
      stay_time: 30,
      type: "夜景",
      lat: 25.034287433437417,
      lng: 121.5640104669617,
    },
  ],
  day2: [
    {
      name: "陽明山國家公園",
      stay_time: 20,
      type: "景點",
      lat: 25.194498590641256,
      lng: 121.56089338045958,
    },
    {
      name: "北投區溫泉博物館",
      stay_time: 25,
      type: "溫泉",
      lat: 25.13671194396663,
      lng: 121.50716520347267,
    },
    {
      name: "士林官邸",
      stay_time: 35,
      type: "景點",
      lat: 25.093396983931115,
      lng: 121.53232659816169,
    },
  ],
  day3: [
    {
      name: "象山",
      stay_time: 15,
      type: "戶外",
      lat: 25.02742219851901,
      lng: 121.57654284502128,
    },
    {
      name: "中正紀念堂",
      stay_time: 40,
      type: "景點",
      lat: 25.035774267485415,
      lng: 121.5202357215834,
    },
  ],
}

categories = %w[自然 文化 美食 冒險 休閒 浪漫 音樂 藝術]

10.times do
  Plan.create!(
    name: "臺北城市文化探險之旅",
    description:
      "這個兩天的行程將帶你遊覽臺北市的文化、美食、自然和現代化等多個方面。第一天，您將參觀台灣藝術家的作品，探索熱鬧的藝文場所，品嚐當地美食。第二天，您將欣賞中國古代文物和藝術品，放鬆身心，欣賞城市全景。這個行程適合喜歡城市探險和文化體驗的旅行者。",
    days: 2,
    locations: sites,
    user_id: 17,
    public: true,
    category: categories.sample,
  )

  Plan.create!(
    name: "臺北城市自然和現代化之旅",
    description:
      "這個三天的行程將帶你遊覽臺北市的文化、美食、自然和現代化等多個方面。第一天，您將欣賞中國古代藝術品、探索著名的夜市、欣賞現代化建築的壯觀。第二天，您將欣賞壯麗的自然風光、探索台灣溫泉的歷史和文化。",
    days: 3,
    locations: sites2,
    user_id: 17,
    public: true,
    category: categories.sample,
  )
end
