/-  cha=chat, o=osprey
/+  multi=multipart, *mip
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
  ++  mailslot
    |=  mail=mailslot:o
    %^  pack  'SCRY'
      'OSPREY-MAILSLOT'
    %-  pairs
    %-  ~(rep by mail)
    |=  $:  $:  k=@p
                v=(map flag:o (unit [(list @p) (list @p) (list email:o)]))
            ==
            o=(list [@t json])
        ==
    :_  o
    :+  (scot %p k)  %a
    ^-  (list json)
    %-  ~(rep by v)
    |=  [[f=flag:^o d=(unit [m=(list @p) a=(list @p) e=(list email:^o)])] l=(list json)]
    :_  l
    %-  pairs
    :~  group+(flag f)
      ::
        :-  %data
        ?~  d  s/'NONE'
        %-  pairs
        :~  members+a/(turn m.u.d ship)
            admins+a/(turn a.u.d ship)
            :+  %included-files
              %a
            %+  turn  e.u.d
            |=  e=email:^o
            %-  pairs
            ?-    -.e
              %chat-log  ~[type+s/'chat' flag+(flag p.e)]
              %heap-log  ~[type+s/'heap' flag+(flag p.e)]
              %note-log  ~[type+s/'diary' flag+(flag p.e)]
            ==
        ==
    ==
  ++  on-trial
    |=  kick=on-trial:o
    %^  pack  'SCRY'
      'OSPREY-ON-TRIAL'
    %-  pairs
    %-  ~(rep by kick)
    |=  $:  [k=@uv v=(set [flag ? ?(%doom %boot) @ud @dr nade:o])]
            o=(list [@t json])
        ==
    :_  o
    :-  (scot %uv k)
    ^-  (list json)
    %-  ~(rep in v)
    |=  [[f=flag p=? t=?(%doom %boot) u=@ud d=@dr e=nade:o] l=(list json)]
    :_  l
    %-  pairs
    :~  flag+(flag f)
        pending+b/p
        type+s/t
        limit+s/(crip (a-co:co limit))
        age+s/(scot %dr d)
        ships+?@(e s/'Pending' a/(turn e ship))
    ==
  ++  actions
    |=  act=actions:o
    ?-    -.act
        ?(%mine %heap %diary %chat %group)
      (pack 'FACT' 'ARCHIVE-START' (frond archiving+(archive act)))
    ::
        %kill
      %^  pack  'FACT'
        'VIRTUAL-CLOSE-MAILSLOT'
      (pairs host+(ship who.act) group+(flag wat.act) ~)
    ::
        %read
      %^  pack  'FACT'
        'VIRTUAL-READ-MAIL-TO-GROUPS'
      %-  pairs
      :~  old-host+(ship who.act)
          old-group+(flag wat.act)
          new-group+s/wer.act
          include-members+b/mem.wit.act
          include-admins+b/adm.wit.act
        ::
          :+  %include-resources  %a
          %+  turn  wic.act
          |=  [h=?(%chat %heap %note) o=flag:o n=@tas]
          %-  pairs
          :~  type+s/h
              old-resource+(flag o)
              new-resource+s/n
          ==
      ==
    ::
        %open
      %^  pack  'FACT'
        'VIRTUAL-OPEN-MAILSLOT'
      (pairs host+(ship who.act) group+(flag wat.act) ~)
    ::
        %mail
      %^  pack  'FACT'
        'VIRTUAL-SEND-MAILS'
      (pairs recipient+(ship who.act) group+(flag wat.act) ~)
    ::
        %take
      %^  pack  'FACT'
        'VIRTUAL-MAIL-RECEIVED'
      (frond group+(flag wat.act))
    ::
        %boot
      %^  pack  'FACT'
        'KICK-BOOTING'
      (pairs rank+s/rank.act group+(flag group.act) ~)
    ::
        %doom
      %^  pack  'FACT'
        'KICK-DOOMING'
      %-  pairs
      ~[seconds+(numb (div age.act ~s1)) group+(flag group.act)]
    ::
        %exec
      %^  pack  'FACT'
        'KICK-EXECUTING'
      (frond id+s/(scot %uv id.act))
    ::
        %stop
      %^  pack  'FACT'
        'KICK-PARDONING'
      (frond id+s/(scot %uv id.act))
    ::
        %repeat
      ?~  oft.act
        %^  pack  'FACT'
          'ARCHIVE-SCHEDULE-CANCEL'
        (pairs archiving+(archive arc.act) frequency+~ ~)
      %^  pack  'FACT'
        'ARCHIVE-SCHEDULE-SET'
      %-  pairs
      :~  archiving+(archive arc.act)
          frequency+(numb (div u.oft.act ~s1))
      ==
    ==
  ++  updates
    |=  upd=updates:actions:o
    ^-  json
    ?-    -.upd
        %bootbot
      %^  pack  'FACT'
        'KICK-BOOTBOT-INITIALIZED'
      (frond id+(scot %uv id.upd))
    ::
        %doombot
      %^  pack  'FACT'
        'KICK-DOOMBOT-INITIALIZED'
      (frond id+(scot %uv id.upd))
    ::
        %kick-em
      %^  pack  'FACT'
        'KICK-PREVIEW'
      %-  pairs
      :~  id+s/(scot %uv id.upd)
          ships+a/(turn sip.upd ship)
      ==
    ::
        %destroy
      %^  pack  'FACT'
        'KICK-COMPLETED'
      (frond id+(scot %uv id.upd))
    ::
        %ignored
      %^  pack  'FACT'
        'KICK-IGNORED'
      (frond id+(scot %uv id.upd))
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
        %sending
      %^  pack  'FACT'
        'VIRTUAL-SENT-MAIL'
      %-  pairs
      :~  old-group+(flag gro.upd)
          old-graphs+a/(turn con.upd |=([@ p=flag:o *] (flag p)))
      ==
    ::
        %refresh
      %^  pack  'FACT'
        'VIRTUAL-READ-MAIL-TO-GROUPS-COMPLETE'
      %-  pairs
      :~  new-group+(flag new.upd)
          new-graphs+a/(turn and.upd |=(flag:o (flag +<)))
          include-members+b/mem.wit.upd
          include-administrators+b/adm.wit.upd
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
  ++  archive
    ^-  $-(json archive:actions:o)
    %-  of
    :~  mine+(cu |=(* ~) same)
        heap+flag
        diary+flag
        group+flag
        chat+chat
    ==
  ++  actions
    ^-  $-(json actions:o)
    %-  of
    :~  mine+(cu |=(* ~) same)
        heap+flag
        diary+flag
        group+flag
        chat+chat
        mail+(ot ~[recipient+(su ship) group+flag])
        open+(ot ~[host+(su ship) group+flag])
        kill+(ot ~[host+(su ship) group+flag])
    ::
      :-  %doom
      %-  ot
      :~  limit+ni
          age+(cu |=(i=@ud `@dr`(mul ~s1 i)) ni)
          group+flag
      ==
    ::
      :-  %boot
      %-  ot
      :~  rank+(cu |=(t=@tas ;;(rank:title t)) so)
          group+flag
      ==
    ::
      exec+(ot [id+(se %uv)]~)
      stop+(ot [id+(se %uv)]~)
    ::
      :-  %repeat
      %-  ot
      :~  archive+archive
      ::
        :-  %frequency
        %-  cu  :_  ni:dejs-soft:format
        |=(i=(unit @ud) ?~(i ~ ``@dr`(mul ~s1 u.i)))
      ==
    ::
      :-  %read
      %-  ot
      :~  host+(su ship)
          group+flag
          new-group-name+so
          roster+(ot ~[members+bo administrators+bo])
        ::
          :-  %include
          %-  ar
          %+  cu
            |=  [h=@t w=flag:o n=@tas]
            [;;(?(%chat %heap %note) h) w n]
          (ot ~[type+so old-resource+flag new-resource-name+so])
      ==
    ==
  --
--