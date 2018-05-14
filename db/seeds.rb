# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 26109,"612  ","6128035","ｷｮｳﾄﾌ","ｷｮｳﾄｼﾌｼﾐｸ","ﾄｷﾜﾁｮｳ","京都府","京都市伏見区","常盤町",0,0,0,0,1,5
# 28201,"670  ","6700815","ﾋｮｳｺﾞｹﾝ","ﾋﾒｼﾞｼ","ﾉｻﾞﾄﾔﾏﾄﾁｮｳ","兵庫県","姫路市","野里大和町",0,0,0,0,1,5


Yubin.create([{
    local_governments_cd: '26109',
    past_zipcode: '612  ',
    zipcode: '6128035',
    region_kana: 'ｷｮｳﾄﾌ',
    locality_kana: 'ｷｮｳﾄｼﾌｼﾐｸ',
    street_address_kana: 'ﾄｷﾜﾁｮｳ',
    region: '京都府',
    locality: '京都市伏見区',
    street_address: '常盤町',
    flag_1: 0,
    flag_2: 0,
    flag_3: 0,
    view_update: 1,
    reason: 5
  },
  {
    local_governments_cd: '28201',
    past_zipcode: '670  ',
    zipcode: '6700815',
    region_kana: 'ﾋｮｳｺﾞｹﾝ',
    locality_kana: 'ﾋﾒｼﾞｼ',
    street_address_kana: 'ﾉｻﾞﾄﾔﾏﾄﾁｮｳ',
    region: '兵庫県',
    locality: '姫路市',
    street_address: '野里大和町',
    flag_1: 0,
    flag_2: 0,
    flag_3: 0,
    view_update: 1,
    reason: 5
  }])
