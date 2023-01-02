/-  osp=osprey, cha=chat, dia=diary, hyp=heap, gop=groups, spider
/+  *strandio, c=color
=,  strand=strand:spider
=<
  ::
  ^-  thread:spider
  |=  vaz=vase
  =/  m  (strand ,vase)
  ^-  form:m
  ::
  =/  data=(unit [t=type g=(each term flag) o=frag c=term j=(list jam)])
    !<((unit [type (each term flag) frag term (list jam)]) vaz)
  ?~  data  !!
  ;<  bol=bowl:rand  bind:m  get-bowl
  ?.  ?=(%& -.g.u.data)
    =+  mseed=(mc-abed:mc5 bol p.g.u.data o.u.data j.u.data t.u.data)
    ?~  make=(mc-make:mseed c.u.data)      
      %-  pure:m
      !>  ^-  updates:actions:osp
      [%restore t.u.data g.u.data o.u.data [our.bol c.u.data] %|]
    ::
    ;<  ~  bind:m  (send-raw-card u.make)
    ;<  ~  bind:m  (take-poke-ack /channel/create)
    =+  mc-abet:(mc-kick:mseed c.u.data)
    |-  
    ?~  caz
      %-  pure:m
      !>  ^-  updates:actions:osp
      [%restore t.u.data g.u.data o.u.data [our.bol c.u.data] dun]
    ;<  ~  bind:m  (send-raw-card i.caz)
    ;<  ~  bind:m  (take-poke-ack /osprey/upload)
    $(caz t.caz)
  ::                 
  ;<  ~  bind:m  (send-raw-card (mog p.g.u.data our.bol))
  ;<  ~  bind:m  (take-poke-ack /group/create)
  =+  mseed=(mc-abed:mc5 bol [our.bol p.g.u.data] o.u.data j.u.data t.u.data)
  ?~  make=(mc-make:mseed c.u.data)
    %-  pure:m
    !>  ^-  updates:actions:osp
    [%restore t.u.data g.u.data o.u.data [our.bol c.u.data] %|]
  ::
  ;<  ~  bind:m  (send-raw-card u.make)
  ;<  ~  bind:m  (take-poke-ack /channel/create)
  =+  mc-abet:(mc-kick:mseed c.u.data)
  |-  
  ?~  caz
    %-  pure:m
    !>  ^-  updates:actions:osp
    [%restore t.u.data g.u.data o.u.data [our.bol c.u.data] dun]
  ;<  ~  bind:m  (send-raw-card i.caz)
  ;<  ~  bind:m  (take-poke-ack /osprey/upload)
  $(caz t.caz)
::
|%
+$  card  card:agent:gall
+$  flag  flag:osp
+$  frag  frag:osp
+$  type  ?(%dm %club %chat %heap %diary)
::  +mog: makes a group
::
++  mog
  |=  [name=term =ship]
  ^-  card
  =+  colors=(lor `@ux`(shaw ship 25 name))
  =-  [%pass /group/create %agent [ship %groups] %poke -]
  :-  %group-create
  !>  ^-  create:gop
  [name name 'quartus wuz here' hot.colors not.colors [%open ~ ~] ~ %|]
::  +lor: a random color generator
::
++  lor
  |=  cul=@ux
  ^-  [hot=cord not=cord]
  =+  hsl=`get:c`lo-abet:(lo-abed:color:c hex+cul %hsl)
  =;  [a=get:c b=get:c]
    ?>(&(?=(%web -.a) ?=(%web -.b)) [+.a +.b])
  :-  lo-abet:(lo-abed:color:c hsl %web)
  ?>  ?=([%hsl [h=@rd s=@rd l=@rd]] hsl)
  ?:  (gth:rd .~0.5 s.hsl)
    =+  sat=`@rd`(add:rd .~0.3 s.hsl)
    lo-abet:(lo-sats:(lo-abed:color:c hsl %web) sat)
  =+  sat=`@rd`(sub s.hsl .~0.3)
  lo-abet:(lo-sats:(lo-abed:color:c hsl %web) sat)
::  +mc5: kicks out the jams
++  mc5
  |_  $:  bol=bowl:rand
          typ=type
          gro=flag
          ole=frag
          jams=(list jam)
          caz=(list card)
          dun=?
      ==
  +*  mc  .
      old  ?+(typ ;;(flag ole) %dm ;;(ship ole), %club ;;(@uv ole))
  ++  mc-emit  |=(c=card mc(caz [c caz]))
  ++  mc-emil  |=(lac=(list card) mc(caz (welp lac caz)))
  ++  mc-abet  [caz=(flop caz) dun=dun]
  ++  mc-abed
    |=  [b=_bol g=flag o=frag j=_jams t=type]
    mc(bol b, typ t, gro g, ole o, jams j)
  ++  mc-kick
    |=  nam=term
    ^+  mc
    ?-    typ
      %dm    !!
      %club  !!
    ::
        %chat
      =;  lac=(list card)
        ~&  >  lac
        (mc-emil(dun %&) lac)
      %-  zing  %+  turn  jams
      |=  j=jam
      %+  turn  ;;((list [@da diff:cha]) (cue j))
      |=  [t=@da d=diff:cha]
      ^-  card
      :+  %pass  /osprey/upload
      :^  %agent  [our.bol %chat]  %poke
      chat-action-0+!>(`action:cha`[[our.bol nam] [t d]])
    ::
        %heap
      =;  lac=(list card)
        ~&  >>  lac
        (mc-emil(dun %&) lac)
      %-  zing  %+  turn  jams
      |=  j=jam
      %+  turn  ;;((list [@da diff:hyp]) (cue j))
      |=  [t=@da d=diff:hyp]
      ^-  card
      :+  %pass  /osprey/upload
      :^  %agent  [our.bol %heap]  %poke
      heap-action-0+!>(`action:hyp`[[our.bol nam] [t d]])
    ::
        %diary
      =;  lac=(list card)
        ~&  >>>  lac
        (mc-emil(dun %&) lac)
      %-  zing  %+  turn  jams
      |=  j=jam
      %+  turn  ;;((list [@da diff:dia]) (cue j))
      |=  [t=@da d=diff:dia]
      ^-  card
      :+  %pass  /osprey/upload
      :^  %agent  [our.bol %diary]  %poke
      diary-action-0+!>(`action:dia`[[our.bol nam] [t d]])
    ==
  ++  mc-make
    |=  nam=term
    ^-  (unit card)
    ?-    typ
      %dm    ~
      %club  ~
    ::
        %chat
      =-  `[%pass /channel/create %agent [our.bol %chat] %poke -]
      chat-create+!>(`create:cha`[gro nam nam 'quartus wuz here' ~ ~])
    ::
        %heap
      =-  `[%pass /channel/create %agent [our.bol %heap] %poke -]
      heap-create+!>(`create:hyp`[gro nam nam 'quartus wuz here' ~ ~])
    ::
        %diary
      =-  `[%pass /channel/create %agent [our.bol %diary] %poke -]
      diary-create+!>(`create:dia`[gro nam nam 'quartus wuz here' ~ ~])
    ==
  :: ++  dm
  ::   |=  jams=(list jams)

  :: ++  club
  ::   |=  jams=(list jams)

  :: ++  chat
  ::   |=  jams=(list jams)
    
  :: ++  heap
  ::   |=  jams=(list jams)

  :: ++  diary
  ::   |=  jams=(list jams)

  --
--