/-  cha=chat, p=parrot

|%
++  enjs
  =,  enjs:format
  |%
  ++  ship  (corl (lead %s) (cury scot %p))
  ++  flag
    |=  f=flag:p
    ^-  json
    s/(rap 3 (scot %p p.f) '/' q.f ~)
  ++  vite
    |=  [a=area:p n=cord w=@da]
    (pairs ~[area+s/a note+s/n when+(sect w)])
  ++  sate
    |=  sat=status:p
    ^-  json
    ?@  sat
      ?-  sat
        %deleted   (pairs ~[title+s/'DELETED' when+~])
        %transmit  (pairs ~[title+s/'TRANSMITTED' when+~])
      ==
    ?-  -.sat
      %received  (pairs ~[title+s/'RECEIVED' when+(sect +.sat)])
      %rejected  (pairs ~[title+s/'REJECTED' when+(sect +.sat)])
      %affirmed  (pairs ~[title+s/'AFFIRMED' when+(sect +.sat)])
    ==
  ++  pack
    |_  [f=cord j=json]
    ++  fact
      `json`(pairs ~[type+s/'FACT' face+s/f fact+j])
    ++  scry
      `json`(pairs ~[type+s/'SCRY' face+s/f fact+j])
    --
  ++  invite
    |=  inv=invite:actions:p
    %~  fact  pack
    :-  'INVITE-RECEIVED-BIRD'
    %-  pairs
    :~  host+(flag host.inv)
        invite+?:(?=(%took -.inv) s/'RESCINDED' (vite inv.inv))
    ==
  ++  denies
    |=  den=denies:actions:p
    %~  fact  pack
    :-  'INVITE-REPLIED-HOST'
    %-  pairs
    :~  area+s/area.den
        who+(ship who.den)
        status+(pairs ~[status+s/'REJECTED' when+(sect wen.den)])
    ==
  ++  leaves
    |=  lef=leaves:actions:p
    ?:  host.lef
      (action `actions:p`[%drop area.lef ~])
    %~  fact  pack
    :-  'FLOCK-TEAM-REMOVE'
    (pairs ~[area+s/area.lef what+(flag wat.lef)])
  ++  status
    |=  sat=status:actions:p
    %~  fact  pack
    :-  'INVITE-STATUS-UPDATE'
    %-  pairs
    :~  area+s/area.sat
        who+(ship who.sat)
        status+(sate sat.sat)
    ==
    ::
      :: :-  %status
      :: ?@  sat.sat
      ::   ?-  sat.sat
      ::     %deleted   (pairs ~[title+s/'DELETED' when+~])
      ::     %transmit  (pairs ~[title+s/'TRANSMITTED' when+~])
      ::   ==
      :: ?-  -.sat.sat
      ::   %received  (pairs ~[title+s/'RECEIVED' when+(sect +.sat.sat)])
      ::   %rejected  (pairs ~[title+s/'REJECTED' when+(sect +.sat.sat)])
      ::   %affirmed  (pairs ~[title+s/'AFFIRMED' when+(sect +.sat.sat)])
      :: ==
    :: ==
  ++  action
    |=  act=actions:p
    ^-  json
    ?:  ?=(?(%kick %test %blok %free %join) -.act)
      ?-    -.act
        %kick  ~(fact pack 'KICK' ~)
        %test  ~(fact pack 'KICK' ~)
        %blok  ~(fact pack 'BLOCK-LIST' (blok:act-json +.act))
        %free  ~(fact pack 'BLOCK-LIST' (free:act-json +.act))
        %join  ~(fact pack 'INVITE-REPLIED-BIRD' (join:act-json +.act))
      ==
    ?>  ?=(?(%drop %form %send) -.act)
    =+  enjon=~(. act-json area.act)
    ?-  -.act
      %drop  ~(fact pack 'FLOCK-FLOCK-CEASE' drop:enjon)
      %form  ~(fact pack 'FLOCK-FLOCK-START' (form:enjon chat.act))
    ::
    ::
        %send
      ?-  -.buds.act
        %&   ~(fact pack 'INVITE-SEND-INVITES' (send:enjon p.buds.act))
        %|   ~(fact pack 'INVITE-SEND-RETRACT' (yank:enjon p.buds.act))
      ==
    ==
  ++  act-json
    |_  a=term
    +*  area  area+s/a
    ++  drop  (frond area)
    ++  yank  |=(t=@p (pairs ~[area them+(ship t)]))
    ++  send
      |=  [n=cord b=(set @p)]
      (pairs ~[area note+s/n buds+a/(turn ~(tap in b) ship)])
    ::
    ++  blok  |=(b=flag:p (pairs ~[host+(flag b) act+s/'BLOCKED']))
    ++  free  |=(f=flag:p (pairs ~[host+(flag f) act+s/'ALLOWED']))
    ::
    ++  form  |=(c=flag:p (pairs ~[area chat+(flag c)]))
    ++  join
      |=  [f=flag:p u=(unit flag:p)]
      %-  pairs
      ?~  u  ~[area act+s/'DECLINED' host+(flag f) chat+~]
      ~[area act+s/'ACCEPTED' host+(flag f) chat+(flag u.u)]
    --
  ++  state
    |%
    ++  blok
      |=(b=blok:p (frond blocked-hosts+a/(turn ~(tap in b) flag)))
    ++  aval
      |=(a=(set flag:p) (frond available-chats+a/(turn ~(tap in a) flag)))
    ++  pend
      |=  p=pend:p
      %-  frond
      :-  %pending-invites
      :-  %a  %+  turn  ~(tap by p)
      |=  [f=flag:^p i=invite:^p]
      (pairs ~[host+(flag f) invitation+(vite i)])
    ++  sent
      |=  s=sent:p
      %-  frond
      :-  %sent-invites
      :-  %a  %+  turn  ~(tap by s)
      |=  [a=area:p s=(set [@p invite:p status:p])]
      %-  pairs
      :~  area+s/a
      ::
        :-  %invites
        :-  %a  %+  turn  ~(tap in s)
        |=  [w=@p i=invite:p s=status:p]
        %-  pairs
        ~[to+(ship w) invitation+(vite i) status+(sate s)]
      ==
    ++  flok
      |=  f=flok:p
      %-  frond
      :-  %existing-flocks
      :-  %a  %+  turn  ~(tap by f)
      |=  [a=area:p h=flag:p t=(set flag:p)]
      %-  pairs
      :~  area+s/a
          host+(flag h)
          team+a/(turn ~(tap in t) flag)
      ==
    --
  --
++  dejs
  =,  dejs:format
  |%
  ++  ship  ;~(pfix sig fed:ag)
  ++  flag  `$-(json flag:p)`(su flag-rule)
  ++  flag-rule  ;~((glue fas) ship sym)
  ++  flug
    ^-  $-(json (unit flag:p))
    |=(jon=json ?~(jon ~ `(flag jon)))
  ++  buds
    ^-  $-(json (each [note=cord them=(set @p)] @p))
    |=  jon=json
    ?.  =(%o -.jon)
      |/((su ship) jon)
    :-  %&
    %.  jon
    %-  ot
    :~  note+so
        them+(as (su ship))
    ==
  ++  action
    ^-  $-(json actions:p)
    %-  of
    :~  kick+(cu |=(* ~) same)
        test+(cu |=(* ~) same)
        blok+(ot [flag+flag]~)
        free+(ot [flag+flag]~)
        join+(ot ~[host+flag join+flug])
        drop+(cu |=(a=area:p [a ~]) (ot [area+so]~))
        form+(ot ~[area+so chat+flag])
        send+(ot ~[area+so buds+buds])
    ==
  --
--