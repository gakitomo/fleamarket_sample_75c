class Category < ActiveHash::Base
  self.data = [
      {id: 1, level1: 'レディース', level1_children:[
                                                  {level2:"トップス 1-1",level2_children:["パーカー 1-1-1","ポロシャツ 1-1-2","キャミソール 1-1-3"]},
                                                  {level2:"スカート 1-2",level2_children:["ミニスカート 1-2-1","ロングスカート 1-2-2"]},
                                                  {level2:"アクセサリー 1-2",level2_children:["ネックレス 1-3-1","ブレスレッド 1-2-2","ピアス 1-3-3"]}
                                                  ]}, 
      {id: 2, level1: 'メンズ', level1_children:[
                                                  {level2:"トップス 1-1",level2_children:["パーカー 1-1-1","ポロシャツ 1-1-2","セーター 1-1-3"]},
                                                  {level2:"スーツ 1-2",level2_children:["スーツジャケット 1-2-1","スーツベスト 1-2-2"]},
                                                  {level2:"靴 1-2",level2_children:["スニーカー 1-3-1","サンダル 1-3-2","ブーツ 1-3-3"]}
                                                  ]}, 
      {id: 3, level1: 'ベビー、キッズ', level1_children:[
                                                  {level2:"おもちゃ 1-1",level2_children:["知育玩具 1-1-1","がらがら 1-1-2","オルゴール 1-1-3"]},
                                                  {level2:"寝具 1-2",level2_children:["ベッド 1-2-1","布団 1-2-2"]},
                                                  {level2:"キッズ靴 1-2",level2_children:["スニーカー 1-3-1","サンダル 1-3-2","長靴 1-3-3"]}
                                                  ]},
      {id: 4, name: 'インテリア、住まい、小物', level1_children:[
                                                  {level2:"キッチン 1-1",level2_children:["食器 1-1-1","調理器具 1-1-2","収納 1-1-3"]},
                                                  {level2:"ベッド 1-2",level2_children:["シングルベッド 1-2-1","ダブルベッド 1-2-2"]},
                                                  {level2:"ソファ 1-2",level2_children:["ソファセット 1-3-1","シングルソファ 1-3-2","ダブルソファ 1-3-3"]}
                                                  ]},
      {id: 5, name: '本、音楽、ゲーム',level1_children:[
                                                  {level2:"本 1-1",level2_children:["洋書 1-1-1","参考書 1-1-2","ビジネス 1-1-3"]},
                                                  {level2:"CD 1-2",level2_children:["邦楽 1-2-1","洋楽 1-2-2"]},
                                                  {level2:"ゲーム 1-2",level2_children:["家庭用ゲーム本体 1-3-1","家庭用ゲームソフト 1-3-2"]}
                                                  ]},
      {id: 6, name: 'おもちゃ、ホビー、グッズ'},
      {id: 7, name: 'コスメ、香水、美容'}, 
      {id: 8, name: '家電、スマホ、カメラ'}, 
      {id: 9, name: 'スポーツ、レジャー'},
      {id: 10, name: 'ハンドメイド'}, 
      {id: 11, name: 'チケット'}, 
      {id: 12, name: '自動車、オートバイ'},
      {id: 13, name: 'その他'}
  ]
  has_many :items
  has_ancestry
end