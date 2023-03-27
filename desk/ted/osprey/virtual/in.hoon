/-  osp=osprey, cha=chat, dia=diary, hyp=heap, gop=groups, spider
/+  *strandio, c=color
=,  strand=strand:spider
=<
  ::
  ^-  thread:spider
  |=  vaz=vase
  =/  m  (strand ,vase)
  ^-  form:m
  =/  rug=(unit read)  !<((unit read) vaz)
  ;<  =bowl:rand  bind:m  get-bowl
  ?~  rug  (pure:m !>(~))
  =+  maker=^+(mak (ma-abed:mak bowl u.rug))
  ;<  ~  bind:m  (send-raw-card mog:ma-card:maker)
  ;<  ~  bind:m  (take-poke-ack /osprey/group/create)
  ;<  ~  bind:m  (sleep (div ~s1 100))
  =/  and=(list flag:osp)
    (turn wic.u.rug |=([@ w=flag:osp n=@tas] [our.bowl n]))
  =/  lead  `(unit (list card))`lead:ma-card:maker
  =/  team  `(unit (list card))`team:ma-card:maker
  =/  work  `opts`wic.u.rug
  |-
  =*  buc  $
  ?~  work
    =/  end
      %-  pure:m
      !>  ^-  updates:actions:osp
      refresh+[[our.bowl wer.u.rug] and wit.u.rug]
    ?~  lead
      ?~  team  end
      |-  ?~  u.team  end
      ;<  ~  bind:m  (send-raw-card i.u.team)
      ;<  ~  bind:m  (take-poke-ack /osprey/group/memb)
      $(u.team t.u.team)
    ?~  team
      |-  ?~  u.lead  end
      ;<  ~  bind:m  (send-raw-card i.u.lead)
      ;<  ~  bind:m  (take-poke-ack /osprey/group/lead)
      $(u.lead t.u.lead)
    |-
    ?~  u.team
      ?~  u.lead  end
      ;<  ~  bind:m  (send-raw-card i.u.lead)
      ;<  ~  bind:m  (take-poke-ack /osprey/group/lead)
      $(u.lead t.u.lead)
    ;<  ~  bind:m  (send-raw-card i.u.team)
    ;<  ~  bind:m  (take-poke-ack /osprey/group/memb)
    $(u.team t.u.team)
  ::
  ?-    hed.i.work
      %chat
    =+  car=(chat:ma-card:maker [wat wer]:i.work)
    |-  ?~  car  buc(work t.work)
    ;<  ~  bind:m  (send-raw-card i.car)
    ;<  ~  bind:m  (take-poke-ack /osprey/chat)
    ;<  ~  bind:m  (sleep (div ~s1 100))
    $(car t.car)
      %heap
    =+  hap=(heap:ma-card:maker [wat wer]:i.work)
    |-  ?~  hap  buc(work t.work)
    ;<  ~  bind:m  (send-raw-card i.hap)
    ;<  ~  bind:m  (take-poke-ack /osprey/heap)
    ;<  ~  bind:m  (sleep (div ~s1 100))
    $(hap t.hap)
      %note
    =+  not=(note:ma-card:maker [wat wer]:i.work)
    |-  ?~  not  buc(work t.work)
    ;<  ~  bind:m  (send-raw-card i.not)
    ;<  ~  bind:m  (take-poke-ack /osprey/note)
    ;<  ~  bind:m  (sleep (div ~s1 100))
    $(not t.not)
  ==
|%
+$  card  card:agent:gall
+$  read
  $:  [who=@p wat=flag:osp wer=@tas wit=[m=? a=?] wic=opts]
      membs=(list @p)
      admin=(list @p)
      mails=(list email:osp)
  ==
+$  opts
  (list [hed=?(%chat %heap %note) wat=flag:osp wer=@tas])
++  mak
  |_  $:  bol=bowl:rand
          new-group=flag:osp
          old-chats=(map flag:osp log:cha)
          old-heaps=(map flag:osp log:hyp)
          old-notes=(map flag:osp log:dia)
          member=(list @p)
          admins=(list @p)
          option=opts
      ==
  +*  mak  .
      mon  |$([a] ((on @da a) lte))
      doc  [our.bol %chat]
      doh  [our.bol %heap]
      dod  [our.bol %diary]
      dog  [our.bol %groups]
  ++  ma-abed
    |=  [b=bowl:rand r=read]
    ^+  mak
    =.  mak  (ma-maps mails.r)
    %=  mak
      bol        b
      new-group  [our.b wer.r]
      member     ?-(m.wit.r %& membs.r, %| ~)
      admins     ?-(a.wit.r %& admin.r, %| ~)
      option     wic.r
    ==
  ++  ma-card
    |%
    ++  moc  (mon diff:cha)
    ++  moh  (mon diff:hyp)
    ++  mod  (mon diff:dia)
    ++  mog
      ^-  card
      =+  colors=(lor `@ux`(shaw p.new-group 25 q.new-group))
      =-  [%pass /osprey/group/create %agent dog %poke -]
      :-  %group-create
      !>  ^-  create:gop
      :^  q.new-group  q.new-group  'quartus wuz here'
      [hot.colors not.colors [%open ~ ~] ~ %|]
    ++  team
      ^-  (unit (list card))
      ?~  member  ~
      :-  ~
      %+  turn  member
      |=  p=@p
      =-  [%pass /osprey/group/memb %agent dog %poke -]
      group-invite+!>([new-group p])
    ++  lead
      ^-  (unit (list card))
      ?~  admins  ~
      :-  ~
      %-  flop
      :-  ^-  card
          =-  [%pass /osprey/group/admin %agent dog %poke -]
          :-  %group-action-0
          !>  ^-  action:gop
          :+  new-group  now.bol
          fleet+[(sy admins) add-sects+(sy [%admin]~)]
      %+  turn  admins
      |=  p=@p
      ^-  card
      =-  [%pass /osprey/group/admin %agent dog %poke -]
      group-invite+!>([new-group p])
    ++  chat
      |=  [o=flag:osp n=@tas]
      ^-  (list card)
      :-
        =-  [%pass /osprey/chat %agent doc %poke -]
        :-  %chat-create
        !>  ^-  create:cha
        [new-group n n 'quartus wuz here' ~ ~]
      %+  murn  (tap:moc (~(got by old-chats) o))
      |=  [t=@da d=diff:cha]
      ^-  (unit card)
      =;  make=$-(diff:cha (unit card))
        ?:  ?=(%create -.d)  ~
        ?.  ?=([%writs *] d)                (make d)
        ?.  ?=([%add *] q.p.d)              (make d)
        ?.  ?=([%story *] content.p.q.p.d)  (make d)
        =.  p.p.content.p.q.p.d
          ^-  (list block:cha)
          %+  turn  p.p.content.p.q.p.d
          |=  b=block:cha
          ?.  ?=([%cite %chan *] b)  b
          ?.  =(nest.cite.b [%chat o])  b
          b(nest.cite [%chat our.bol n])
        (make d)
      |=  dif=diff:cha
      =-  `[%pass /osprey/chat %agent doc %poke -]
      chat-action-0+!>(`action:cha`[[our.bol n] t dif])
    ++  heap
      |=  [o=flag:osp n=@tas]
      ^-  (list card)
      :-
        =-  [%pass /osprey/heap %agent doh %poke -]
        :-  %heap-create
        !>  ^-  create:hyp
        [new-group n n 'quartus wuz here' ~ ~]
      %+  murn  (tap:moh (~(got by old-heaps) o))
      |=  [t=@da d=diff:hyp]
      =;  make=$-(diff:hyp (unit card))
        ?:  ?=(%create -.d)  ~
        ?.  ?=([%curios *] d)   (make d)
        ?.  ?=([%add *] q.p.d)  (make d)
        =.  p.content.p.q.p.d
          ^-  (list block:hyp)
          %+  turn  p.content.p.q.p.d
          |=  b=block:hyp
          ?.  ?=([%cite %chan *] b)  b
          ?.  =(nest.cite.b [%heap o])  b
          b(nest.cite [%heap our.bol n])
        (make d)
      |=  dif=diff:hyp
      =-  `[%pass /osprey/heap %agent doh %poke -]
      heap-action-0+!>(`action:hyp`[[our.bol n] t dif])
    ++  note
      |=  [o=flag:osp n=@tas]
      ^-  (list card)
      :-
        =-  [%pass /osprey/note %agent dod %poke -]
        :-  %diary-create
        !>  ^-  create:dia
        [new-group n n 'quartus wuz here' ~ ~]
      %+  murn  (tap:mod (~(got by old-notes) o))
      |=  [t=@da d=diff:dia]
      =;  make=$-(diff:dia (unit card))
        ?:  ?=(%create -.d)  ~
        ?.  ?=([%notes *] d)  (make d)
        ?.  ?=([%add *] q.p.d)
          (make d)
        =.  content.p.q.p.d
          %+  turn  content.p.q.p.d
          |=  v=verse:dia
          ?.  ?=([%block %cite %chan *] v)  v
          ?.  =(nest.cite.p.v [%diary o])   v
          v(nest.cite.p [%diary our.bol n])
        (make d)
      |=  dif=diff:dia
      =-  `[%pass /osprey/note %agent dod %poke -]
      diary-action-0+!>(`action:dia`[[our.bol n] t dif])
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
    --
  ++  ma-maps
    |=  l=(list email:osp)
    ^+  mak
    =*  maps  |$(value (map flag:osp value))
    =;  [chat=(maps log:cha) heap=(maps log:hyp) note=(maps log:dia)]
      %=  mak
        old-chats  chat
        old-heaps  heap
        old-notes  note
      ==
    %+  roll  l
    |=  $:  e=email:osp
            $:  c=(maps log:cha)
                h=(maps log:hyp)
                n=(maps log:dia)
            ==
        ==
    ?-    -.e
      %chat-log  [(~(put by c) p.e q.e) h n]
      %heap-log  [c (~(put by h) p.e q.e) n]
      %note-log  [c h (~(put by n) p.e q.e)]
    ==
  --
--