/-  cha=chat, o=osprey
/+  multi=multipart
|%
++  enjs
  =,  enjs:format
  |%
  ++  ship  (corl (lead %s) (cury scot %p))
  ++  flag  |=(f=flag:o `json`s/(rap 3 (scot %p p.f) '/' q.f ~))
  ++  pack
    |=  [typ=@t faz=@t pay=json]
    (pairs type+s/typ face+s/faz fact+pay ~)
  ++  aval
    |=  [typ=@t flg=(set flag:o)]
    ^-  json
    %^  pack  'SCRY'
      (cat 3 'OSPREY-HOSTED-' typ)
    a/(turn ~(tap in flg) flag)
  ++  club
    |=  clb=(set @uvH)
    ^-  json
    %^  pack  'SCRY'
      'OSPREY-HOSTED-CLUBS'
    a/(turn ~(tap in clb) (corl (lead %s) (cury scot %uv)))
  ++  dems
    |=  sip=(set @p)
    ^-  json
    %^  pack  'SCRY'
      'OSPREY-HOSTED-DMS'
    a/(turn ~(tap in sip) ship)
  ++  schedule
    |=  schd=(map archive:actions:o [@da @dr])
    ^-  json
    %^  pack  'SCRY'
      'OSPREY-STATE-SCHEDULE'
    :-  %a
    %+  turn  ~(tap by schd)
    |=  [a=archive:actions:o l=@da e=@dr]
    %-  pairs
    :~  last+(sect l)
        next+(sect (add l e))
    ::
      ?-    -.a
        %mine   area+(pairs type+s/'ALL HOSTED' ~)
        %heap   area+(pairs type+s/'HEAP' flag+(flag wat.a) ~)
        %diary  area+(pairs type+s/'DIARY' flag+(flag wat.a) ~)
        %group  area+(pairs type+s/'GROUP' flag+(flag wat.a) ~)
      ::
          %chat
        ?-  -.wat.a
          %flag  area+(pairs type+s/'CHAT' flag+(flag p.wat.a) ~)
          %ship  area+(pairs type+s/'DM' ship+(ship p.wat.a) ~)
          %club  area+(pairs type+s/'CLUB' club+s/(scot %uv p.wat.a) ~)
        ==
      ==
    ==
  ++  actions
    |=  act=actions:o
    ?-    -.act
        ?(%mine %heap %diary %chat %group)
      (pack 'FACT' 'ARCHIVE-START' (frond what+(archive act)))
    ::
        %boot
      %^  pack  'FACT'
        'BOOTING'
      (pairs rank+s/rank.act where+(flag group.act) ~)
    ::
        %doom
      %^  pack  'FACT'
        'DOOMING'
      %-  pairs
      ~[seconds+(numb (div age.act ~s1)) where+(flag group.act)]
    ::
        %repeat
      ?~  oft.act
        %^  pack  'FACT'
          'ARCHIVE-SCHEDULE-CANCEL'
        (pairs what+(archive arc.act) frequency+~ ~)
      %^  pack  'FACT'
        'ARCHIVE-SCHEDULE-SET'
      %-  pairs
      :~  what+(archive arc.act)
          frequency+(numb (div u.oft.act ~s1))
      ==
    ==
  ++  updates
    |=  upd=updates:actions:o
    ^-  json
    ?-    -.upd
        %bootbot
      %^  pack  'FACT'
        'BOOTBOT-COMPLETE'
      %-  pairs
      :~  killed+s/rank.upd
          group+(flag gop.upd)
      ==
    ::
        %doombot
      %^  pack  'FACT'
        'DOOMBOT-RESULTS'
      %-  pairs
      :~  killed+a/(turn ~(tap in sip.upd) ship)
          group+(flag gop.upd)
      ==
    ::
        %archive
      %^  pack  'FACT'
        'ARCHIVE-STATUS-UPDATE'
      %-  pairs
      :~  archiving+(archive ark.upd)
          total+(numb tot.upd)
          complete+(numb don.upd)
          done+b/=(don.upd tot.upd)
      ==
    ::
        %restore
      %^  pack  'FACT'
        'RESTORE-STATUS-UPDATE'
      %-  pairs
      :~  channel-type+s/typ.upd
          succeeded+b/don.upd
        :-  %group
        ?:  ?=(%& -.gro.upd)
          (pairs ~[type+s/'NEW' name+s/p.gro.upd])
        (pairs ~[type+s/'OLD' flag+(flag p.gro.upd)])
      ::
        :-  %old-channel
        ?+  typ.upd  (flag ;;(flag:o ole.upd))
          %dm    (ship ;;(@p ole.upd))
          %club  s/(scot %uv ;;(@uv ole.upd))
        ==
      ::
        :-  %new-channel
        ?+  typ.upd  (flag ;;(flag:o new.upd))
          %dm    (ship ;;(@p new.upd))
          %club  s/(scot %uv ;;(@uv new.upd))
        ==
      ==
    ==
  ++  archive
    |=  arc=archive:actions:o
    |^
    ^-  json
      ?-  -.arc
        %mine   (pairs type+s/'ALL-HOSTED' path+~ ~)
        %heap   (pairs type+s/'HEAP' path+(flag wat.arc) ~)
        %diary  (pairs type+s/'DIARY' path+(flag wat.arc) ~)
        %chat   (pairs type+s/'CHAT' path+(chat wat.arc) ~)
        %group  (pairs type+s/'GROUP' path+(flag wat.arc) ~)
      ==
    ++  chat
      |=  who=whom:cha
      ?-  -.who
        %flag  (flag p.who)
        %ship  s/(cat 3 'dm/' (scot %p p.who))
        %club  s/(cat 3 'club/' (scot %uv p.who))
      ==
    --
  --
++  dejs
  =,  dejs:format
  |%
  ++  ship  ;~(pfix sig fed:ag)
  ++  flag  `$-(json flag:o)`(su flag-rule)
  ++  flag-rule  ;~((glue fas) ship sym)
  ++  flug
    ^-  $-(json (unit flag:o))
    |=(jon=json ?~(jon ~ `(flag jon)))
  ++  chat
    ^-  $-(json whom:cha)
    %-  of
    :~  flag+flag
        ship+(su ship)
        club+(se %uv)
    ==
  ++  actions
    ^-  $-(json actions:o)
    %-  of
    :~  mine+(cu |=(* ~) same)
        heap+flag
        diary+flag
        group+flag
        chat+chat
    ==
  --
--