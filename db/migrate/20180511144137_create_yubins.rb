class CreateYubins < ActiveRecord::Migration[5.2]
  def change
    # マスターを毎回delete&insertするのでIDのオーバーフローを考えなくてもいいようにIDカラムは作らない
    create_table :yubins, :id => false do |t|
      t.string    :local_governments_cd
      t.string    :past_zipcode
      t.string    :zipcode,             null: false, index: true
      t.string    :region_kana,         null: false
      t.string    :locality_kana,       null: false
      t.string    :street_address_kana, null: false
      t.string    :region,              null: false
      t.string    :locality,            null: false
      t.string    :street_address,      null: false
      t.integer   :flag_1,              default: 0,   null: false
      t.integer   :flag_2,              default: 0,   null: false
      t.integer   :flag_3,              default: 0,   null: false
      t.integer   :flag_4,              default: 0,   null: false
      t.integer   :view_update,         default: 0,   null: false
      t.integer   :reason,              default: 0,   null: false

      t.timestamps
    end
  end
end
